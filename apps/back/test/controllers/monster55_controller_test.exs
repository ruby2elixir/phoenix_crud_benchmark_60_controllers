defmodule Back.Monster55ControllerTest do
  use Back.ConnCase

  alias Back.Monster55
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster55_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters55"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster55_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster55"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster55_path(conn, :create), monster55: @valid_attrs
    assert redirected_to(conn) == monster55_path(conn, :index)
    assert Repo.get_by(Monster55, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster55_path(conn, :create), monster55: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster55"
  end

  test "shows chosen resource", %{conn: conn} do
    monster55 = Repo.insert! %Monster55{}
    conn = get conn, monster55_path(conn, :show, monster55)
    assert html_response(conn, 200) =~ "Show monster55"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster55_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster55 = Repo.insert! %Monster55{}
    conn = get conn, monster55_path(conn, :edit, monster55)
    assert html_response(conn, 200) =~ "Edit monster55"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster55 = Repo.insert! %Monster55{}
    conn = put conn, monster55_path(conn, :update, monster55), monster55: @valid_attrs
    assert redirected_to(conn) == monster55_path(conn, :show, monster55)
    assert Repo.get_by(Monster55, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster55 = Repo.insert! %Monster55{}
    conn = put conn, monster55_path(conn, :update, monster55), monster55: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster55"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster55 = Repo.insert! %Monster55{}
    conn = delete conn, monster55_path(conn, :delete, monster55)
    assert redirected_to(conn) == monster55_path(conn, :index)
    refute Repo.get(Monster55, monster55.id)
  end
end
