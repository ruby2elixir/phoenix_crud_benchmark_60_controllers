defmodule Back.Monster58ControllerTest do
  use Back.ConnCase

  alias Back.Monster58
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster58_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters58"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster58_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster58"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster58_path(conn, :create), monster58: @valid_attrs
    assert redirected_to(conn) == monster58_path(conn, :index)
    assert Repo.get_by(Monster58, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster58_path(conn, :create), monster58: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster58"
  end

  test "shows chosen resource", %{conn: conn} do
    monster58 = Repo.insert! %Monster58{}
    conn = get conn, monster58_path(conn, :show, monster58)
    assert html_response(conn, 200) =~ "Show monster58"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster58_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster58 = Repo.insert! %Monster58{}
    conn = get conn, monster58_path(conn, :edit, monster58)
    assert html_response(conn, 200) =~ "Edit monster58"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster58 = Repo.insert! %Monster58{}
    conn = put conn, monster58_path(conn, :update, monster58), monster58: @valid_attrs
    assert redirected_to(conn) == monster58_path(conn, :show, monster58)
    assert Repo.get_by(Monster58, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster58 = Repo.insert! %Monster58{}
    conn = put conn, monster58_path(conn, :update, monster58), monster58: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster58"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster58 = Repo.insert! %Monster58{}
    conn = delete conn, monster58_path(conn, :delete, monster58)
    assert redirected_to(conn) == monster58_path(conn, :index)
    refute Repo.get(Monster58, monster58.id)
  end
end
