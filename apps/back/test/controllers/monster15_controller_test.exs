defmodule Back.Monster15ControllerTest do
  use Back.ConnCase

  alias Back.Monster15
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster15_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters15"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster15_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster15"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster15_path(conn, :create), monster15: @valid_attrs
    assert redirected_to(conn) == monster15_path(conn, :index)
    assert Repo.get_by(Monster15, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster15_path(conn, :create), monster15: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster15"
  end

  test "shows chosen resource", %{conn: conn} do
    monster15 = Repo.insert! %Monster15{}
    conn = get conn, monster15_path(conn, :show, monster15)
    assert html_response(conn, 200) =~ "Show monster15"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster15_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster15 = Repo.insert! %Monster15{}
    conn = get conn, monster15_path(conn, :edit, monster15)
    assert html_response(conn, 200) =~ "Edit monster15"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster15 = Repo.insert! %Monster15{}
    conn = put conn, monster15_path(conn, :update, monster15), monster15: @valid_attrs
    assert redirected_to(conn) == monster15_path(conn, :show, monster15)
    assert Repo.get_by(Monster15, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster15 = Repo.insert! %Monster15{}
    conn = put conn, monster15_path(conn, :update, monster15), monster15: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster15"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster15 = Repo.insert! %Monster15{}
    conn = delete conn, monster15_path(conn, :delete, monster15)
    assert redirected_to(conn) == monster15_path(conn, :index)
    refute Repo.get(Monster15, monster15.id)
  end
end
