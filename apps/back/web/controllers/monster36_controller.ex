defmodule Back.Monster36Controller do
  use Back.Web, :controller

  alias Back.Monster36

  plug :scrub_params, "monster36" when action in [:create, :update]

  def index(conn, _params) do
    monsters36 = Repo.all(Monster36)
    render(conn, "index.html", monsters36: monsters36)
  end

  def new(conn, _params) do
    changeset = Monster36.changeset(%Monster36{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster36" => monster36_params}) do
    changeset = Monster36.changeset(%Monster36{}, monster36_params)

    case Repo.insert(changeset) do
      {:ok, _monster36} ->
        conn
        |> put_flash(:info, "Monster36 created successfully.")
        |> redirect(to: monster36_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster36 = Repo.get!(Monster36, id)
    render(conn, "show.html", monster36: monster36)
  end

  def edit(conn, %{"id" => id}) do
    monster36 = Repo.get!(Monster36, id)
    changeset = Monster36.changeset(monster36)
    render(conn, "edit.html", monster36: monster36, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster36" => monster36_params}) do
    monster36 = Repo.get!(Monster36, id)
    changeset = Monster36.changeset(monster36, monster36_params)

    case Repo.update(changeset) do
      {:ok, monster36} ->
        conn
        |> put_flash(:info, "Monster36 updated successfully.")
        |> redirect(to: monster36_path(conn, :show, monster36))
      {:error, changeset} ->
        render(conn, "edit.html", monster36: monster36, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster36 = Repo.get!(Monster36, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster36)

    conn
    |> put_flash(:info, "Monster36 deleted successfully.")
    |> redirect(to: monster36_path(conn, :index))
  end
end
