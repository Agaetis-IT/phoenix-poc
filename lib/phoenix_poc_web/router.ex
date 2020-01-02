defmodule PhoenixPocWeb.Router do
  use PhoenixPocWeb, :router

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

  scope "/", PhoenixPocWeb do
    pipe_through :browser

    get "/", PageController, :index
    
    get "/tasks", TaskController, :index
    get "/tasks/new", TaskController, :new
    post "/tasks", TaskController, :create
    get "/tasks/:id", TaskController, :show
    get "/tasks/:id/edit", TaskController, :edit
    put "/tasks/:id", TaskController, :update
    delete "/tasks/delete/:id", TaskController, :delete
    # ^ the same in one line ===> resources "/tasks", TaskController

    resources "/users", UserController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixPocWeb do
  #   pipe_through :api
  # end
end
