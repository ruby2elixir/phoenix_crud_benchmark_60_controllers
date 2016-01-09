defmodule Back.Monster19ControllerTest do
  use Back.ConnCase

  alias Back.Monster19
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster19_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters19"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster19_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster19"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster19_path(conn, :create), monster19: @valid_attrs
    assert redirected_to(conn) == monster19_path(conn, :index)
    assert Repo.get_by(Monster19, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster19_path(conn, :create), monster19: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster19"
  end

  test "shows chosen resource", %{conn: conn} do
    monster19 = Repo.insert! %Monster19{}
    conn = get conn, monster19_path(conn, :show, monster19)
    assert html_response(conn, 200) =~ "Show monster19"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster19_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster19 = Repo.insert! %Monster19{}
    conn = get conn, monster19_path(conn, :edit, monster19)
    assert html_response(conn, 200) =~ "Edit monster19"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster19 = Repo.insert! %Monster19{}
    conn = put conn, monster19_path(conn, :update, monster19), monster19: @valid_attrs
    assert redirected_to(conn) == monster19_path(conn, :show, monster19)
    assert Repo.get_by(Monster19, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster19 = Repo.insert! %Monster19{}
    conn = put conn, monster19_path(conn, :update, monster19), monster19: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster19"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster19 = Repo.insert! %Monster19{}
    conn = delete conn, monster19_path(conn, :delete, monster19)
    assert redirected_to(conn) == monster19_path(conn, :index)
    refute Repo.get(Monster19, monster19.id)
  end
end
