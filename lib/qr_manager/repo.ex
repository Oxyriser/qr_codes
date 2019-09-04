defmodule QrManager.Repo do
  use Ecto.Repo,
    otp_app: :qr_manager,
    adapter: Ecto.Adapters.Postgres
end
