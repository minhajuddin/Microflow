defmodule Microflow.User do
  use Microflow.Web, :model

  alias Microflow.Repo

  schema "users" do
    field :email, :string
    field :facebook_uid, :string

    timestamps
  end


  def find_or_create(uid, email) do
    case Repo.get_by(Microflow.User, facebook_uid: uid) do
      nil ->
        user = %Microflow.User{facebook_uid: uid, email: email}
        Repo.insert!(user)
        user
      user ->
        user
    end
  end
end
