defmodule Back.Monster10ControllerTest do
  use Back.ConnCase

  alias Back.Monster10
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster10_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters10"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster10_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster10"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster10_path(conn, :create), monster10: @valid_attrs
    assert redirected_to(conn) == monster10_path(conn, :index)
    assert Repo.get_by(Monster10, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster10_path(conn, :create), monster10: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster10"
  end

  test "shows chosen resource", %{conn: conn} do
    monster10 = Repo.insert! %Monster10{}
    conn = get conn, monster10_path(conn, :show, monster10)
    assert html_response(conn, 200) =~ "Show monster10"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster10_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster10 = Repo.insert! %Monster10{}
    conn = get conn, monster10_path(conn, :edit, monster10)
    assert html_response(conn, 200) =~ "Edit monster10"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster10 = Repo.insert! %Monster10{}
    conn = put conn, monster10_path(conn, :update, monster10), monster10: @valid_attrs
    assert redirected_to(conn) == monster10_path(conn, :show, monster10)
    assert Repo.get_by(Monster10, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster10 = Repo.insert! %Monster10{}
    conn = put conn, monster10_path(conn, :update, monster10), monster10: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster10"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster10 = Repo.insert! %Monster10{}
    conn = delete conn, monster10_path(conn, :delete, monster10)
    assert redirected_to(conn) == monster10_path(conn, :index)
    refute Repo.get(Monster10, monster10.id)
  end
end
