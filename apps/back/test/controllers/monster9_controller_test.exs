defmodule Back.Monster9ControllerTest do
  use Back.ConnCase

  alias Back.Monster9
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster9_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters9"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster9_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster9"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster9_path(conn, :create), monster9: @valid_attrs
    assert redirected_to(conn) == monster9_path(conn, :index)
    assert Repo.get_by(Monster9, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster9_path(conn, :create), monster9: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster9"
  end

  test "shows chosen resource", %{conn: conn} do
    monster9 = Repo.insert! %Monster9{}
    conn = get conn, monster9_path(conn, :show, monster9)
    assert html_response(conn, 200) =~ "Show monster9"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster9_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster9 = Repo.insert! %Monster9{}
    conn = get conn, monster9_path(conn, :edit, monster9)
    assert html_response(conn, 200) =~ "Edit monster9"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster9 = Repo.insert! %Monster9{}
    conn = put conn, monster9_path(conn, :update, monster9), monster9: @valid_attrs
    assert redirected_to(conn) == monster9_path(conn, :show, monster9)
    assert Repo.get_by(Monster9, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster9 = Repo.insert! %Monster9{}
    conn = put conn, monster9_path(conn, :update, monster9), monster9: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster9"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster9 = Repo.insert! %Monster9{}
    conn = delete conn, monster9_path(conn, :delete, monster9)
    assert redirected_to(conn) == monster9_path(conn, :index)
    refute Repo.get(Monster9, monster9.id)
  end
end
