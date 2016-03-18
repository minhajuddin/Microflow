defmodule Microflow.HomeControllerTest do
  use Microflow.ConnCase

  alias Microflow.Home
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, home_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    home = Repo.insert! %Home{}
    conn = get conn, home_path(conn, :show, home)
    assert json_response(conn, 200)["data"] == %{"id" => home.id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, home_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, home_path(conn, :create), home: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Home, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, home_path(conn, :create), home: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    home = Repo.insert! %Home{}
    conn = put conn, home_path(conn, :update, home), home: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Home, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    home = Repo.insert! %Home{}
    conn = put conn, home_path(conn, :update, home), home: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    home = Repo.insert! %Home{}
    conn = delete conn, home_path(conn, :delete, home)
    assert response(conn, 204)
    refute Repo.get(Home, home.id)
  end
end
