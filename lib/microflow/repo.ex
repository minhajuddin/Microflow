defmodule Microflow.Repo do
use Ecto.Repo, otp_app: :microflow
  @moduledoc """
  In memory Repository
  """

#jnote. Added extra _empty argument to defs to keep arity. Underscore before a function means it is ignored.

  def get(module, id, _empty) do #jnote: removed the _empty as a test, still get errors: def get/2 conflicts with defaults from def get/3
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params, _empty) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end

  # def all(Microflow.User, _empty) do #jnote: changed all to alltest
  #   [%Microflow.User{id: "1", name: "admin", username: "admin", password: "elixir"},
  #   %Microflow.User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
  #   %Microflow.User{id: "3", name: "Chris", username: "chrismccord", password: "phx"}]
  # end
  def all(_module, _empty), do: []
end