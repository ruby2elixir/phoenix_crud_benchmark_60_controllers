defmodule Back.Monster3ControllerTest do
  use Back.ConnCase

  alias Back.Monster3
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster3_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters3"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster3_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster3"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster3_path(conn, :create), monster3: @valid_attrs
    assert redirected_to(conn) == monster3_path(conn, :index)
    assert Repo.get_by(Monster3, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster3_path(conn, :create), monster3: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster3"
  end

  test "shows chosen resource", %{conn: conn} do
    monster3 = Repo.insert! %Monster3{}
    conn = get conn, monster3_path(conn, :show, monster3)
    assert html_response(conn, 200) =~ "Show monster3"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster3_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster3 = Repo.insert! %Monster3{}
    conn = get conn, monster3_path(conn, :edit, monster3)
    assert html_response(conn, 200) =~ "Edit monster3"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster3 = Repo.insert! %Monster3{}
    conn = put conn, monster3_path(conn, :update, monster3), monster3: @valid_attrs
    assert redirected_to(conn) == monster3_path(conn, :show, monster3)
    assert Repo.get_by(Monster3, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster3 = Repo.insert! %Monster3{}
    conn = put conn, monster3_path(conn, :update, monster3), monster3: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster3"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster3 = Repo.insert! %Monster3{}
    conn = delete conn, monster3_path(conn, :delete, monster3)
    assert redirected_to(conn) == monster3_path(conn, :index)
    refute Repo.get(Monster3, monster3.id)
  end
end
