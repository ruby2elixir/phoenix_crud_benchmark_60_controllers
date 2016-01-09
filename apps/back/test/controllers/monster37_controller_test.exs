defmodule Back.Monster37ControllerTest do
  use Back.ConnCase

  alias Back.Monster37
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster37_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters37"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster37_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster37"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster37_path(conn, :create), monster37: @valid_attrs
    assert redirected_to(conn) == monster37_path(conn, :index)
    assert Repo.get_by(Monster37, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster37_path(conn, :create), monster37: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster37"
  end

  test "shows chosen resource", %{conn: conn} do
    monster37 = Repo.insert! %Monster37{}
    conn = get conn, monster37_path(conn, :show, monster37)
    assert html_response(conn, 200) =~ "Show monster37"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster37_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster37 = Repo.insert! %Monster37{}
    conn = get conn, monster37_path(conn, :edit, monster37)
    assert html_response(conn, 200) =~ "Edit monster37"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster37 = Repo.insert! %Monster37{}
    conn = put conn, monster37_path(conn, :update, monster37), monster37: @valid_attrs
    assert redirected_to(conn) == monster37_path(conn, :show, monster37)
    assert Repo.get_by(Monster37, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster37 = Repo.insert! %Monster37{}
    conn = put conn, monster37_path(conn, :update, monster37), monster37: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster37"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster37 = Repo.insert! %Monster37{}
    conn = delete conn, monster37_path(conn, :delete, monster37)
    assert redirected_to(conn) == monster37_path(conn, :index)
    refute Repo.get(Monster37, monster37.id)
  end
end
