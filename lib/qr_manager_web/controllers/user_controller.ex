defmodule QrManagerWeb.UserController do
  use QrManagerWeb, :controller

  alias QrManager.UserManager

  def delete(conn, _param) do
    user = conn.assigns[:user]

    if user == nil do
      send_resp(conn, 401, "You are not connected")
    else
      {:ok, _user} = UserManager.delete_user(user)
      send_resp(conn, 204, "no content")
    end
  end
end
