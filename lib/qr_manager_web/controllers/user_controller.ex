defmodule QrManagerWeb.UserController do
  use QrManagerWeb, :controller

  alias QrManager.UserManager
  alias QrManager.UserManager.User
  

  def delete(conn, _param) do
    user = conn.assigns[:user]
    cond do
      user == nil -> conn |> send_resp(401, "You are not connected")
      true -> {:ok, _user} = UserManager.delete_user(user)
        conn |> send_resp(204, "no content")
    end
end

end