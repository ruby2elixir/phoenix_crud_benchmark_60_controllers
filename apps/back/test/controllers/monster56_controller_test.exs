defmodule Back.Monster56ControllerTest do
  use Back.ConnCase

  alias Back.Monster56
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster56_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters56"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster56_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster56"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster56_path(conn, :create), monster56: @valid_attrs
    assert redirected_to(conn) == monster56_path(conn, :index)
    assert Repo.get_by(Monster56, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster56_path(conn, :create), monster56: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster56"
  end

  test "shows chosen resource", %{conn: conn} do
    monster56 = Repo.insert! %Monster56{}
    conn = get conn, monster56_path(conn, :show, monster56)
    assert html_response(conn, 200) =~ "Show monster56"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster56_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster56 = Repo.insert! %Monster56{}
    conn = get conn, monster56_path(conn, :edit, monster56)
    assert html_response(conn, 200) =~ "Edit monster56"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster56 = Repo.insert! %Monster56{}
    conn = put conn, monster56_path(conn, :update, monster56), monster56: @valid_attrs
    assert redirected_to(conn) == monster56_path(conn, :show, monster56)
    assert Repo.get_by(Monster56, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster56 = Repo.insert! %Monster56{}
    conn = put conn, monster56_path(conn, :update, monster56), monster56: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster56"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster56 = Repo.insert! %Monster56{}
    conn = delete conn, monster56_path(conn, :delete, monster56)
    assert redirected_to(conn) == monster56_path(conn, :index)
    refute Repo.get(Monster56, monster56.id)
  end
end
