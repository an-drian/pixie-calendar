defmodule PixieCalendarWeb.Router do
  use PixieCalendarWeb, :router

  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router,
    extensions: [PowPersistentSession]

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
         error_handler: Pow.Phoenix.PlugErrorHandler
  end

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

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", PixieCalendarWeb do
    pipe_through [:browser, :protected]

    get "/", PageController, :index

    resources "/employees", EmployeesController, only: [:index, :edit, :update, :create, :new] do
      resources "/gaps", GapsController, only: [:index, :create, :new]
    end

  end

  # Other scopes may use custom stacks.
  # scope "/api", PixieCalendarWeb do
  #   pipe_through :api
  # end
end
