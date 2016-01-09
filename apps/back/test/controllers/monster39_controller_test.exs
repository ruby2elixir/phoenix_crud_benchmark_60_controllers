defmodule Back.Monster39ControllerTest do
  use Back.ConnCase

  alias Back.Monster39
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster39_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters39"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster39_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster39"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster39_path(conn, :create), monster39: @valid_attrs
    assert redirected_to(conn) == monster39_path(conn, :index)
    assert Repo.get_by(Monster39, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster39_path(conn, :create), monster39: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster39"
  end

  test "shows chosen resource", %{conn: conn} do
    monster39 = Repo.insert! %Monster39{}
    conn = get conn, monster39_path(conn, :show, monster39)
    assert html_response(conn, 200) =~ "Show monster39"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster39_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster39 = Repo.insert! %Monster39{}
    conn = get conn, monster39_path(conn, :edit, monster39)
    assert html_response(conn, 200) =~ "Edit monster39"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster39 = Repo.insert! %Monster39{}
    conn = put conn, monster39_path(conn, :update, monster39), monster39: @valid_attrs
    assert redirected_to(conn) == monster39_path(conn, :show, monster39)
    assert Repo.get_by(Monster39, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster39 = Repo.insert! %Monster39{}
    conn = put conn, monster39_path(conn, :update, monster39), monster39: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster39"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster39 = Repo.insert! %Monster39{}
    conn = delete conn, monster39_path(conn, :delete, monster39)
    assert redirected_to(conn) == monster39_path(conn, :index)
    refute Repo.get(Monster39, monster39.id)
  end
end
