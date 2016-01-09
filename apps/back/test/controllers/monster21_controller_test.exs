defmodule Back.Monster21ControllerTest do
  use Back.ConnCase

  alias Back.Monster21
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster21_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters21"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster21_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster21"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster21_path(conn, :create), monster21: @valid_attrs
    assert redirected_to(conn) == monster21_path(conn, :index)
    assert Repo.get_by(Monster21, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster21_path(conn, :create), monster21: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster21"
  end

  test "shows chosen resource", %{conn: conn} do
    monster21 = Repo.insert! %Monster21{}
    conn = get conn, monster21_path(conn, :show, monster21)
    assert html_response(conn, 200) =~ "Show monster21"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster21_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster21 = Repo.insert! %Monster21{}
    conn = get conn, monster21_path(conn, :edit, monster21)
    assert html_response(conn, 200) =~ "Edit monster21"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster21 = Repo.insert! %Monster21{}
    conn = put conn, monster21_path(conn, :update, monster21), monster21: @valid_attrs
    assert redirected_to(conn) == monster21_path(conn, :show, monster21)
    assert Repo.get_by(Monster21, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster21 = Repo.insert! %Monster21{}
    conn = put conn, monster21_path(conn, :update, monster21), monster21: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster21"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster21 = Repo.insert! %Monster21{}
    conn = delete conn, monster21_path(conn, :delete, monster21)
    assert redirected_to(conn) == monster21_path(conn, :index)
    refute Repo.get(Monster21, monster21.id)
  end
end
