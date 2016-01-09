defmodule Back.Monster50ControllerTest do
  use Back.ConnCase

  alias Back.Monster50
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster50_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters50"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster50_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster50"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster50_path(conn, :create), monster50: @valid_attrs
    assert redirected_to(conn) == monster50_path(conn, :index)
    assert Repo.get_by(Monster50, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster50_path(conn, :create), monster50: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster50"
  end

  test "shows chosen resource", %{conn: conn} do
    monster50 = Repo.insert! %Monster50{}
    conn = get conn, monster50_path(conn, :show, monster50)
    assert html_response(conn, 200) =~ "Show monster50"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster50_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster50 = Repo.insert! %Monster50{}
    conn = get conn, monster50_path(conn, :edit, monster50)
    assert html_response(conn, 200) =~ "Edit monster50"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster50 = Repo.insert! %Monster50{}
    conn = put conn, monster50_path(conn, :update, monster50), monster50: @valid_attrs
    assert redirected_to(conn) == monster50_path(conn, :show, monster50)
    assert Repo.get_by(Monster50, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster50 = Repo.insert! %Monster50{}
    conn = put conn, monster50_path(conn, :update, monster50), monster50: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster50"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster50 = Repo.insert! %Monster50{}
    conn = delete conn, monster50_path(conn, :delete, monster50)
    assert redirected_to(conn) == monster50_path(conn, :index)
    refute Repo.get(Monster50, monster50.id)
  end
end
