defmodule Back.Monster41ControllerTest do
  use Back.ConnCase

  alias Back.Monster41
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster41_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters41"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster41_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster41"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster41_path(conn, :create), monster41: @valid_attrs
    assert redirected_to(conn) == monster41_path(conn, :index)
    assert Repo.get_by(Monster41, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster41_path(conn, :create), monster41: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster41"
  end

  test "shows chosen resource", %{conn: conn} do
    monster41 = Repo.insert! %Monster41{}
    conn = get conn, monster41_path(conn, :show, monster41)
    assert html_response(conn, 200) =~ "Show monster41"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster41_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster41 = Repo.insert! %Monster41{}
    conn = get conn, monster41_path(conn, :edit, monster41)
    assert html_response(conn, 200) =~ "Edit monster41"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster41 = Repo.insert! %Monster41{}
    conn = put conn, monster41_path(conn, :update, monster41), monster41: @valid_attrs
    assert redirected_to(conn) == monster41_path(conn, :show, monster41)
    assert Repo.get_by(Monster41, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster41 = Repo.insert! %Monster41{}
    conn = put conn, monster41_path(conn, :update, monster41), monster41: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster41"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster41 = Repo.insert! %Monster41{}
    conn = delete conn, monster41_path(conn, :delete, monster41)
    assert redirected_to(conn) == monster41_path(conn, :index)
    refute Repo.get(Monster41, monster41.id)
  end
end
