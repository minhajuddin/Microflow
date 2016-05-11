use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :microflow, Microflow.Endpoint,
  secret_key_base: "KxrMW3nSM4zoRKIzM5+GuB7h+v3RYctPiHgSQmHdyoj8bpbCZmig5OAG9RncxxP1"

# Configure your database
config :microflow, Microflow.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "wowamazing",
  template: "template0",
  database: "microflow_prod",
  pool_size: 20
