defmodule Microflow.UserController do
  use Microflow.Web, :controller
 alias Microflow.User #From page 62. Phoenix PDF.
  def index(conn, _params) do
    users = Repo.all(Microflow.User) #jnote: changed all to alltest. 2. Changed it back again. 
    render conn, "index.html", users: users
  end
  
  def show(conn, %{"id" => id}) do
    user = Repo.get(Microflow.User, id)
    render conn, "show.html", user: user
  end
  
  
  
  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end
  
  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    IO.inspect user_params #Added as per advice on Stack Overflow
    {:ok, user} = Repo.insert(changeset)
    
    conn
    |> put_flash(:info, "#{user.name} created!")
    |> redirect(to: user_path(conn, :index))
  end

end