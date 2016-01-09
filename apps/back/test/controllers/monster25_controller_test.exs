defmodule Back.Monster25ControllerTest do
  use Back.ConnCase

  alias Back.Monster25
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster25_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters25"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster25_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster25"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster25_path(conn, :create), monster25: @valid_attrs
    assert redirected_to(conn) == monster25_path(conn, :index)
    assert Repo.get_by(Monster25, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster25_path(conn, :create), monster25: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster25"
  end

  test "shows chosen resource", %{conn: conn} do
    monster25 = Repo.insert! %Monster25{}
    conn = get conn, monster25_path(conn, :show, monster25)
    assert html_response(conn, 200) =~ "Show monster25"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster25_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster25 = Repo.insert! %Monster25{}
    conn = get conn, monster25_path(conn, :edit, monster25)
    assert html_response(conn, 200) =~ "Edit monster25"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster25 = Repo.insert! %Monster25{}
    conn = put conn, monster25_path(conn, :update, monster25), monster25: @valid_attrs
    assert redirected_to(conn) == monster25_path(conn, :show, monster25)
    assert Repo.get_by(Monster25, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster25 = Repo.insert! %Monster25{}
    conn = put conn, monster25_path(conn, :update, monster25), monster25: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster25"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster25 = Repo.insert! %Monster25{}
    conn = delete conn, monster25_path(conn, :delete, monster25)
    assert redirected_to(conn) == monster25_path(conn, :index)
    refute Repo.get(Monster25, monster25.id)
  end
end
