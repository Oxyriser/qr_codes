defmodule QrManagerWeb.PageController do
  use QrManagerWeb, :controller
  alias QrManager.URLManager

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def login(conn, _params) do
    changeset = URLManager.change_url(%URLManager.URL{})
    render(conn, "login.html", changeset: changeset)
  end
end
