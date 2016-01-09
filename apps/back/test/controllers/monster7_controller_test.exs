defmodule Back.Monster7ControllerTest do
  use Back.ConnCase

  alias Back.Monster7
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster7_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters7"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster7_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster7"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster7_path(conn, :create), monster7: @valid_attrs
    assert redirected_to(conn) == monster7_path(conn, :index)
    assert Repo.get_by(Monster7, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster7_path(conn, :create), monster7: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster7"
  end

  test "shows chosen resource", %{conn: conn} do
    monster7 = Repo.insert! %Monster7{}
    conn = get conn, monster7_path(conn, :show, monster7)
    assert html_response(conn, 200) =~ "Show monster7"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster7_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster7 = Repo.insert! %Monster7{}
    conn = get conn, monster7_path(conn, :edit, monster7)
    assert html_response(conn, 200) =~ "Edit monster7"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster7 = Repo.insert! %Monster7{}
    conn = put conn, monster7_path(conn, :update, monster7), monster7: @valid_attrs
    assert redirected_to(conn) == monster7_path(conn, :show, monster7)
    assert Repo.get_by(Monster7, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster7 = Repo.insert! %Monster7{}
    conn = put conn, monster7_path(conn, :update, monster7), monster7: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster7"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster7 = Repo.insert! %Monster7{}
    conn = delete conn, monster7_path(conn, :delete, monster7)
    assert redirected_to(conn) == monster7_path(conn, :index)
    refute Repo.get(Monster7, monster7.id)
  end
end
