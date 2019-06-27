defmodule QrManagerWeb.Router do
  use QrManagerWeb, :router
  alias QrManager.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
    plug Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", QrManagerWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/redirect/:id", URLController, :redirection
    delete "/", UserController, :delete

  end

  scope "/url", QrManagerWeb do
    pipe_through :browser

    get "/", URLController, :index
    post "/", URLController, :create

    get "/stats", URLController, :stats

    get "/:id/stats", URLController, :stats
    get "/:id/", URLController, :show
    put "/:id/", URLController, :update
    delete "/:id", URLController, :delete
  end

  scope "/auth", QrManagerWeb do
    pipe_through :browser

    get "/login", PageController, :login
    get "/signout", SessionController, :delete
    get "/:provider", SessionController, :request
    get "/:provider/callback", SessionController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", QrManagerWeb do
  #   pipe_through :api
  # end
end
