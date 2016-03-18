defmodule Microflow.Project do
  use Microflow.Web, :model
  use Arc.Ecto.Model


  schema "projects" do
    field :name, :string
    field :description, :string
    field :picture, Microflow.Avatar.Type
    field :video_url, :string                
    field :raise_amount, :decimal
    timestamps
  end

  @required_fields ~w(name description video_url raise_amount)
  @optional_fields ~w()

  @required_file_fields ~w()
  @optional_file_fields ~w(picture)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_attachments(params, @required_file_fields, @optional_file_fields)
    |> validate_length(:description, min: 100)
    |> validate_length(:description, max: 800) 
  end
end
