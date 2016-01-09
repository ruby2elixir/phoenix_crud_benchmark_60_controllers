defmodule Back.Monster51ControllerTest do
  use Back.ConnCase

  alias Back.Monster51
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster51_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters51"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster51_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster51"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster51_path(conn, :create), monster51: @valid_attrs
    assert redirected_to(conn) == monster51_path(conn, :index)
    assert Repo.get_by(Monster51, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster51_path(conn, :create), monster51: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster51"
  end

  test "shows chosen resource", %{conn: conn} do
    monster51 = Repo.insert! %Monster51{}
    conn = get conn, monster51_path(conn, :show, monster51)
    assert html_response(conn, 200) =~ "Show monster51"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster51_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster51 = Repo.insert! %Monster51{}
    conn = get conn, monster51_path(conn, :edit, monster51)
    assert html_response(conn, 200) =~ "Edit monster51"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster51 = Repo.insert! %Monster51{}
    conn = put conn, monster51_path(conn, :update, monster51), monster51: @valid_attrs
    assert redirected_to(conn) == monster51_path(conn, :show, monster51)
    assert Repo.get_by(Monster51, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster51 = Repo.insert! %Monster51{}
    conn = put conn, monster51_path(conn, :update, monster51), monster51: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster51"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster51 = Repo.insert! %Monster51{}
    conn = delete conn, monster51_path(conn, :delete, monster51)
    assert redirected_to(conn) == monster51_path(conn, :index)
    refute Repo.get(Monster51, monster51.id)
  end
end
