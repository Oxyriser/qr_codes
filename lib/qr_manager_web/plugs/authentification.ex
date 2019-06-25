defmodule QrManager.Plugs.Authentification do
  import Plug.Conn
  import Phoenix.Controller

  alias QrManager.{Repo, UserManager.User}

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = conn |> get_session(:user_id) |> to_string()
    # FIXME: this is clearly suboptimal in terms of maintenability
    IO.inspect conn
    request_id = conn.params["user_id"] || conn.params["id"]
    if user_id == request_id do
      conn
    else
      conn
      |> put_flash(:error, "The current account does not have acces to that location, please log in with an account that does or contact an admin to add access if it is required.")
      |> send_resp(403, "Forbiden")
    end
  end

end
