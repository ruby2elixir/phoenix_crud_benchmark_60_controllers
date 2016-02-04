defmodule Back.Monster2ControllerTest do
  use Back.ConnCase

  alias Back.Monster2
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster2_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters2"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster2_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster24"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster2_path(conn, :create), monster2: @valid_attrs
    assert redirected_to(conn) == monster2_path(conn, :index)
    assert Repo.get_by(Monster2, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster2_path(conn, :create), monster2: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster2"
  end

  test "shows chosen resource", %{conn: conn} do
    monster2 = Repo.insert! %Monster2{}
    conn = get conn, monster2_path(conn, :show, monster2)
    assert html_response(conn, 200) =~ "Show monster2"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster2_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster2 = Repo.insert! %Monster2{}
    conn = get conn, monster2_path(conn, :edit, monster2)
    assert html_response(conn, 200) =~ "Edit monster2"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster2 = Repo.insert! %Monster2{}
    conn = put conn, monster2_path(conn, :update, monster2), monster2: @valid_attrs
    assert redirected_to(conn) == monster2_path(conn, :show, monster2)
    assert Repo.get_by(Monster2, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster2 = Repo.insert! %Monster2{}
    conn = put conn, monster2_path(conn, :update, monster2), monster2: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster2"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster2 = Repo.insert! %Monster2{}
    conn = delete conn, monster2_path(conn, :delete, monster2)
    assert redirected_to(conn) == monster2_path(conn, :index)
    refute Repo.get(Monster2, monster2.id)
  end
end
