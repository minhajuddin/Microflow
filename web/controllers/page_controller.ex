defmodule Microflow.PageController do
  use Microflow.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
