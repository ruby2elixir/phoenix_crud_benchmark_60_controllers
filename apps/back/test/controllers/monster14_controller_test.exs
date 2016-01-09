defmodule Back.Monster14ControllerTest do
  use Back.ConnCase

  alias Back.Monster14
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster14_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters14"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster14_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster14"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster14_path(conn, :create), monster14: @valid_attrs
    assert redirected_to(conn) == monster14_path(conn, :index)
    assert Repo.get_by(Monster14, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster14_path(conn, :create), monster14: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster14"
  end

  test "shows chosen resource", %{conn: conn} do
    monster14 = Repo.insert! %Monster14{}
    conn = get conn, monster14_path(conn, :show, monster14)
    assert html_response(conn, 200) =~ "Show monster14"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster14_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster14 = Repo.insert! %Monster14{}
    conn = get conn, monster14_path(conn, :edit, monster14)
    assert html_response(conn, 200) =~ "Edit monster14"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster14 = Repo.insert! %Monster14{}
    conn = put conn, monster14_path(conn, :update, monster14), monster14: @valid_attrs
    assert redirected_to(conn) == monster14_path(conn, :show, monster14)
    assert Repo.get_by(Monster14, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster14 = Repo.insert! %Monster14{}
    conn = put conn, monster14_path(conn, :update, monster14), monster14: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster14"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster14 = Repo.insert! %Monster14{}
    conn = delete conn, monster14_path(conn, :delete, monster14)
    assert redirected_to(conn) == monster14_path(conn, :index)
    refute Repo.get(Monster14, monster14.id)
  end
end
