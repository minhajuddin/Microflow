defmodule Microflow.AuthController do
  use Microflow.Web, :controller

  plug Ueberauth

  alias Microflow.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    # the user has authenticated successfully
    # make sure that we sign in the user
    user = User.find_or_create(auth.uid, auth.info.email)
    IO.inspect ["user>", user]
    conn
    |> text("Yay")
  end
end
