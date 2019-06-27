defmodule QrManagerWeb.PageController do
  use QrManagerWeb, :controller

  def index(conn, _params) do
    redirect(conn, external: "https://qrmanager.rfc1149.net")
  end

  def login(conn, _params) do
    if conn.assigns[:user] do
      conn
      |> redirect(to: Routes.page_path(conn, :index))
    else
      redirect(conn, external: "https://qrmanager.rfc1149.net/auth/google?scope=email%20profile")
    end
  end

end
