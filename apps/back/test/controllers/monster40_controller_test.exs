defmodule Back.Monster40ControllerTest do
  use Back.ConnCase

  alias Back.Monster40
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, monster40_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing monsters40"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, monster40_path(conn, :new)
    assert html_response(conn, 200) =~ "New monster40"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, monster40_path(conn, :create), monster40: @valid_attrs
    assert redirected_to(conn) == monster40_path(conn, :index)
    assert Repo.get_by(Monster40, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, monster40_path(conn, :create), monster40: @invalid_attrs
    assert html_response(conn, 200) =~ "New monster40"
  end

  test "shows chosen resource", %{conn: conn} do
    monster40 = Repo.insert! %Monster40{}
    conn = get conn, monster40_path(conn, :show, monster40)
    assert html_response(conn, 200) =~ "Show monster40"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, monster40_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    monster40 = Repo.insert! %Monster40{}
    conn = get conn, monster40_path(conn, :edit, monster40)
    assert html_response(conn, 200) =~ "Edit monster40"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    monster40 = Repo.insert! %Monster40{}
    conn = put conn, monster40_path(conn, :update, monster40), monster40: @valid_attrs
    assert redirected_to(conn) == monster40_path(conn, :show, monster40)
    assert Repo.get_by(Monster40, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    monster40 = Repo.insert! %Monster40{}
    conn = put conn, monster40_path(conn, :update, monster40), monster40: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit monster40"
  end

  test "deletes chosen resource", %{conn: conn} do
    monster40 = Repo.insert! %Monster40{}
    conn = delete conn, monster40_path(conn, :delete, monster40)
    assert redirected_to(conn) == monster40_path(conn, :index)
    refute Repo.get(Monster40, monster40.id)
  end
end
