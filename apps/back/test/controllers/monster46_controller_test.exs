defmodule Back.Monster46ControllerTest do
  use Back.ConnCase

  alias Back.Monster46
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster46_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters46"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster46_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster46"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster46_path(conn, :create), monster46: @valid_attrs
    assert redirected_to(conn) == monster46_path(conn, :index)
    assert Repo.get_by(Monster46, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster46_path(conn, :create), monster46: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster46"
  end

  test "shows chosen resource", %{conn: conn} do
    monster46 = Repo.insert! %Monster46{}
    conn = get conn, monster46_path(conn, :show, monster46)
    assert html_response(conn, 200) =~ "Show monster46"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster46_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster46 = Repo.insert! %Monster46{}
    conn = get conn, monster46_path(conn, :edit, monster46)
    assert html_response(conn, 200) =~ "Edit monster46"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster46 = Repo.insert! %Monster46{}
    conn = put conn, monster46_path(conn, :update, monster46), monster46: @valid_attrs
    assert redirected_to(conn) == monster46_path(conn, :show, monster46)
    assert Repo.get_by(Monster46, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster46 = Repo.insert! %Monster46{}
    conn = put conn, monster46_path(conn, :update, monster46), monster46: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster46"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster46 = Repo.insert! %Monster46{}
    conn = delete conn, monster46_path(conn, :delete, monster46)
    assert redirected_to(conn) == monster46_path(conn, :index)
    refute Repo.get(Monster46, monster46.id)
  end
end
