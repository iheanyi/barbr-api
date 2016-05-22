defmodule Barbr.Router do
  use Barbr.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Barbr do
    pipe_through :api
  end
end
