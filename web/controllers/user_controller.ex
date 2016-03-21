defmodule Microflow.UserController do
  use Microflow.Web, :controller
 
  def index(conn, _params) do
    users = Repo.all(Microflow.User)
    render conn, "index.html", users: users
  end
end