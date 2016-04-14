defmodule Microflow.SessionController do
  use Microflow.Web, :controller
 
    def new(conn, _) do
      render conn, "new.html"
    end

    def create(conn,%{"session" => %{"username" => user, "password" =>
                                 pass}}) do
      case Microflow.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do
        {:ok, conn} ->
          conn
          |> put_flash(:info, "Welcome back!")
          |> redirect(to: home_path(conn, :index))
        {:error, _reason, conn} ->
          conn
          |> put_flash(:error, "Sorry, that looks like an incorrect username/password match... ") #TTD add a forgot password email function. 
          |> render("new.html")
        end
     end    

    def delete(conn, _) do #Removed the empty argument ,_
      conn
      |> Microflow.Auth.logout()
      |> redirect(to: home_path(conn, :index))
    end
end