admin#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
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
     %Microflow.User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
     %Microflow.User{id: "3", name: "Chris", username: "chrismccord", password: "phx"}]
  end
  def all(_module), do: []
end