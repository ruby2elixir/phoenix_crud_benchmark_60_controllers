defmodule Back.Monster44ControllerTest do
  use Back.ConnCase

  alias Back.Monster44
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster44_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters44"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster44_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster44"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster44_path(conn, :create), monster44: @valid_attrs
    assert redirected_to(conn) == monster44_path(conn, :index)
    assert Repo.get_by(Monster44, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster44_path(conn, :create), monster44: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster44"
  end

  test "shows chosen resource", %{conn: conn} do
    monster44 = Repo.insert! %Monster44{}
    conn = get conn, monster44_path(conn, :show, monster44)
    assert html_response(conn, 200) =~ "Show monster44"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster44_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster44 = Repo.insert! %Monster44{}
    conn = get conn, monster44_path(conn, :edit, monster44)
    assert html_response(conn, 200) =~ "Edit monster44"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster44 = Repo.insert! %Monster44{}
    conn = put conn, monster44_path(conn, :update, monster44), monster44: @valid_attrs
    assert redirected_to(conn) == monster44_path(conn, :show, monster44)
    assert Repo.get_by(Monster44, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster44 = Repo.insert! %Monster44{}
    conn = put conn, monster44_path(conn, :update, monster44), monster44: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster44"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster44 = Repo.insert! %Monster44{}
    conn = delete conn, monster44_path(conn, :delete, monster44)
    assert redirected_to(conn) == monster44_path(conn, :index)
    refute Repo.get(Monster44, monster44.id)
  end
end
