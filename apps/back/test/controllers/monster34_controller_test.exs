defmodule Back.Monster34ControllerTest do
  use Back.ConnCase

  alias Back.Monster34
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster34_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters34"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster34_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster34"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster34_path(conn, :create), monster34: @valid_attrs
    assert redirected_to(conn) == monster34_path(conn, :index)
    assert Repo.get_by(Monster34, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster34_path(conn, :create), monster34: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster34"
  end

  test "shows chosen resource", %{conn: conn} do
    monster34 = Repo.insert! %Monster34{}
    conn = get conn, monster34_path(conn, :show, monster34)
    assert html_response(conn, 200) =~ "Show monster34"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster34_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster34 = Repo.insert! %Monster34{}
    conn = get conn, monster34_path(conn, :edit, monster34)
    assert html_response(conn, 200) =~ "Edit monster34"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster34 = Repo.insert! %Monster34{}
    conn = put conn, monster34_path(conn, :update, monster34), monster34: @valid_attrs
    assert redirected_to(conn) == monster34_path(conn, :show, monster34)
    assert Repo.get_by(Monster34, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster34 = Repo.insert! %Monster34{}
    conn = put conn, monster34_path(conn, :update, monster34), monster34: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster34"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster34 = Repo.insert! %Monster34{}
    conn = delete conn, monster34_path(conn, :delete, monster34)
    assert redirected_to(conn) == monster34_path(conn, :index)
    refute Repo.get(Monster34, monster34.id)
  end
end
