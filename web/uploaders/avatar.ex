defmodule Microflow.Avatar do
  use Arc.Definition
  use Arc.Ecto.Definition



  # To add a thumbnail version:
  @versions [:original]

  @acl :public_read

  
  # Whitelist file extensions:
  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  # Define a thumbnail transformation:
  # def transform(:thumb, _) do
  #   {:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250 -format png"}
  # end

  # Override the persisted filenames:
  # def filename(version, _) do
  #   version
  # end
  
  
   def __storage, do: Arc.Storage.Local

  # def filename(version,  {file, scope}), do: "#{file.file_name}"

  # Override the storage directory:
  def storage_dir(version, {file, scope}) do
    "priv/static/media"
  end
  
#  priv/static/media - Saves project but doesn't store pic.
#  /priv/static/media = Doesn't work.
#  /priv/static/media/ = Doesn't work
  
  def correct_image_path(path) do
    String.replace path, "priv/static/", "/"
  end

end
