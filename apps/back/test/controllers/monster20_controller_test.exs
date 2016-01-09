defmodule Back.Monster20ControllerTest do
  use Back.ConnCase

  alias Back.Monster20
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster20_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters20"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster20_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster20"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster20_path(conn, :create), monster20: @valid_attrs
    assert redirected_to(conn) == monster20_path(conn, :index)
    assert Repo.get_by(Monster20, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster20_path(conn, :create), monster20: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster20"
  end

  test "shows chosen resource", %{conn: conn} do
    monster20 = Repo.insert! %Monster20{}
    conn = get conn, monster20_path(conn, :show, monster20)
    assert html_response(conn, 200) =~ "Show monster20"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster20_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster20 = Repo.insert! %Monster20{}
    conn = get conn, monster20_path(conn, :edit, monster20)
    assert html_response(conn, 200) =~ "Edit monster20"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster20 = Repo.insert! %Monster20{}
    conn = put conn, monster20_path(conn, :update, monster20), monster20: @valid_attrs
    assert redirected_to(conn) == monster20_path(conn, :show, monster20)
    assert Repo.get_by(Monster20, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster20 = Repo.insert! %Monster20{}
    conn = put conn, monster20_path(conn, :update, monster20), monster20: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster20"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster20 = Repo.insert! %Monster20{}
    conn = delete conn, monster20_path(conn, :delete, monster20)
    assert redirected_to(conn) == monster20_path(conn, :index)
    refute Repo.get(Monster20, monster20.id)
  end
end
