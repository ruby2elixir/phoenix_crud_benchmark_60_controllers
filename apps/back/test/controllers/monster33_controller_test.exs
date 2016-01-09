defmodule Back.Monster33ControllerTest do
  use Back.ConnCase

  alias Back.Monster33
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster33_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters33"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster33_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster33"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster33_path(conn, :create), monster33: @valid_attrs
    assert redirected_to(conn) == monster33_path(conn, :index)
    assert Repo.get_by(Monster33, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster33_path(conn, :create), monster33: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster33"
  end

  test "shows chosen resource", %{conn: conn} do
    monster33 = Repo.insert! %Monster33{}
    conn = get conn, monster33_path(conn, :show, monster33)
    assert html_response(conn, 200) =~ "Show monster33"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster33_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster33 = Repo.insert! %Monster33{}
    conn = get conn, monster33_path(conn, :edit, monster33)
    assert html_response(conn, 200) =~ "Edit monster33"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster33 = Repo.insert! %Monster33{}
    conn = put conn, monster33_path(conn, :update, monster33), monster33: @valid_attrs
    assert redirected_to(conn) == monster33_path(conn, :show, monster33)
    assert Repo.get_by(Monster33, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster33 = Repo.insert! %Monster33{}
    conn = put conn, monster33_path(conn, :update, monster33), monster33: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster33"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster33 = Repo.insert! %Monster33{}
    conn = delete conn, monster33_path(conn, :delete, monster33)
    assert redirected_to(conn) == monster33_path(conn, :index)
    refute Repo.get(Monster33, monster33.id)
  end
end
