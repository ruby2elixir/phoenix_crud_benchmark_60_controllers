defmodule Back.Monster4ControllerTest do
  use Back.ConnCase

  alias Back.Monster4
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster4_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters4"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster4_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster4"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster4_path(conn, :create), monster4: @valid_attrs
    assert redirected_to(conn) == monster4_path(conn, :index)
    assert Repo.get_by(Monster4, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster4_path(conn, :create), monster4: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster4"
  end

  test "shows chosen resource", %{conn: conn} do
    monster4 = Repo.insert! %Monster4{}
    conn = get conn, monster4_path(conn, :show, monster4)
    assert html_response(conn, 200) =~ "Show monster4"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster4_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster4 = Repo.insert! %Monster4{}
    conn = get conn, monster4_path(conn, :edit, monster4)
    assert html_response(conn, 200) =~ "Edit monster4"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster4 = Repo.insert! %Monster4{}
    conn = put conn, monster4_path(conn, :update, monster4), monster4: @valid_attrs
    assert redirected_to(conn) == monster4_path(conn, :show, monster4)
    assert Repo.get_by(Monster4, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster4 = Repo.insert! %Monster4{}
    conn = put conn, monster4_path(conn, :update, monster4), monster4: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster4"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster4 = Repo.insert! %Monster4{}
    conn = delete conn, monster4_path(conn, :delete, monster4)
    assert redirected_to(conn) == monster4_path(conn, :index)
    refute Repo.get(Monster4, monster4.id)
  end
end
