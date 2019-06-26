defmodule QrManagerWeb.PageController do
  use QrManagerWeb, :controller
  alias QrManager.URLManager

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def login(conn, _params) do
    changeset = URLManager.change_url(%URLManager.URL{})
    if conn.assigns[:user] do
      json(conn, %{first_name: conn.assigns.user.first_name})
    else
      redirect(conn, external: "https://qrmanager.rfc1149.net/auth/google?scope=email%20profile")
    end
    # render(conn, "login.html", changeset: changeset)
  end
end
