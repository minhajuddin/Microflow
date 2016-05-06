defmodule Microflow.Endpoint do
  use Phoenix.Endpoint, otp_app: :microflow

  socket "/socket", Microflow.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :microflow, gzip: false, #jnote: Set gzip tp true in production.
    only: ~w(css fonts images js favicon.ico robots.txt media)
    


  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session, #jnote: Probably need to delete session plug later and start again. 
    store: :cookie,
    key: "_microflow_key",
    signing_salt: "GajEm3B0"

  plug Microflow.Router
  
  plug Plug.Static,
    at: "/media", from: Path.expand('./media'), gzip: false
    
end
