defmodule Back.Monster53ControllerTest do
  use Back.ConnCase

  alias Back.Monster53
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster53_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters53"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster53_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster53"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster53_path(conn, :create), monster53: @valid_attrs
    assert redirected_to(conn) == monster53_path(conn, :index)
    assert Repo.get_by(Monster53, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster53_path(conn, :create), monster53: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster53"
  end

  test "shows chosen resource", %{conn: conn} do
    monster53 = Repo.insert! %Monster53{}
    conn = get conn, monster53_path(conn, :show, monster53)
    assert html_response(conn, 200) =~ "Show monster53"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster53_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster53 = Repo.insert! %Monster53{}
    conn = get conn, monster53_path(conn, :edit, monster53)
    assert html_response(conn, 200) =~ "Edit monster53"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster53 = Repo.insert! %Monster53{}
    conn = put conn, monster53_path(conn, :update, monster53), monster53: @valid_attrs
    assert redirected_to(conn) == monster53_path(conn, :show, monster53)
    assert Repo.get_by(Monster53, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster53 = Repo.insert! %Monster53{}
    conn = put conn, monster53_path(conn, :update, monster53), monster53: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster53"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster53 = Repo.insert! %Monster53{}
    conn = delete conn, monster53_path(conn, :delete, monster53)
    assert redirected_to(conn) == monster53_path(conn, :index)
    refute Repo.get(Monster53, monster53.id)
  end
end
