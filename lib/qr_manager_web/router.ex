defmodule QrManagerWeb.Router do
  use QrManagerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", QrManagerWeb do
    pipe_through :browser

    get "/", PageController, :login

    resources "/users", UserController do
      resources "/urls", URLController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", QrManagerWeb do
  #   pipe_through :api
  # end
end
