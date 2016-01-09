defmodule Back.Monster23ControllerTest do
  use Back.ConnCase

  alias Back.Monster23
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster23_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters23"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster23_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster23"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster23_path(conn, :create), monster23: @valid_attrs
    assert redirected_to(conn) == monster23_path(conn, :index)
    assert Repo.get_by(Monster23, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster23_path(conn, :create), monster23: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster23"
  end

  test "shows chosen resource", %{conn: conn} do
    monster23 = Repo.insert! %Monster23{}
    conn = get conn, monster23_path(conn, :show, monster23)
    assert html_response(conn, 200) =~ "Show monster23"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster23_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster23 = Repo.insert! %Monster23{}
    conn = get conn, monster23_path(conn, :edit, monster23)
    assert html_response(conn, 200) =~ "Edit monster23"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster23 = Repo.insert! %Monster23{}
    conn = put conn, monster23_path(conn, :update, monster23), monster23: @valid_attrs
    assert redirected_to(conn) == monster23_path(conn, :show, monster23)
    assert Repo.get_by(Monster23, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster23 = Repo.insert! %Monster23{}
    conn = put conn, monster23_path(conn, :update, monster23), monster23: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster23"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster23 = Repo.insert! %Monster23{}
    conn = delete conn, monster23_path(conn, :delete, monster23)
    assert redirected_to(conn) == monster23_path(conn, :index)
    refute Repo.get(Monster23, monster23.id)
  end
end
