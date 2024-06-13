defmodule LitefsDemoWeb.Router do
  use LitefsDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {LitefsDemoWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LitefsDemoWeb do
    pipe_through :browser

    get "/", PageController, :home


    live "/comments", CommentLive.Index, :index
    live "/comments/new", CommentLive.Index, :new
    live "/comments/:id/edit", CommentLive.Index, :edit

    live "/comments/:id", CommentLive.Show, :show
    live "/comments/:id/show/edit", CommentLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", LitefsDemoWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:litefs_demo, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: LitefsDemoWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
