defmodule Back.Monster6ControllerTest do
  use Back.ConnCase

  alias Back.Monster6
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster6_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters6"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster6_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster6"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster6_path(conn, :create), monster6: @valid_attrs
    assert redirected_to(conn) == monster6_path(conn, :index)
    assert Repo.get_by(Monster6, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster6_path(conn, :create), monster6: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster6"
  end

  test "shows chosen resource", %{conn: conn} do
    monster6 = Repo.insert! %Monster6{}
    conn = get conn, monster6_path(conn, :show, monster6)
    assert html_response(conn, 200) =~ "Show monster6"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster6_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster6 = Repo.insert! %Monster6{}
    conn = get conn, monster6_path(conn, :edit, monster6)
    assert html_response(conn, 200) =~ "Edit monster6"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster6 = Repo.insert! %Monster6{}
    conn = put conn, monster6_path(conn, :update, monster6), monster6: @valid_attrs
    assert redirected_to(conn) == monster6_path(conn, :show, monster6)
    assert Repo.get_by(Monster6, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster6 = Repo.insert! %Monster6{}
    conn = put conn, monster6_path(conn, :update, monster6), monster6: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster6"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster6 = Repo.insert! %Monster6{}
    conn = delete conn, monster6_path(conn, :delete, monster6)
    assert redirected_to(conn) == monster6_path(conn, :index)
    refute Repo.get(Monster6, monster6.id)
  end
end
