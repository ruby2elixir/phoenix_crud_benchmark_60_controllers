defmodule Back.Monster12ControllerTest do
  use Back.ConnCase

  alias Back.Monster12
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster12_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters12"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster12_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster12"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster12_path(conn, :create), monster12: @valid_attrs
    assert redirected_to(conn) == monster12_path(conn, :index)
    assert Repo.get_by(Monster12, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster12_path(conn, :create), monster12: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster12"
  end

  test "shows chosen resource", %{conn: conn} do
    monster12 = Repo.insert! %Monster12{}
    conn = get conn, monster12_path(conn, :show, monster12)
    assert html_response(conn, 200) =~ "Show monster12"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster12_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster12 = Repo.insert! %Monster12{}
    conn = get conn, monster12_path(conn, :edit, monster12)
    assert html_response(conn, 200) =~ "Edit monster12"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster12 = Repo.insert! %Monster12{}
    conn = put conn, monster12_path(conn, :update, monster12), monster12: @valid_attrs
    assert redirected_to(conn) == monster12_path(conn, :show, monster12)
    assert Repo.get_by(Monster12, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster12 = Repo.insert! %Monster12{}
    conn = put conn, monster12_path(conn, :update, monster12), monster12: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster12"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster12 = Repo.insert! %Monster12{}
    conn = delete conn, monster12_path(conn, :delete, monster12)
    assert redirected_to(conn) == monster12_path(conn, :index)
    refute Repo.get(Monster12, monster12.id)
  end
end
