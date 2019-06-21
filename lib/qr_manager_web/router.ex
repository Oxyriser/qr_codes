defmodule QrManagerWeb.Router do
  use QrManagerWeb, :router
  alias QrManager.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authentification do
    plug Plugs.Authentification
  end

  scope "/", QrManagerWeb do
    pipe_through :browser

    get "/", PageController, :login
    get "/redirect/:id", URLController, :redirection

    pipe_through :authentification
    resources "/users", UserController do #, only: [:edit, :show, :update] do
      resources "/urls", URLController
    end
  end

  scope "/auth", QrManagerWeb do
    pipe_through :browser

    get "/signout", SessionController, :delete
    get "/:provider", SessionController, :request
    get "/:provider/callback", SessionController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", QrManagerWeb do
  #   pipe_through :api
  # end
end
