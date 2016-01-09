defmodule Back.Monster22Controller do
  use Back.Web, :controller

  alias Back.Monster22

  plug :scrub_params, "monster22" when action in [:create, :update]

  def index(conn, _params) do
    monsters22 = Repo.all(Monster22)
    render(conn, "index.html", monsters22: monsters22)
  end

  def new(conn, _params) do
    changeset = Monster22.changeset(%Monster22{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster22" => monster22_params}) do
    changeset = Monster22.changeset(%Monster22{}, monster22_params)

    case Repo.insert(changeset) do
      {:ok, _monster22} ->
        conn
        |> put_flash(:info, "Monster22 created successfully.")
        |> redirect(to: monster22_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster22 = Repo.get!(Monster22, id)
    render(conn, "show.html", monster22: monster22)
  end

  def edit(conn, %{"id" => id}) do
    monster22 = Repo.get!(Monster22, id)
    changeset = Monster22.changeset(monster22)
    render(conn, "edit.html", monster22: monster22, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster22" => monster22_params}) do
    monster22 = Repo.get!(Monster22, id)
    changeset = Monster22.changeset(monster22, monster22_params)

    case Repo.update(changeset) do
      {:ok, monster22} ->
        conn
        |> put_flash(:info, "Monster22 updated successfully.")
        |> redirect(to: monster22_path(conn, :show, monster22))
      {:error, changeset} ->
        render(conn, "edit.html", monster22: monster22, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster22 = Repo.get!(Monster22, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster22)

    conn
    |> put_flash(:info, "Monster22 deleted successfully.")
    |> redirect(to: monster22_path(conn, :index))
  end
end
