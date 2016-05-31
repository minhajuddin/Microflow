defmodule Microflow.HomeView do
  use Microflow.Web, :view

  def render("index.json", %{homes: homes}) do
    %{data: render_many(homes, Microflow.HomeView, "home.json")}
  end

  def render("show.json", %{home: home}) do
    %{data: render_one(home, Microflow.HomeView, "home.json")}
  end

  def render("home.json", %{home: home}) do
    %{id: home.id}
  end
end
