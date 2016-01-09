defmodule Back.Monster22ControllerTest do
  use Back.ConnCase

  alias Back.Monster22
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster22_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters22"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster22_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster22"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster22_path(conn, :create), monster22: @valid_attrs
    assert redirected_to(conn) == monster22_path(conn, :index)
    assert Repo.get_by(Monster22, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster22_path(conn, :create), monster22: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster22"
  end

  test "shows chosen resource", %{conn: conn} do
    monster22 = Repo.insert! %Monster22{}
    conn = get conn, monster22_path(conn, :show, monster22)
    assert html_response(conn, 200) =~ "Show monster22"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster22_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster22 = Repo.insert! %Monster22{}
    conn = get conn, monster22_path(conn, :edit, monster22)
    assert html_response(conn, 200) =~ "Edit monster22"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster22 = Repo.insert! %Monster22{}
    conn = put conn, monster22_path(conn, :update, monster22), monster22: @valid_attrs
    assert redirected_to(conn) == monster22_path(conn, :show, monster22)
    assert Repo.get_by(Monster22, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster22 = Repo.insert! %Monster22{}
    conn = put conn, monster22_path(conn, :update, monster22), monster22: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster22"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster22 = Repo.insert! %Monster22{}
    conn = delete conn, monster22_path(conn, :delete, monster22)
    assert redirected_to(conn) == monster22_path(conn, :index)
    refute Repo.get(Monster22, monster22.id)
  end
end
