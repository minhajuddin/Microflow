defmodule Microflow.UserController do
  use Microflow.Web, :controller
 
  def index(conn, _params) do
    users = Repo.alltest(Microflow.User) #jnote: changed all to alltest
    render conn, "index.html", users: users
  end
  
  def show(conn, %{"id" => id}) do
    user = Repo.get(Microflow.User, id)
    render conn, "show.html", user: user
  end

end