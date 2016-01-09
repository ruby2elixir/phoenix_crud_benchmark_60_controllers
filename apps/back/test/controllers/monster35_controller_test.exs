defmodule Back.Monster35ControllerTest do
  use Back.ConnCase

  alias Back.Monster35
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster35_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters35"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster35_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster35"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster35_path(conn, :create), monster35: @valid_attrs
    assert redirected_to(conn) == monster35_path(conn, :index)
    assert Repo.get_by(Monster35, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster35_path(conn, :create), monster35: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster35"
  end

  test "shows chosen resource", %{conn: conn} do
    monster35 = Repo.insert! %Monster35{}
    conn = get conn, monster35_path(conn, :show, monster35)
    assert html_response(conn, 200) =~ "Show monster35"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster35_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster35 = Repo.insert! %Monster35{}
    conn = get conn, monster35_path(conn, :edit, monster35)
    assert html_response(conn, 200) =~ "Edit monster35"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster35 = Repo.insert! %Monster35{}
    conn = put conn, monster35_path(conn, :update, monster35), monster35: @valid_attrs
    assert redirected_to(conn) == monster35_path(conn, :show, monster35)
    assert Repo.get_by(Monster35, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster35 = Repo.insert! %Monster35{}
    conn = put conn, monster35_path(conn, :update, monster35), monster35: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster35"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster35 = Repo.insert! %Monster35{}
    conn = delete conn, monster35_path(conn, :delete, monster35)
    assert redirected_to(conn) == monster35_path(conn, :index)
    refute Repo.get(Monster35, monster35.id)
  end
end
