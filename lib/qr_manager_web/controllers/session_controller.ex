defmodule QrManagerWeb.SessionController do
  use QrManagerWeb, :controller
  plug Ueberauth

  alias QrManager.{Repo, UserManager.User}

  def create(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{
      token: auth.credentials.token,
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      email: auth.info.email,
      provider: "google"
    }

    changeset = User.changeset(%User{}, user_params)

    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Thank you for signing in!")
        |> put_session(:user_id, user.id)
       json(conn, %{first_name: conn.assigns.user.first_name})

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: Routes.page_path(conn, :login))
    end
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end

  def delete(conn, _params) do
    if conn.assigns[:user] do
      conn
    |> configure_session(drop: true)
    redirect(conn, external: "https://qrmanager.rfc1149.net")
    else
      redirect(conn, external: "https://qrmanager.rfc1149.net")
    end
  end

end
