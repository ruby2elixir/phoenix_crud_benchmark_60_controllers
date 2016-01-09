defmodule Back.Monster59Controller do
  use Back.Web, :controller

  alias Back.Monster59

  plug :scrub_params, "monster59" when action in [:create, :update]

  def index(conn, _params) do
    monsters59 = Repo.all(Monster59)
    render(conn, "index.html", monsters59: monsters59)
  end

  def new(conn, _params) do
    changeset = Monster59.changeset(%Monster59{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster59" => monster59_params}) do
    changeset = Monster59.changeset(%Monster59{}, monster59_params)

    case Repo.insert(changeset) do
      {:ok, _monster59} ->
        conn
        |> put_flash(:info, "Monster59 created successfully.")
        |> redirect(to: monster59_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster59 = Repo.get!(Monster59, id)
    render(conn, "show.html", monster59: monster59)
  end

  def edit(conn, %{"id" => id}) do
    monster59 = Repo.get!(Monster59, id)
    changeset = Monster59.changeset(monster59)
    render(conn, "edit.html", monster59: monster59, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster59" => monster59_params}) do
    monster59 = Repo.get!(Monster59, id)
    changeset = Monster59.changeset(monster59, monster59_params)

    case Repo.update(changeset) do
      {:ok, monster59} ->
        conn
        |> put_flash(:info, "Monster59 updated successfully.")
        |> redirect(to: monster59_path(conn, :show, monster59))
      {:error, changeset} ->
        render(conn, "edit.html", monster59: monster59, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster59 = Repo.get!(Monster59, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster59)

    conn
    |> put_flash(:info, "Monster59 deleted successfully.")
    |> redirect(to: monster59_path(conn, :index))
  end
end
