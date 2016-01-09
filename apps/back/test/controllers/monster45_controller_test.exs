defmodule Back.Monster45ControllerTest do
  use Back.ConnCase

  alias Back.Monster45
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster45_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters45"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster45_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster45"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster45_path(conn, :create), monster45: @valid_attrs
    assert redirected_to(conn) == monster45_path(conn, :index)
    assert Repo.get_by(Monster45, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster45_path(conn, :create), monster45: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster45"
  end

  test "shows chosen resource", %{conn: conn} do
    monster45 = Repo.insert! %Monster45{}
    conn = get conn, monster45_path(conn, :show, monster45)
    assert html_response(conn, 200) =~ "Show monster45"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster45_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster45 = Repo.insert! %Monster45{}
    conn = get conn, monster45_path(conn, :edit, monster45)
    assert html_response(conn, 200) =~ "Edit monster45"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster45 = Repo.insert! %Monster45{}
    conn = put conn, monster45_path(conn, :update, monster45), monster45: @valid_attrs
    assert redirected_to(conn) == monster45_path(conn, :show, monster45)
    assert Repo.get_by(Monster45, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster45 = Repo.insert! %Monster45{}
    conn = put conn, monster45_path(conn, :update, monster45), monster45: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster45"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster45 = Repo.insert! %Monster45{}
    conn = delete conn, monster45_path(conn, :delete, monster45)
    assert redirected_to(conn) == monster45_path(conn, :index)
    refute Repo.get(Monster45, monster45.id)
  end
end
