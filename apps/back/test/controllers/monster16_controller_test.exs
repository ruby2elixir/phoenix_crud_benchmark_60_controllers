defmodule Back.Monster16ControllerTest do
  use Back.ConnCase

  alias Back.Monster16
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster16_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters16"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster16_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster16"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster16_path(conn, :create), monster16: @valid_attrs
    assert redirected_to(conn) == monster16_path(conn, :index)
    assert Repo.get_by(Monster16, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster16_path(conn, :create), monster16: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster16"
  end

  test "shows chosen resource", %{conn: conn} do
    monster16 = Repo.insert! %Monster16{}
    conn = get conn, monster16_path(conn, :show, monster16)
    assert html_response(conn, 200) =~ "Show monster16"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster16_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster16 = Repo.insert! %Monster16{}
    conn = get conn, monster16_path(conn, :edit, monster16)
    assert html_response(conn, 200) =~ "Edit monster16"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster16 = Repo.insert! %Monster16{}
    conn = put conn, monster16_path(conn, :update, monster16), monster16: @valid_attrs
    assert redirected_to(conn) == monster16_path(conn, :show, monster16)
    assert Repo.get_by(Monster16, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster16 = Repo.insert! %Monster16{}
    conn = put conn, monster16_path(conn, :update, monster16), monster16: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster16"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster16 = Repo.insert! %Monster16{}
    conn = delete conn, monster16_path(conn, :delete, monster16)
    assert redirected_to(conn) == monster16_path(conn, :index)
    refute Repo.get(Monster16, monster16.id)
  end
end
