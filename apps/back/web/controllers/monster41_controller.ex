defmodule Back.Monster41Controller do
  use Back.Web, :controller

  alias Back.Monster41

  plug :scrub_params, "monster41" when action in [:create, :update]

  def index(conn, _params) do
    monsters41 = Repo.all(Monster41)
    render(conn, "index.html", monsters41: monsters41)
  end

  def new(conn, _params) do
    changeset = Monster41.changeset(%Monster41{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster41" => monster41_params}) do
    changeset = Monster41.changeset(%Monster41{}, monster41_params)

    case Repo.insert(changeset) do
      {:ok, _monster41} ->
        conn
        |> put_flash(:info, "Monster41 created successfully.")
        |> redirect(to: monster41_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster41 = Repo.get!(Monster41, id)
    render(conn, "show.html", monster41: monster41)
  end

  def edit(conn, %{"id" => id}) do
    monster41 = Repo.get!(Monster41, id)
    changeset = Monster41.changeset(monster41)
    render(conn, "edit.html", monster41: monster41, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster41" => monster41_params}) do
    monster41 = Repo.get!(Monster41, id)
    changeset = Monster41.changeset(monster41, monster41_params)

    case Repo.update(changeset) do
      {:ok, monster41} ->
        conn
        |> put_flash(:info, "Monster41 updated successfully.")
        |> redirect(to: monster41_path(conn, :show, monster41))
      {:error, changeset} ->
        render(conn, "edit.html", monster41: monster41, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster41 = Repo.get!(Monster41, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster41)

    conn
    |> put_flash(:info, "Monster41 deleted successfully.")
    |> redirect(to: monster41_path(conn, :index))
  end
end
