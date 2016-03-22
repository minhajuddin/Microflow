defmodule Microflow.Router do
  use Microflow.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser # Use the default browser stack
    get "/", Microflow.HomeController, :index # NOTE "Microflow" must be explicitly added to the controller name, otherwise it raises an error. 
    get "/users", Microflow.UserController, :index
    get "/users/:id", Microflow.UserController, :show
    # get "/home/:messenger", Microflow.HomeController, :show 
    #get "/project/create", NewprojectController, :create
    # resources "/projects", Micrflow.ProjectController
    resources "/projects", Microflow.ProjectController # NOTE "Microflow" must be explicitly added to the controller name, otherwise it raises an error. 
    post "projects/new", Microflow.ProjectController, :new # Added route successfully.post
   
    get "/users", UserController, :index
    get "/users/:id", UserController, :show
    get "/", PageController, :index
  end

  # Other scopes may use custProjectController, :indexom stacks.
  # scope "/api", Microflow do
  #   pipe_through :api
  # end
end
