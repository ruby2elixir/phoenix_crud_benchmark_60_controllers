defmodule Back.Monster42ControllerTest do
  use Back.ConnCase

  alias Back.Monster42
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster42_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters42"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster42_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster42"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster42_path(conn, :create), monster42: @valid_attrs
    assert redirected_to(conn) == monster42_path(conn, :index)
    assert Repo.get_by(Monster42, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster42_path(conn, :create), monster42: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster42"
  end

  test "shows chosen resource", %{conn: conn} do
    monster42 = Repo.insert! %Monster42{}
    conn = get conn, monster42_path(conn, :show, monster42)
    assert html_response(conn, 200) =~ "Show monster42"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster42_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster42 = Repo.insert! %Monster42{}
    conn = get conn, monster42_path(conn, :edit, monster42)
    assert html_response(conn, 200) =~ "Edit monster42"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster42 = Repo.insert! %Monster42{}
    conn = put conn, monster42_path(conn, :update, monster42), monster42: @valid_attrs
    assert redirected_to(conn) == monster42_path(conn, :show, monster42)
    assert Repo.get_by(Monster42, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster42 = Repo.insert! %Monster42{}
    conn = put conn, monster42_path(conn, :update, monster42), monster42: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster42"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster42 = Repo.insert! %Monster42{}
    conn = delete conn, monster42_path(conn, :delete, monster42)
    assert redirected_to(conn) == monster42_path(conn, :index)
    refute Repo.get(Monster42, monster42.id)
  end
end
