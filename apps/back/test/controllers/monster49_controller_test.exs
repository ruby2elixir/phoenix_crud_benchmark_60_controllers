defmodule Back.Monster49ControllerTest do
  use Back.ConnCase

  alias Back.Monster49
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster49_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters49"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster49_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster49"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster49_path(conn, :create), monster49: @valid_attrs
    assert redirected_to(conn) == monster49_path(conn, :index)
    assert Repo.get_by(Monster49, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster49_path(conn, :create), monster49: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster49"
  end

  test "shows chosen resource", %{conn: conn} do
    monster49 = Repo.insert! %Monster49{}
    conn = get conn, monster49_path(conn, :show, monster49)
    assert html_response(conn, 200) =~ "Show monster49"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster49_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster49 = Repo.insert! %Monster49{}
    conn = get conn, monster49_path(conn, :edit, monster49)
    assert html_response(conn, 200) =~ "Edit monster49"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster49 = Repo.insert! %Monster49{}
    conn = put conn, monster49_path(conn, :update, monster49), monster49: @valid_attrs
    assert redirected_to(conn) == monster49_path(conn, :show, monster49)
    assert Repo.get_by(Monster49, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster49 = Repo.insert! %Monster49{}
    conn = put conn, monster49_path(conn, :update, monster49), monster49: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster49"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster49 = Repo.insert! %Monster49{}
    conn = delete conn, monster49_path(conn, :delete, monster49)
    assert redirected_to(conn) == monster49_path(conn, :index)
    refute Repo.get(Monster49, monster49.id)
  end
end
