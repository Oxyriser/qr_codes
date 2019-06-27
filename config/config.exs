# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :qr_manager,
  ecto_repos: [QrManager.Repo]

# Configures the endpoint
config :qr_manager, QrManagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8Y5zTkOtjKWsIiONp23+ZgMycQ+XTsx3YPyZEE72dk0h4ehRqhRfA7rCb0Z4t+QO",
  render_errors: [view: QrManagerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: QrManager.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Ueberauth
config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "email profile plus.me"]}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
