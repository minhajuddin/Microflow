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
    # |> cast_attachments(params, @required_file_fields, @optional_file_fields)
    |> validate_length(:description, min: 5)
    |> validate_length(:description, max: 700) 
    
  end
  
  def avatar_changeset(proj, params) do
    proj |> cast_attachments(params, ~w(picture), ~w())
  end

  # def correct_image_path(path) do
  #   String.replace path, "priv/static/mediamedia", "/"
  # end
end

# Character count line 32