defmodule Back.Monster52ControllerTest do
  use Back.ConnCase

  alias Back.Monster52
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster52_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters52"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster52_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster52"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster52_path(conn, :create), monster52: @valid_attrs
    assert redirected_to(conn) == monster52_path(conn, :index)
    assert Repo.get_by(Monster52, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster52_path(conn, :create), monster52: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster52"
  end

  test "shows chosen resource", %{conn: conn} do
    monster52 = Repo.insert! %Monster52{}
    conn = get conn, monster52_path(conn, :show, monster52)
    assert html_response(conn, 200) =~ "Show monster52"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster52_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster52 = Repo.insert! %Monster52{}
    conn = get conn, monster52_path(conn, :edit, monster52)
    assert html_response(conn, 200) =~ "Edit monster52"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster52 = Repo.insert! %Monster52{}
    conn = put conn, monster52_path(conn, :update, monster52), monster52: @valid_attrs
    assert redirected_to(conn) == monster52_path(conn, :show, monster52)
    assert Repo.get_by(Monster52, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster52 = Repo.insert! %Monster52{}
    conn = put conn, monster52_path(conn, :update, monster52), monster52: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster52"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster52 = Repo.insert! %Monster52{}
    conn = delete conn, monster52_path(conn, :delete, monster52)
    assert redirected_to(conn) == monster52_path(conn, :index)
    refute Repo.get(Monster52, monster52.id)
  end
end
