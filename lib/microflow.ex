defmodule Microflow do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      supervisor(Microflow.Endpoint, []), #jnote: Febbry commented this line.
      # Start the Ecto repository
      supervisor(Microflow.Repo, []), # jnote: Commented this out as per P.Phoenix page 45 #Uncommented as per page 56.
      # Here you could define other workers and supervisors as children
      # worker(Microflow.Worker, []), 
     # worker(Microflow.Repo, []) #jnote. Added this as per internet advice: repo Microflow.Repo is not started, please ensure it is part of your supervision tree
    worker(Microflow.Router, [], function: :start)

    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Microflow.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Microflow.Endpoint.config_change(changed, removed)
    :ok
  end
end
