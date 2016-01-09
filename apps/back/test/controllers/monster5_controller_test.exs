defmodule Back.Monster5ControllerTest do
  use Back.ConnCase

  alias Back.Monster5
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster5_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters5"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster5_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster5"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster5_path(conn, :create), monster5: @valid_attrs
    assert redirected_to(conn) == monster5_path(conn, :index)
    assert Repo.get_by(Monster5, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster5_path(conn, :create), monster5: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster5"
  end

  test "shows chosen resource", %{conn: conn} do
    monster5 = Repo.insert! %Monster5{}
    conn = get conn, monster5_path(conn, :show, monster5)
    assert html_response(conn, 200) =~ "Show monster5"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster5_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster5 = Repo.insert! %Monster5{}
    conn = get conn, monster5_path(conn, :edit, monster5)
    assert html_response(conn, 200) =~ "Edit monster5"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster5 = Repo.insert! %Monster5{}
    conn = put conn, monster5_path(conn, :update, monster5), monster5: @valid_attrs
    assert redirected_to(conn) == monster5_path(conn, :show, monster5)
    assert Repo.get_by(Monster5, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster5 = Repo.insert! %Monster5{}
    conn = put conn, monster5_path(conn, :update, monster5), monster5: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster5"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster5 = Repo.insert! %Monster5{}
    conn = delete conn, monster5_path(conn, :delete, monster5)
    assert redirected_to(conn) == monster5_path(conn, :index)
    refute Repo.get(Monster5, monster5.id)
  end
end
