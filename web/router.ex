defmodule Microflow.Router do
  use Microflow.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Microflow.Auth, repo: Microflow.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser # Use the default browser stack
    get "/", Microflow.HomeController, :index # NOTE "Microflow" must be explicitly added to the controller name, otherwise it raises an error. 
    get "/users", Microflow.UserController, :index
    # get "/users/:id", Microflow.UserController, :show - THIS LINE RAISED THE ERROR. UNCOMMENT AT YE PERIL.
    # get "/home/:messenger", Microflow.HomeController, :show 
    #get "/project/create", NewprojectController, :create
    resources "/projects", Microflow.ProjectController # NOTE "Microflow" must be explicitly added to the controller name, otherwise it raises an error. 
    post "projects/new", Microflow.ProjectController, :new # Added route successfully.post
   
    resources "/users", Microflow.UserController   
    # get "/users", Microflow.UserController, :index # Added Microflow to both these routes.
    # get "/users/:id", Microflow.UserController, :show # Added Microflow to both these routes.
    get "/", Microflow.PageController, :index #Commented this to avoid conflicts.
  end
  
  # Febbry commented out 19, 20, 27, 28
  # Other scopes may use custProjectController, :indexom stacks.
  # scope "/api", Microflow do
  #   pipe_through :api
  # end
end
