defmodule Microflow.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :description, :text
      add :picture, :string
      add :video_url, :string                
      add :raise_amount, :decimal
      timestamps
    end

  end
end
