defmodule Back.Monster45Controller do
  use Back.Web, :controller

  alias Back.Monster45

  plug :scrub_params, "monster45" when action in [:create, :update]

  def index(conn, _params) do
    monsters45 = Repo.all(Monster45)
    render(conn, "index.html", monsters45: monsters45)
  end

  def new(conn, _params) do
    changeset = Monster45.changeset(%Monster45{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster45" => monster45_params}) do
    changeset = Monster45.changeset(%Monster45{}, monster45_params)

    case Repo.insert(changeset) do
      {:ok, _monster45} ->
        conn
        |> put_flash(:info, "Monster45 created successfully.")
        |> redirect(to: monster45_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster45 = Repo.get!(Monster45, id)
    render(conn, "show.html", monster45: monster45)
  end

  def edit(conn, %{"id" => id}) do
    monster45 = Repo.get!(Monster45, id)
    changeset = Monster45.changeset(monster45)
    render(conn, "edit.html", monster45: monster45, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster45" => monster45_params}) do
    monster45 = Repo.get!(Monster45, id)
    changeset = Monster45.changeset(monster45, monster45_params)

    case Repo.update(changeset) do
      {:ok, monster45} ->
        conn
        |> put_flash(:info, "Monster45 updated successfully.")
        |> redirect(to: monster45_path(conn, :show, monster45))
      {:error, changeset} ->
        render(conn, "edit.html", monster45: monster45, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster45 = Repo.get!(Monster45, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster45)

    conn
    |> put_flash(:info, "Monster45 deleted successfully.")
    |> redirect(to: monster45_path(conn, :index))
  end
end
