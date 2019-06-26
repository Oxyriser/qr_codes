defmodule QrManagerWeb.URLController do
  use QrManagerWeb, :controller

  import Ecto.Query

  alias QrManager.URLManager
  alias QrManager.URLManager.URL

  def index(conn, _params) do
    user = conn.assigns[:user]
    if user != nil do
      urls = URL |> Ecto.Query.where(user_id: ^user.id) |> QrManager.Repo.all()
      json(conn, %{"liste" => Enum.map(urls, &extract/1)})
    else
      conn |> send_resp(401, "You are not connected")
    end
  end

  defp extract(%QrManager.URLManager.URL{url: url, id: id}) do
    %{url: url, id: id}
  end

  def create(conn, params) do
    user = conn.assigns[:user]
    {:ok, url} = URLManager.create_url(Map.put(params, "user_id", user.id))
    json(conn, extract(url))
  end

  def show(conn, %{"id" => id}) do
    user = conn.assigns[:user]
    url = URLManager.get_url!(id)
    cond do
      user == nil -> conn |> send_resp(401, "You are not connected")
      user != url.user_id -> conn |> send_resp(403, "forbidden")
      true -> json(conn, extract(url))
    end
  end

  def update(conn, %{"id" => id, "url" => url_params}) do
    user = conn.assigns[:user]
    url = URLManager.get_url!(id)
    cond do
      user == nil -> conn |> send_resp(401, "You are not connected")
      user != url.user_id -> conn |> send_resp(403, "forbidden")
      true -> {:ok, url} = URLManager.update_url(url, url_params)
        json(conn, extract(url))
    end
  end

  def delete(conn, %{"id" => id}) do
    user = conn.assigns[:user]
    url = URLManager.get_url!(id)
    cond do
      user == nil -> conn |> send_resp(401, "You are not connected")
      user != url.user_id -> conn |> send_resp(403, "forbidden")
      true -> {:ok, _url} = URLManager.delete_url(url)
        json(conn, %{done: "done"})
    end
  end

  def stats(conn, %{"id" => id}), do: render(conn, "bonjour #{id}")
  def stats(conn, _params), do: text(conn, "bonjour!")

  def redirection(conn, %{"id" => id}) do
    URL 
    |> where(id: ^id) 
    |> QrManager.Repo.update_all(inc: [number_of_access: 1])

    url = URLManager.get_url!(id).url
    redirect(conn, external: url)
  end
end
