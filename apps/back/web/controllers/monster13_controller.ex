defmodule Back.Monster13Controller do
  use Back.Web, :controller

  alias Back.Monster13

  plug :scrub_params, "monster13" when action in [:create, :update]

  def index(conn, _params) do
    monsters13 = Repo.all(Monster13)
    render(conn, "index.html", monsters13: monsters13)
  end

  def new(conn, _params) do
    changeset = Monster13.changeset(%Monster13{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster13" => monster13_params}) do
    changeset = Monster13.changeset(%Monster13{}, monster13_params)

    case Repo.insert(changeset) do
      {:ok, _monster13} ->
        conn
        |> put_flash(:info, "Monster13 created successfully.")
        |> redirect(to: monster13_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster13 = Repo.get!(Monster13, id)
    render(conn, "show.html", monster13: monster13)
  end

  def edit(conn, %{"id" => id}) do
    monster13 = Repo.get!(Monster13, id)
    changeset = Monster13.changeset(monster13)
    render(conn, "edit.html", monster13: monster13, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster13" => monster13_params}) do
    monster13 = Repo.get!(Monster13, id)
    changeset = Monster13.changeset(monster13, monster13_params)

    case Repo.update(changeset) do
      {:ok, monster13} ->
        conn
        |> put_flash(:info, "Monster13 updated successfully.")
        |> redirect(to: monster13_path(conn, :show, monster13))
      {:error, changeset} ->
        render(conn, "edit.html", monster13: monster13, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster13 = Repo.get!(Monster13, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster13)

    conn
    |> put_flash(:info, "Monster13 deleted successfully.")
    |> redirect(to: monster13_path(conn, :index))
  end
end
