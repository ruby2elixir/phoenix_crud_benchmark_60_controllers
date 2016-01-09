defmodule Back.Monster38ControllerTest do
  use Back.ConnCase

  alias Back.Monster38
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster38_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters38"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster38_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster38"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster38_path(conn, :create), monster38: @valid_attrs
    assert redirected_to(conn) == monster38_path(conn, :index)
    assert Repo.get_by(Monster38, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster38_path(conn, :create), monster38: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster38"
  end

  test "shows chosen resource", %{conn: conn} do
    monster38 = Repo.insert! %Monster38{}
    conn = get conn, monster38_path(conn, :show, monster38)
    assert html_response(conn, 200) =~ "Show monster38"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster38_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster38 = Repo.insert! %Monster38{}
    conn = get conn, monster38_path(conn, :edit, monster38)
    assert html_response(conn, 200) =~ "Edit monster38"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster38 = Repo.insert! %Monster38{}
    conn = put conn, monster38_path(conn, :update, monster38), monster38: @valid_attrs
    assert redirected_to(conn) == monster38_path(conn, :show, monster38)
    assert Repo.get_by(Monster38, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster38 = Repo.insert! %Monster38{}
    conn = put conn, monster38_path(conn, :update, monster38), monster38: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster38"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster38 = Repo.insert! %Monster38{}
    conn = delete conn, monster38_path(conn, :delete, monster38)
    assert redirected_to(conn) == monster38_path(conn, :index)
    refute Repo.get(Monster38, monster38.id)
  end
end
