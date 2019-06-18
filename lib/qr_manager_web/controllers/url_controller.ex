defmodule QrManagerWeb.URLController do
  use QrManagerWeb, :controller

  alias QrManager.URLManager
  alias QrManager.URLManager.URL

  def index(conn, _params) do
    urls = URLManager.list_urls()
    render(conn, "index.html", urls: urls)
  end

  def new(conn, %{"user_id" => user_id}) do
    changeset = URLManager.change_url(%URL{})
    render(conn, "new.html", user_id: user_id, changeset: changeset)
  end

  def create(conn, %{"url" => url_params}) do
    case URLManager.create_url(url_params) do
      {:ok, url} ->
        conn
        |> put_flash(:info, "Url created successfully.")
        |> redirect(to: Routes.user_url_path(conn, :show, url.user_id, url.id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    url = URLManager.get_url!(id)
    render(conn, "show.html", url: url)
  end

  def edit(conn, %{"id" => id}) do
    url = URLManager.get_url!(id)
    changeset = URLManager.change_url(url)
    render(conn, "edit.html", url: url, changeset: changeset)
  end

  def update(conn, %{"id" => id, "url" => url_params}) do
    url = URLManager.get_url!(id)

    case URLManager.update_url(url, url_params) do
      {:ok, url} ->
        conn
        |> put_flash(:info, "Url updated successfully.")
        |> redirect(to: Routes.user_url_path(conn, :show, url.user_id, url.id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", url: url, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    url = URLManager.get_url!(id)
    {:ok, _url} = URLManager.delete_url(url)

    conn
    |> put_flash(:info, "Url deleted successfully.")
    |> redirect(to: Routes.user_url_path(conn, :index, url.user_id))
  end
end
