defmodule QrManagerWeb.URLController do
  use QrManagerWeb, :controller

  require Ecto.Query

  alias QrManager.URLManager
  alias QrManager.URLManager.URL

  def index(conn, _params) do
    user = conn.assigns[:user]
    IO.inspect conn
    IO.inspect user
    urls = URL |> Ecto.Query.where(user_id: ^user.id) |> QrManager.Repo.all()
    json(conn, %{"liste" => Enum.map(urls, &extract/1)})
  end

  defp extract(%QrManager.URLManager.URL{url: url, id: id}) do
    %{url: url, id: id}
  end

  def new(conn, _params) do
    user = conn.assigns[:user]
    changeset = URLManager.change_url(%URL{})
    render(conn, "new.html", user_id: user.id, changeset: changeset)
  end

  def create(conn, %{"url" => url_params}) do
    user = conn.assigns[:user]
    {:ok, url} = URLManager.create_url(Map.put(url_params, "user_id", user.id))
      conn
      |> put_flash(:info, "Url created successfully.")
      |> redirect(to: Routes.url_path(conn, :show, url.id))
  end

  def show(conn, %{"id" => id}) do
    url = URLManager.get_url!(id)
    json(conn, extract(url))
  end

  def edit(conn, %{"id" => id}) do
    url = URLManager.get_url!(id)
    changeset = URLManager.change_url(url)
    render(conn, "edit.html", url: url, changeset: changeset)
  end

  def update(conn, %{"id" => id, "url" => url_params}) do
    url = URLManager.get_url!(id)
    {:ok, url} = URLManager.update_url(url, url_params)
    conn
    |> put_flash(:info, "Url updated successfully.")
    |> redirect(to: Routes.url_path(conn, :show, url.id))

      # {:error, %Ecto.Changeset{} = changeset} ->
      #   render(conn, "edit.html", url: url, changeset: changeset)
  end

  def delete(conn, %{"id" => id}) do
    url = URLManager.get_url!(id)
    {:ok, _url} = URLManager.delete_url(url)

    conn
    |> put_flash(:info, "Url deleted successfully.")
    |> redirect(to: Routes.url_path(conn, :index, url.user_id))
  end

  def stats(conn, %{"id" => id}), do: render(conn, "bonjour #{id}")
  def stats(conn, _paramas), do: text(conn, "bonjour!")

  def redirection(conn, %{"id" => id}) do
    url = URLManager.get_url!(id).url
    IO.puts(url)
    redirect(conn, external: url)
  end
end
