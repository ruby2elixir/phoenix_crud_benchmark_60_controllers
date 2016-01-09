defmodule Back.Monster1ControllerTest do
  use Back.ConnCase

  alias Back.Monster1
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster1_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters1"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster1_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster1"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster1_path(conn, :create), monster1: @valid_attrs
    assert redirected_to(conn) == monster1_path(conn, :index)
    assert Repo.get_by(Monster1, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster1_path(conn, :create), monster1: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster1"
  end

  test "shows chosen resource", %{conn: conn} do
    monster1 = Repo.insert! %Monster1{}
    conn = get conn, monster1_path(conn, :show, monster1)
    assert html_response(conn, 200) =~ "Show monster1"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster1_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster1 = Repo.insert! %Monster1{}
    conn = get conn, monster1_path(conn, :edit, monster1)
    assert html_response(conn, 200) =~ "Edit monster1"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster1 = Repo.insert! %Monster1{}
    conn = put conn, monster1_path(conn, :update, monster1), monster1: @valid_attrs
    assert redirected_to(conn) == monster1_path(conn, :show, monster1)
    assert Repo.get_by(Monster1, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster1 = Repo.insert! %Monster1{}
    conn = put conn, monster1_path(conn, :update, monster1), monster1: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster1"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster1 = Repo.insert! %Monster1{}
    conn = delete conn, monster1_path(conn, :delete, monster1)
    assert redirected_to(conn) == monster1_path(conn, :index)
    refute Repo.get(Monster1, monster1.id)
  end
end
