defmodule Fishbowl.PageController do
  use Fishbowl.Web, :controller

  plug Fishbowl.Plug.Authenticate

  def index(conn, _params) do
    render conn, "index.html"
  end
end
