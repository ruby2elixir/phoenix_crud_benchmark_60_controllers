defmodule Back.Monster57Controller do
  use Back.Web, :controller

  alias Back.Monster57

  plug :scrub_params, "monster57" when action in [:create, :update]

  def index(conn, _params) do
    monsters57 = Repo.all(Monster57)
    render(conn, "index.html", monsters57: monsters57)
  end

  def new(conn, _params) do
    changeset = Monster57.changeset(%Monster57{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster57" => monster57_params}) do
    changeset = Monster57.changeset(%Monster57{}, monster57_params)

    case Repo.insert(changeset) do
      {:ok, _monster57} ->
        conn
        |> put_flash(:info, "Monster57 created successfully.")
        |> redirect(to: monster57_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster57 = Repo.get!(Monster57, id)
    render(conn, "show.html", monster57: monster57)
  end

  def edit(conn, %{"id" => id}) do
    monster57 = Repo.get!(Monster57, id)
    changeset = Monster57.changeset(monster57)
    render(conn, "edit.html", monster57: monster57, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster57" => monster57_params}) do
    monster57 = Repo.get!(Monster57, id)
    changeset = Monster57.changeset(monster57, monster57_params)

    case Repo.update(changeset) do
      {:ok, monster57} ->
        conn
        |> put_flash(:info, "Monster57 updated successfully.")
        |> redirect(to: monster57_path(conn, :show, monster57))
      {:error, changeset} ->
        render(conn, "edit.html", monster57: monster57, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster57 = Repo.get!(Monster57, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster57)

    conn
    |> put_flash(:info, "Monster57 deleted successfully.")
    |> redirect(to: monster57_path(conn, :index))
  end
end
