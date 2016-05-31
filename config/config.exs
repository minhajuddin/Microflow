# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :microflow, Microflow.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "txv10Juv3QAryB5Wfi6Oyg7jn1SAUdNpFhrInA10NjHUofa+mVsXjc/uIJjTNVkI",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Microflow.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id],
  backends: [:console],
  compile_time_purge_level: :info

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :ueberauth, Ueberauth,
  providers: [
   facebook: {Ueberauth.Strategy.Facebook, [default_scope: "email,public_profile,user_friends", profile_fields: "email"]}
  ]

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FB_APP_ID"),
  client_secret: System.get_env("FB_APP_SECRET")
