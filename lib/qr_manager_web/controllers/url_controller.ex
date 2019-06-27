defmodule QrManagerWeb.URLController do
  use QrManagerWeb, :controller

  import Ecto.Query

  alias QrManager.URLManager
  alias QrManager.URLManager.URL

  defp extract(url) do
    url
    |> Map.take([:url, :id, :name, :number_of_access, :representation, :inserted_at, :updated_at])
  end

  defp validate_uri(str) do
    uri = URI.parse(str)
    case uri do
      %URI{scheme: nil} -> {:error, uri}
      %URI{host: nil} -> {:error, uri}
          uri -> if(uri.scheme == "http" or uri.scheme == "https", do: {:ok, uri}, else: {:error, uri})
    end
  end

  def index(conn, _params) do
    user = conn.assigns[:user]
    if user != nil do
      urls = URL |> Ecto.Query.where(user_id: ^user.id) |> QrManager.Repo.all()
      json(conn, %{"liste" => Enum.map(urls, &extract/1)})
    else
      send_resp conn, 401, "You are not connected"
    end
  end

  def create(conn, params) do
    user = conn.assigns[:user]
    if user != nil do
     str = params["url"]
     case validate_uri(str) do
       {:ok, _uri} -> {:ok, url} = URLManager.create_url(Map.put(params, "user_id", user.id))
       conn
       |> put_flash(:info, "Url created successfully.")
       |> redirect(to: Routes.url_path(conn, :show, url.id))
       {:error, _uri} -> send_resp(conn, 400, "bad request")
     else
      send_resp conn, 401, "You are not connected"
     end
  end

  def show(conn, %{"id" => id}) do
    user = conn.assigns[:user]
    url = URLManager.get_url!(id)
    cond do
      user == nil -> send_resp(conn, 401, "You are not connected")
      user.id != url.user_id -> send_resp(conn, 403, "forbidden")
      true -> json(conn, extract(url))
    end
  end

  def update(conn, %{"id" => id, "url" => url_params}) do
    user = conn.assigns[:user]
    url = URLManager.get_url!(id)
    cond do
      user == nil -> send_resp(conn, 401, "You are not connected")
      user.id != url.user_id -> send_resp(conn, 403, "forbidden")
      true -> {:ok, url} = URLManager.update_url(url, url_params)
        json(conn, extract(url))
    end
  end

  def delete(conn, %{"id" => id}) do
    user = conn.assigns[:user]
    url = URLManager.get_url!(id)
    cond do
      user == nil -> send_resp(conn, 401, "You are not connected")
      user.id != url.user_id -> send_resp(conn, 403, "forbidden")
      true -> {:ok, _url} = URLManager.delete_url(url)
         send_resp(conn, 204, "no content")
    end
  end

  # TODO: stats by month/week, url
  def stats(conn, %{"id" => id}), do: show(conn, %{"id" => id})
  def stats(conn, _params), do: index(conn, _params)

  def redirection(conn, %{"id" => id}) do
    URL
    |> where(id: ^id)
    |> QrManager.Repo.update_all(inc: [number_of_access: 1])

    url = URLManager.get_url!(id).url
    redirect(conn, external: url)
  end
end
