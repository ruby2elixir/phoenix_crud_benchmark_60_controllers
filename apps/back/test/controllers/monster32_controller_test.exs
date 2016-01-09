defmodule Back.Monster32ControllerTest do
  use Back.ConnCase

  alias Back.Monster32
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster32_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters32"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster32_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster32"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster32_path(conn, :create), monster32: @valid_attrs
    assert redirected_to(conn) == monster32_path(conn, :index)
    assert Repo.get_by(Monster32, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster32_path(conn, :create), monster32: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster32"
  end

  test "shows chosen resource", %{conn: conn} do
    monster32 = Repo.insert! %Monster32{}
    conn = get conn, monster32_path(conn, :show, monster32)
    assert html_response(conn, 200) =~ "Show monster32"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster32_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster32 = Repo.insert! %Monster32{}
    conn = get conn, monster32_path(conn, :edit, monster32)
    assert html_response(conn, 200) =~ "Edit monster32"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster32 = Repo.insert! %Monster32{}
    conn = put conn, monster32_path(conn, :update, monster32), monster32: @valid_attrs
    assert redirected_to(conn) == monster32_path(conn, :show, monster32)
    assert Repo.get_by(Monster32, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster32 = Repo.insert! %Monster32{}
    conn = put conn, monster32_path(conn, :update, monster32), monster32: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster32"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster32 = Repo.insert! %Monster32{}
    conn = delete conn, monster32_path(conn, :delete, monster32)
    assert redirected_to(conn) == monster32_path(conn, :index)
    refute Repo.get(Monster32, monster32.id)
  end
end
