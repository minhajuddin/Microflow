defmodule Microflow.UserController do
  use Microflow.Web, :controller
  
  plug :authenticate when action in [:index, :show]
 
 alias Microflow.User #From page 62. Phoenix PDF.
  
  def index(conn, _params) do
    users = Repo.all(Microflow.User) #jnote: changed all to alltest. 2. Changed it back again. 
    render conn, "index.html", users: users
  end
  
  # def index(conn, _params) do
  #   users = Repo.all(Rumbl.User)
  #   render conn, "index.html", users: users
  # end
  
  # def index(conn, _params) do
  #   case authenticate(conn) do
  #     %Plug.Conn{halted: true} = conn ->
  #       conn

  #     conn ->
  #       users = Repo.all(User)
  #       render conn, "index.html", users: users
  #   end
  # end
  
  # Commented out as per page 85.
  
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
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
  
  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    Repo.delete!(user)
    conn
    |> put_flash(:info, "User deleted successfully. Goodbye!")
    |> redirect(to: project_path(conn, :index))
  end
  
  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "Sorry Bub, you must be logged in to access that page")
      |> redirect(to: page_path(conn, :index))
      |> halt()
      end
  end
  
  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)
       case Repo.insert(changeset) do
         {:ok, user} ->
           conn
           |> Microflow.Auth.login(user)
           |> put_flash(:info, "#{user.name} created!")
           |> redirect(to: user_path(conn, :index))
          {:error, changeset} ->
      render(conn, "new.html", changeset: changeset)
    end
  end
end

