defmodule QrManagerWeb.PageController do
  use QrManagerWeb, :controller

  def login(conn, _params) do
    if conn.assigns[:user] do
      json(conn, %{first_name: conn.assigns.user.first_name})
    else
      redirect(conn, external: "https://qrmanager.rfc1149.net/auth/google?scope=email%20profile")
    end
  end
end
