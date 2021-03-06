defmodule Back.Monster29ControllerTest do
  use Back.ConnCase

  alias Back.Monster29
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster29_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters29"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster29_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster29"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster29_path(conn, :create), monster29: @valid_attrs
    assert redirected_to(conn) == monster29_path(conn, :index)
    assert Repo.get_by(Monster29, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster29_path(conn, :create), monster29: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster29"
  end

  test "shows chosen resource", %{conn: conn} do
    monster29 = Repo.insert! %Monster29{}
    conn = get conn, monster29_path(conn, :show, monster29)
    assert html_response(conn, 200) =~ "Show monster29"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster29_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster29 = Repo.insert! %Monster29{}
    conn = get conn, monster29_path(conn, :edit, monster29)
    assert html_response(conn, 200) =~ "Edit monster29"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster29 = Repo.insert! %Monster29{}
    conn = put conn, monster29_path(conn, :update, monster29), monster29: @valid_attrs
    assert redirected_to(conn) == monster29_path(conn, :show, monster29)
    assert Repo.get_by(Monster29, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster29 = Repo.insert! %Monster29{}
    conn = put conn, monster29_path(conn, :update, monster29), monster29: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster29"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster29 = Repo.insert! %Monster29{}
    conn = delete conn, monster29_path(conn, :delete, monster29)
    assert redirected_to(conn) == monster29_path(conn, :index)
    refute Repo.get(Monster29, monster29.id)
  end
end
