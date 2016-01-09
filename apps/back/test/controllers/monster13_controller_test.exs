defmodule Back.Monster13ControllerTest do
  use Back.ConnCase

  alias Back.Monster13
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster13_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters13"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster13_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster13"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster13_path(conn, :create), monster13: @valid_attrs
    assert redirected_to(conn) == monster13_path(conn, :index)
    assert Repo.get_by(Monster13, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster13_path(conn, :create), monster13: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster13"
  end

  test "shows chosen resource", %{conn: conn} do
    monster13 = Repo.insert! %Monster13{}
    conn = get conn, monster13_path(conn, :show, monster13)
    assert html_response(conn, 200) =~ "Show monster13"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster13_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster13 = Repo.insert! %Monster13{}
    conn = get conn, monster13_path(conn, :edit, monster13)
    assert html_response(conn, 200) =~ "Edit monster13"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster13 = Repo.insert! %Monster13{}
    conn = put conn, monster13_path(conn, :update, monster13), monster13: @valid_attrs
    assert redirected_to(conn) == monster13_path(conn, :show, monster13)
    assert Repo.get_by(Monster13, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster13 = Repo.insert! %Monster13{}
    conn = put conn, monster13_path(conn, :update, monster13), monster13: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster13"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster13 = Repo.insert! %Monster13{}
    conn = delete conn, monster13_path(conn, :delete, monster13)
    assert redirected_to(conn) == monster13_path(conn, :index)
    refute Repo.get(Monster13, monster13.id)
  end
end
