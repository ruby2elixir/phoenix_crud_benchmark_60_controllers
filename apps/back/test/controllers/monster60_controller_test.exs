defmodule Back.Monster60ControllerTest do
  use Back.ConnCase

  alias Back.Monster60
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster60_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters60"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster60_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster60"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster60_path(conn, :create), monster60: @valid_attrs
    assert redirected_to(conn) == monster60_path(conn, :index)
    assert Repo.get_by(Monster60, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster60_path(conn, :create), monster60: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster60"
  end

  test "shows chosen resource", %{conn: conn} do
    monster60 = Repo.insert! %Monster60{}
    conn = get conn, monster60_path(conn, :show, monster60)
    assert html_response(conn, 200) =~ "Show monster60"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster60_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster60 = Repo.insert! %Monster60{}
    conn = get conn, monster60_path(conn, :edit, monster60)
    assert html_response(conn, 200) =~ "Edit monster60"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster60 = Repo.insert! %Monster60{}
    conn = put conn, monster60_path(conn, :update, monster60), monster60: @valid_attrs
    assert redirected_to(conn) == monster60_path(conn, :show, monster60)
    assert Repo.get_by(Monster60, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster60 = Repo.insert! %Monster60{}
    conn = put conn, monster60_path(conn, :update, monster60), monster60: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster60"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster60 = Repo.insert! %Monster60{}
    conn = delete conn, monster60_path(conn, :delete, monster60)
    assert redirected_to(conn) == monster60_path(conn, :index)
    refute Repo.get(Monster60, monster60.id)
  end
end
