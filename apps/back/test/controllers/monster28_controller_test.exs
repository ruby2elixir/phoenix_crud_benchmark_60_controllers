defmodule Back.Monster28ControllerTest do
  use Back.ConnCase

  alias Back.Monster28
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster28_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters28"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster28_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster28"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster28_path(conn, :create), monster28: @valid_attrs
    assert redirected_to(conn) == monster28_path(conn, :index)
    assert Repo.get_by(Monster28, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster28_path(conn, :create), monster28: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster28"
  end

  test "shows chosen resource", %{conn: conn} do
    monster28 = Repo.insert! %Monster28{}
    conn = get conn, monster28_path(conn, :show, monster28)
    assert html_response(conn, 200) =~ "Show monster28"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster28_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster28 = Repo.insert! %Monster28{}
    conn = get conn, monster28_path(conn, :edit, monster28)
    assert html_response(conn, 200) =~ "Edit monster28"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster28 = Repo.insert! %Monster28{}
    conn = put conn, monster28_path(conn, :update, monster28), monster28: @valid_attrs
    assert redirected_to(conn) == monster28_path(conn, :show, monster28)
    assert Repo.get_by(Monster28, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster28 = Repo.insert! %Monster28{}
    conn = put conn, monster28_path(conn, :update, monster28), monster28: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster28"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster28 = Repo.insert! %Monster28{}
    conn = delete conn, monster28_path(conn, :delete, monster28)
    assert redirected_to(conn) == monster28_path(conn, :index)
    refute Repo.get(Monster28, monster28.id)
  end
end
