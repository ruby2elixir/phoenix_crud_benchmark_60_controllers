defmodule Back.Monster18ControllerTest do
  use Back.ConnCase

  alias Back.Monster18
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster18_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters18"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster18_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster18"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster18_path(conn, :create), monster18: @valid_attrs
    assert redirected_to(conn) == monster18_path(conn, :index)
    assert Repo.get_by(Monster18, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster18_path(conn, :create), monster18: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster18"
  end

  test "shows chosen resource", %{conn: conn} do
    monster18 = Repo.insert! %Monster18{}
    conn = get conn, monster18_path(conn, :show, monster18)
    assert html_response(conn, 200) =~ "Show monster18"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster18_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster18 = Repo.insert! %Monster18{}
    conn = get conn, monster18_path(conn, :edit, monster18)
    assert html_response(conn, 200) =~ "Edit monster18"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster18 = Repo.insert! %Monster18{}
    conn = put conn, monster18_path(conn, :update, monster18), monster18: @valid_attrs
    assert redirected_to(conn) == monster18_path(conn, :show, monster18)
    assert Repo.get_by(Monster18, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster18 = Repo.insert! %Monster18{}
    conn = put conn, monster18_path(conn, :update, monster18), monster18: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster18"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster18 = Repo.insert! %Monster18{}
    conn = delete conn, monster18_path(conn, :delete, monster18)
    assert redirected_to(conn) == monster18_path(conn, :index)
    refute Repo.get(Monster18, monster18.id)
  end
end
