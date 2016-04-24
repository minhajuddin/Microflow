defmodule Microflow.TestController do
  require Logger
  use Microflow.Web, :controller
  alias Braintree.Customer
  alias Braintree.ErrorResponse, as: Error


  alias Microflow.Project

  plug :scrub_params, "project" when action in [:create, :update]

  def index(conn, _params) do
    render(conn, "index.html") #Added by Febbry to fix child assigns problem.
  end
  
   #def create(conn, %{"user" => user_params}) do
    #IO.inspect user_params                         # Added from Phoenix Upload Guide. 

  def new(conn, _params) do
    changeset = Project.changeset(%Project{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"project" => project_params}) do
  
    changeset = Project.changeset(%Project{}, project_params)
    case Repo.insert(changeset) do
      {:ok, _project} ->
        # project = Project.avatar_changeset(project, project_params) |> Repo.update
        conn
        
        |> put_flash(:info, "Project created successfully.")
        |> redirect(to: project_path(conn, :index))
      {:error, changeset} ->
        # IO.inspect changeset #Commented this as it is commented in Project Controller
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Repo.get!(Project, id)
    render(conn, "show.html", project: project)
  end

  def edit(conn, %{"id" => id}) do
    project = Repo.get!(Project, id)
    changeset = Project.changeset(project)
    render(conn, "edit.html", project: project, changeset: changeset)
  end

  # def update(conn, %{"id" => id, "project" => project_params}) do
  #   project = Repo.get!(Project, id)
  #   changeset = Project.changeset(project, project_params)

  #   case Repo.update(changeset) do
  #     {:ok, project} ->
  #       conn
  #       |> put_flash(:info, "Project updated successfully.")
  #       |> redirect(to: project_path(conn, :show, project))
  #     {:error, changeset} ->
  #       render(conn, "edit.html", project: project, changeset: changeset)
  #   end
  # end

  def delete(conn, %{"id" => id}) do
    project = Repo.get!(Project, id)
    Repo.delete!(project)
    conn
    |> put_flash(:info, "Project deleted successfully.")
    |> redirect(to: project_path(conn, :index))
    

  # Here we use delete! (with a bang) because we expect
  #   # it to always work (and if it does not, it will raise).
   

  # conn (UNECESSARY DELETION)
  # |> put_flash(:info, "Project deleted successfully.")
  # |> redirect(to: project_path(conn, :index))
  end
end
