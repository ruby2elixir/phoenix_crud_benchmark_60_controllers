defmodule Back.Monster54ControllerTest do
  use Back.ConnCase

  alias Back.Monster54
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster54_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters54"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster54_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster54"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster54_path(conn, :create), monster54: @valid_attrs
    assert redirected_to(conn) == monster54_path(conn, :index)
    assert Repo.get_by(Monster54, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster54_path(conn, :create), monster54: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster54"
  end

  test "shows chosen resource", %{conn: conn} do
    monster54 = Repo.insert! %Monster54{}
    conn = get conn, monster54_path(conn, :show, monster54)
    assert html_response(conn, 200) =~ "Show monster54"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster54_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster54 = Repo.insert! %Monster54{}
    conn = get conn, monster54_path(conn, :edit, monster54)
    assert html_response(conn, 200) =~ "Edit monster54"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster54 = Repo.insert! %Monster54{}
    conn = put conn, monster54_path(conn, :update, monster54), monster54: @valid_attrs
    assert redirected_to(conn) == monster54_path(conn, :show, monster54)
    assert Repo.get_by(Monster54, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster54 = Repo.insert! %Monster54{}
    conn = put conn, monster54_path(conn, :update, monster54), monster54: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster54"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster54 = Repo.insert! %Monster54{}
    conn = delete conn, monster54_path(conn, :delete, monster54)
    assert redirected_to(conn) == monster54_path(conn, :index)
    refute Repo.get(Monster54, monster54.id)
  end
end
