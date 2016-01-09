defmodule Back.Monster17ControllerTest do
  use Back.ConnCase

  alias Back.Monster17
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster17_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters17"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster17_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster17"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster17_path(conn, :create), monster17: @valid_attrs
    assert redirected_to(conn) == monster17_path(conn, :index)
    assert Repo.get_by(Monster17, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster17_path(conn, :create), monster17: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster17"
  end

  test "shows chosen resource", %{conn: conn} do
    monster17 = Repo.insert! %Monster17{}
    conn = get conn, monster17_path(conn, :show, monster17)
    assert html_response(conn, 200) =~ "Show monster17"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster17_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster17 = Repo.insert! %Monster17{}
    conn = get conn, monster17_path(conn, :edit, monster17)
    assert html_response(conn, 200) =~ "Edit monster17"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster17 = Repo.insert! %Monster17{}
    conn = put conn, monster17_path(conn, :update, monster17), monster17: @valid_attrs
    assert redirected_to(conn) == monster17_path(conn, :show, monster17)
    assert Repo.get_by(Monster17, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster17 = Repo.insert! %Monster17{}
    conn = put conn, monster17_path(conn, :update, monster17), monster17: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster17"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster17 = Repo.insert! %Monster17{}
    conn = delete conn, monster17_path(conn, :delete, monster17)
    assert redirected_to(conn) == monster17_path(conn, :index)
    refute Repo.get(Monster17, monster17.id)
  end
end
