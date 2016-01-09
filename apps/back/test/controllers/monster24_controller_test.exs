defmodule Back.Monster24ControllerTest do
  use Back.ConnCase

  alias Back.Monster24
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster24_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters24"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster24_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster24"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster24_path(conn, :create), monster24: @valid_attrs
    assert redirected_to(conn) == monster24_path(conn, :index)
    assert Repo.get_by(Monster24, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster24_path(conn, :create), monster24: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster24"
  end

  test "shows chosen resource", %{conn: conn} do
    monster24 = Repo.insert! %Monster24{}
    conn = get conn, monster24_path(conn, :show, monster24)
    assert html_response(conn, 200) =~ "Show monster24"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster24_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster24 = Repo.insert! %Monster24{}
    conn = get conn, monster24_path(conn, :edit, monster24)
    assert html_response(conn, 200) =~ "Edit monster24"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster24 = Repo.insert! %Monster24{}
    conn = put conn, monster24_path(conn, :update, monster24), monster24: @valid_attrs
    assert redirected_to(conn) == monster24_path(conn, :show, monster24)
    assert Repo.get_by(Monster24, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster24 = Repo.insert! %Monster24{}
    conn = put conn, monster24_path(conn, :update, monster24), monster24: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster24"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster24 = Repo.insert! %Monster24{}
    conn = delete conn, monster24_path(conn, :delete, monster24)
    assert redirected_to(conn) == monster24_path(conn, :index)
    refute Repo.get(Monster24, monster24.id)
  end
end
