defmodule Back.Monster57ControllerTest do
  use Back.ConnCase

  alias Back.Monster57
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster57_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters57"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster57_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster57"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster57_path(conn, :create), monster57: @valid_attrs
    assert redirected_to(conn) == monster57_path(conn, :index)
    assert Repo.get_by(Monster57, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster57_path(conn, :create), monster57: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster57"
  end

  test "shows chosen resource", %{conn: conn} do
    monster57 = Repo.insert! %Monster57{}
    conn = get conn, monster57_path(conn, :show, monster57)
    assert html_response(conn, 200) =~ "Show monster57"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster57_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster57 = Repo.insert! %Monster57{}
    conn = get conn, monster57_path(conn, :edit, monster57)
    assert html_response(conn, 200) =~ "Edit monster57"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster57 = Repo.insert! %Monster57{}
    conn = put conn, monster57_path(conn, :update, monster57), monster57: @valid_attrs
    assert redirected_to(conn) == monster57_path(conn, :show, monster57)
    assert Repo.get_by(Monster57, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster57 = Repo.insert! %Monster57{}
    conn = put conn, monster57_path(conn, :update, monster57), monster57: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster57"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster57 = Repo.insert! %Monster57{}
    conn = delete conn, monster57_path(conn, :delete, monster57)
    assert redirected_to(conn) == monster57_path(conn, :index)
    refute Repo.get(Monster57, monster57.id)
  end
end
