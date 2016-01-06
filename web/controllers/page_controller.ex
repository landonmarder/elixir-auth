defmodule Fishbowl.PageController do
  use Fishbowl.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
