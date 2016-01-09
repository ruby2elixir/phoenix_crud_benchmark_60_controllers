defmodule Back.Monster48ControllerTest do
  use Back.ConnCase

  alias Back.Monster48
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster48_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters48"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster48_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster48"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster48_path(conn, :create), monster48: @valid_attrs
    assert redirected_to(conn) == monster48_path(conn, :index)
    assert Repo.get_by(Monster48, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster48_path(conn, :create), monster48: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster48"
  end

  test "shows chosen resource", %{conn: conn} do
    monster48 = Repo.insert! %Monster48{}
    conn = get conn, monster48_path(conn, :show, monster48)
    assert html_response(conn, 200) =~ "Show monster48"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster48_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster48 = Repo.insert! %Monster48{}
    conn = get conn, monster48_path(conn, :edit, monster48)
    assert html_response(conn, 200) =~ "Edit monster48"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster48 = Repo.insert! %Monster48{}
    conn = put conn, monster48_path(conn, :update, monster48), monster48: @valid_attrs
    assert redirected_to(conn) == monster48_path(conn, :show, monster48)
    assert Repo.get_by(Monster48, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster48 = Repo.insert! %Monster48{}
    conn = put conn, monster48_path(conn, :update, monster48), monster48: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster48"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster48 = Repo.insert! %Monster48{}
    conn = delete conn, monster48_path(conn, :delete, monster48)
    assert redirected_to(conn) == monster48_path(conn, :index)
    refute Repo.get(Monster48, monster48.id)
  end
end
