defmodule Back.Monster43ControllerTest do
  use Back.ConnCase

  alias Back.Monster43
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster43_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters43"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster43_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster43"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster43_path(conn, :create), monster43: @valid_attrs
    assert redirected_to(conn) == monster43_path(conn, :index)
    assert Repo.get_by(Monster43, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster43_path(conn, :create), monster43: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster43"
  end

  test "shows chosen resource", %{conn: conn} do
    monster43 = Repo.insert! %Monster43{}
    conn = get conn, monster43_path(conn, :show, monster43)
    assert html_response(conn, 200) =~ "Show monster43"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster43_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster43 = Repo.insert! %Monster43{}
    conn = get conn, monster43_path(conn, :edit, monster43)
    assert html_response(conn, 200) =~ "Edit monster43"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster43 = Repo.insert! %Monster43{}
    conn = put conn, monster43_path(conn, :update, monster43), monster43: @valid_attrs
    assert redirected_to(conn) == monster43_path(conn, :show, monster43)
    assert Repo.get_by(Monster43, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster43 = Repo.insert! %Monster43{}
    conn = put conn, monster43_path(conn, :update, monster43), monster43: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster43"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster43 = Repo.insert! %Monster43{}
    conn = delete conn, monster43_path(conn, :delete, monster43)
    assert redirected_to(conn) == monster43_path(conn, :index)
    refute Repo.get(Monster43, monster43.id)
  end
end
