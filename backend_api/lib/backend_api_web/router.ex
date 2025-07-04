defmodule BackendApiWeb.Router do
  use BackendApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BackendApiWeb do
    pipe_through :api

    get "/leaderboard", UserController, :leaderboard
    resources "/users", UserController, except: [:new, :edit]
    resources "/games", GameController, except: [:new, :edit]
    resources "/buy_ins", BuyInController, except: [:new, :edit]
    resources "/results", ResultController, except: [:new, :edit]
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:backend_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BackendApiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
