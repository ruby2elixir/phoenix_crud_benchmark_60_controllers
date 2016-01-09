defmodule Back.Monster47ControllerTest do
  use Back.ConnCase

  alias Back.Monster47
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster47_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters47"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster47_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster47"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster47_path(conn, :create), monster47: @valid_attrs
    assert redirected_to(conn) == monster47_path(conn, :index)
    assert Repo.get_by(Monster47, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster47_path(conn, :create), monster47: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster47"
  end

  test "shows chosen resource", %{conn: conn} do
    monster47 = Repo.insert! %Monster47{}
    conn = get conn, monster47_path(conn, :show, monster47)
    assert html_response(conn, 200) =~ "Show monster47"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster47_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster47 = Repo.insert! %Monster47{}
    conn = get conn, monster47_path(conn, :edit, monster47)
    assert html_response(conn, 200) =~ "Edit monster47"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster47 = Repo.insert! %Monster47{}
    conn = put conn, monster47_path(conn, :update, monster47), monster47: @valid_attrs
    assert redirected_to(conn) == monster47_path(conn, :show, monster47)
    assert Repo.get_by(Monster47, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster47 = Repo.insert! %Monster47{}
    conn = put conn, monster47_path(conn, :update, monster47), monster47: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster47"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster47 = Repo.insert! %Monster47{}
    conn = delete conn, monster47_path(conn, :delete, monster47)
    assert redirected_to(conn) == monster47_path(conn, :index)
    refute Repo.get(Monster47, monster47.id)
  end
end
