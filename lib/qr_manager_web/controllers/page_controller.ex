defmodule QrManagerWeb.PageController do
  use QrManagerWeb, :controller

  def index(conn, _params) do
    redirect(conn, external: "https://qrmanager.rfc1149.net")
  end

  def login(conn, _params) do
    if conn.assigns[:user] do
      json(conn, %{first_name: conn.assigns.user.first_name})
    else
      redirect(conn, external: "https://qrmanager.rfc1149.net/auth/google?scope=email%20profile")
    end
  end

  def logout(conn, _params) do
    if conn.assigns[:user] do
      conn
      |> redirect(to: Routes.session_path(conn, :delete))
    else
      redirect(conn, external: "https://qrmanager.rfc1149.net")
    end
  end

end
