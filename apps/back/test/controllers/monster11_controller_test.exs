defmodule Back.Monster11ControllerTest do
  use Back.ConnCase

  alias Back.Monster11
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster11_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters11"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster11_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster11"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster11_path(conn, :create), monster11: @valid_attrs
    assert redirected_to(conn) == monster11_path(conn, :index)
    assert Repo.get_by(Monster11, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster11_path(conn, :create), monster11: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster11"
  end

  test "shows chosen resource", %{conn: conn} do
    monster11 = Repo.insert! %Monster11{}
    conn = get conn, monster11_path(conn, :show, monster11)
    assert html_response(conn, 200) =~ "Show monster11"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster11_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster11 = Repo.insert! %Monster11{}
    conn = get conn, monster11_path(conn, :edit, monster11)
    assert html_response(conn, 200) =~ "Edit monster11"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster11 = Repo.insert! %Monster11{}
    conn = put conn, monster11_path(conn, :update, monster11), monster11: @valid_attrs
    assert redirected_to(conn) == monster11_path(conn, :show, monster11)
    assert Repo.get_by(Monster11, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster11 = Repo.insert! %Monster11{}
    conn = put conn, monster11_path(conn, :update, monster11), monster11: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster11"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster11 = Repo.insert! %Monster11{}
    conn = delete conn, monster11_path(conn, :delete, monster11)
    assert redirected_to(conn) == monster11_path(conn, :index)
    refute Repo.get(Monster11, monster11.id)
  end
end
