defmodule Back.Monster59ControllerTest do
  use Back.ConnCase

  alias Back.Monster59
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster59_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters59"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster59_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster59"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster59_path(conn, :create), monster59: @valid_attrs
    assert redirected_to(conn) == monster59_path(conn, :index)
    assert Repo.get_by(Monster59, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster59_path(conn, :create), monster59: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster59"
  end

  test "shows chosen resource", %{conn: conn} do
    monster59 = Repo.insert! %Monster59{}
    conn = get conn, monster59_path(conn, :show, monster59)
    assert html_response(conn, 200) =~ "Show monster59"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster59_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster59 = Repo.insert! %Monster59{}
    conn = get conn, monster59_path(conn, :edit, monster59)
    assert html_response(conn, 200) =~ "Edit monster59"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster59 = Repo.insert! %Monster59{}
    conn = put conn, monster59_path(conn, :update, monster59), monster59: @valid_attrs
    assert redirected_to(conn) == monster59_path(conn, :show, monster59)
    assert Repo.get_by(Monster59, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster59 = Repo.insert! %Monster59{}
    conn = put conn, monster59_path(conn, :update, monster59), monster59: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster59"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster59 = Repo.insert! %Monster59{}
    conn = delete conn, monster59_path(conn, :delete, monster59)
    assert redirected_to(conn) == monster59_path(conn, :index)
    refute Repo.get(Monster59, monster59.id)
  end
end
