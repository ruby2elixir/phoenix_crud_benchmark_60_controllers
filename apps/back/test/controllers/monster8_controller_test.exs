defmodule Back.Monster8ControllerTest do
  use Back.ConnCase

  alias Back.Monster8
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster8_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters8"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster8_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster8"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster8_path(conn, :create), monster8: @valid_attrs
    assert redirected_to(conn) == monster8_path(conn, :index)
    assert Repo.get_by(Monster8, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster8_path(conn, :create), monster8: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster8"
  end

  test "shows chosen resource", %{conn: conn} do
    monster8 = Repo.insert! %Monster8{}
    conn = get conn, monster8_path(conn, :show, monster8)
    assert html_response(conn, 200) =~ "Show monster8"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster8_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster8 = Repo.insert! %Monster8{}
    conn = get conn, monster8_path(conn, :edit, monster8)
    assert html_response(conn, 200) =~ "Edit monster8"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster8 = Repo.insert! %Monster8{}
    conn = put conn, monster8_path(conn, :update, monster8), monster8: @valid_attrs
    assert redirected_to(conn) == monster8_path(conn, :show, monster8)
    assert Repo.get_by(Monster8, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster8 = Repo.insert! %Monster8{}
    conn = put conn, monster8_path(conn, :update, monster8), monster8: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster8"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster8 = Repo.insert! %Monster8{}
    conn = delete conn, monster8_path(conn, :delete, monster8)
    assert redirected_to(conn) == monster8_path(conn, :index)
    refute Repo.get(Monster8, monster8.id)
  end
end
