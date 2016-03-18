defmodule Microflow.HomeController do
  use Microflow.Web, :controller

  alias Microflow.Home

  plug :scrub_params, "home" when action in [:create, :update]

  def index(conn, _params) do
    # homes = Repo.all(Home)
    # render(conn, "index.json", homes: homes)
    render conn, "index.html"
  end
  
  def show(conn, %{"messenger" => messenger}) do
  render conn, "show.html", messenger: messenger
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  # def create(conn, %{"home" => home_params}) do
  #   changeset = Home.changeset(%Home{}, home_params)

  #   case Repo.insert(changeset) do
  #     {:ok, home} ->
  #       conn
  #       |> put_status(:created)
  #       |> put_resp_header("location", home_path(conn, :show, home))
  #       |> render("show.json", home: home)
  #     {:error, changeset} ->
  #       conn
  #       |> put_status(:unprocessable_entity)
  #       |> render(Microflow.ChangesetView, "error.json", changeset: changeset)
  #   end
  # end

  # def show(conn, %{"id" => id}) do
  #   home = Repo.get!(Home, id)
  #   render(conn, "show.json", home: home)
  # end

  # def update(conn, %{"id" => id, "home" => home_params}) do
  #   home = Repo.get!(Home, id)
  #   changeset = Home.changeset(home, home_params)

  #   case Repo.update(changeset) do
  #     {:ok, home} ->
  #       render(conn, "show.json", home: home)
  #     {:error, changeset} ->
  #       conn
  #       |> put_status(:unprocessable_entity)
  #       |> render(Microflow.ChangesetView, "error.json", changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   home = Repo.get!(Home, id)

  #   # Here we use delete! (with a bang) because we expect
  #   # it to always work (and if it does not, it will raise).
  #   Repo.delete!(home)

  #   send_resp(conn, :no_content, "")
  # end
end
