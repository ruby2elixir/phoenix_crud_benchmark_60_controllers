defmodule Back.Monster31ControllerTest do
  use Back.ConnCase

  alias Back.Monster31
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster31_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters31"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster31_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster31"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster31_path(conn, :create), monster31: @valid_attrs
    assert redirected_to(conn) == monster31_path(conn, :index)
    assert Repo.get_by(Monster31, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster31_path(conn, :create), monster31: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster31"
  end

  test "shows chosen resource", %{conn: conn} do
    monster31 = Repo.insert! %Monster31{}
    conn = get conn, monster31_path(conn, :show, monster31)
    assert html_response(conn, 200) =~ "Show monster31"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster31_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster31 = Repo.insert! %Monster31{}
    conn = get conn, monster31_path(conn, :edit, monster31)
    assert html_response(conn, 200) =~ "Edit monster31"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster31 = Repo.insert! %Monster31{}
    conn = put conn, monster31_path(conn, :update, monster31), monster31: @valid_attrs
    assert redirected_to(conn) == monster31_path(conn, :show, monster31)
    assert Repo.get_by(Monster31, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster31 = Repo.insert! %Monster31{}
    conn = put conn, monster31_path(conn, :update, monster31), monster31: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster31"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster31 = Repo.insert! %Monster31{}
    conn = delete conn, monster31_path(conn, :delete, monster31)
    assert redirected_to(conn) == monster31_path(conn, :index)
    refute Repo.get(Monster31, monster31.id)
  end
end
