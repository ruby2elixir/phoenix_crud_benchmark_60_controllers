defmodule Back.Monster26ControllerTest do
  use Back.ConnCase

  alias Back.Monster26
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster26_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters26"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster26_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster26"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster26_path(conn, :create), monster26: @valid_attrs
    assert redirected_to(conn) == monster26_path(conn, :index)
    assert Repo.get_by(Monster26, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster26_path(conn, :create), monster26: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster26"
  end

  test "shows chosen resource", %{conn: conn} do
    monster26 = Repo.insert! %Monster26{}
    conn = get conn, monster26_path(conn, :show, monster26)
    assert html_response(conn, 200) =~ "Show monster26"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster26_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster26 = Repo.insert! %Monster26{}
    conn = get conn, monster26_path(conn, :edit, monster26)
    assert html_response(conn, 200) =~ "Edit monster26"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster26 = Repo.insert! %Monster26{}
    conn = put conn, monster26_path(conn, :update, monster26), monster26: @valid_attrs
    assert redirected_to(conn) == monster26_path(conn, :show, monster26)
    assert Repo.get_by(Monster26, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster26 = Repo.insert! %Monster26{}
    conn = put conn, monster26_path(conn, :update, monster26), monster26: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster26"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster26 = Repo.insert! %Monster26{}
    conn = delete conn, monster26_path(conn, :delete, monster26)
    assert redirected_to(conn) == monster26_path(conn, :index)
    refute Repo.get(Monster26, monster26.id)
  end
end
