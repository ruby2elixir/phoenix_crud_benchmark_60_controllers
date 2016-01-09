defmodule Back.Monster30ControllerTest do
  use Back.ConnCase

  alias Back.Monster30
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster30_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters30"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster30_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster30"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster30_path(conn, :create), monster30: @valid_attrs
    assert redirected_to(conn) == monster30_path(conn, :index)
    assert Repo.get_by(Monster30, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster30_path(conn, :create), monster30: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster30"
  end

  test "shows chosen resource", %{conn: conn} do
    monster30 = Repo.insert! %Monster30{}
    conn = get conn, monster30_path(conn, :show, monster30)
    assert html_response(conn, 200) =~ "Show monster30"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster30_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster30 = Repo.insert! %Monster30{}
    conn = get conn, monster30_path(conn, :edit, monster30)
    assert html_response(conn, 200) =~ "Edit monster30"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster30 = Repo.insert! %Monster30{}
    conn = put conn, monster30_path(conn, :update, monster30), monster30: @valid_attrs
    assert redirected_to(conn) == monster30_path(conn, :show, monster30)
    assert Repo.get_by(Monster30, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster30 = Repo.insert! %Monster30{}
    conn = put conn, monster30_path(conn, :update, monster30), monster30: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster30"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster30 = Repo.insert! %Monster30{}
    conn = delete conn, monster30_path(conn, :delete, monster30)
    assert redirected_to(conn) == monster30_path(conn, :index)
    refute Repo.get(Monster30, monster30.id)
  end
end
