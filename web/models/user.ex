defmodule Microflow.User do
  use Microflow.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end
  
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name username), [])
    |> validate_length(:username, min: 1, max: 20)
  end

#jnote. Added, is this the right path? Should be here: authentication/listings/microflow/web/models/user.change1.ex
  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 3, max: 50)
    |> put_pass_hash()
   end
   
   defp put_pass_hash(changeset) do
     case changeset do
     %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
     put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
     _ ->
    changeset
   end
end
end