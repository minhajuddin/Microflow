defmodule Microflow.Repo do

  @moduledoc """
  In memory Repository
  """

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end

  def all(Microflow.User) do
    [%Microflow.User{id: "1", name: "admin", username: "admin", password: "wowamazing"},
     %Microflow.User{id: "2", name: "febbry", username: "predi", password: "wowamazing"},
     %Microflow.User{id: "3", name: "Superman", username: "superman", password: "wowamazing"}]
  end
  def all(_module), do: []
end