defmodule Back.PageController do
  use Back.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
