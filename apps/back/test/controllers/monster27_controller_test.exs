defmodule Back.Monster27ControllerTest do
  use Back.ConnCase

  alias Back.Monster27
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster27_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters27"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster27_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster27"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster27_path(conn, :create), monster27: @valid_attrs
    assert redirected_to(conn) == monster27_path(conn, :index)
    assert Repo.get_by(Monster27, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster27_path(conn, :create), monster27: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster27"
  end

  test "shows chosen resource", %{conn: conn} do
    monster27 = Repo.insert! %Monster27{}
    conn = get conn, monster27_path(conn, :show, monster27)
    assert html_response(conn, 200) =~ "Show monster27"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster27_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster27 = Repo.insert! %Monster27{}
    conn = get conn, monster27_path(conn, :edit, monster27)
    assert html_response(conn, 200) =~ "Edit monster27"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster27 = Repo.insert! %Monster27{}
    conn = put conn, monster27_path(conn, :update, monster27), monster27: @valid_attrs
    assert redirected_to(conn) == monster27_path(conn, :show, monster27)
    assert Repo.get_by(Monster27, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster27 = Repo.insert! %Monster27{}
    conn = put conn, monster27_path(conn, :update, monster27), monster27: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster27"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster27 = Repo.insert! %Monster27{}
    conn = delete conn, monster27_path(conn, :delete, monster27)
    assert redirected_to(conn) == monster27_path(conn, :index)
    refute Repo.get(Monster27, monster27.id)
  end
end
