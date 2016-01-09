defmodule Back.Monster27Controller do
  use Back.Web, :controller

  alias Back.Monster27

  plug :scrub_params, "monster27" when action in [:create, :update]

  def index(conn, _params) do
    monsters27 = Repo.all(Monster27)
    render(conn, "index.html", monsters27: monsters27)
  end

  def new(conn, _params) do
    changeset = Monster27.changeset(%Monster27{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster27" => monster27_params}) do
    changeset = Monster27.changeset(%Monster27{}, monster27_params)

    case Repo.insert(changeset) do
      {:ok, _monster27} ->
        conn
        |> put_flash(:info, "Monster27 created successfully.")
        |> redirect(to: monster27_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster27 = Repo.get!(Monster27, id)
    render(conn, "show.html", monster27: monster27)
  end

  def edit(conn, %{"id" => id}) do
    monster27 = Repo.get!(Monster27, id)
    changeset = Monster27.changeset(monster27)
    render(conn, "edit.html", monster27: monster27, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster27" => monster27_params}) do
    monster27 = Repo.get!(Monster27, id)
    changeset = Monster27.changeset(monster27, monster27_params)

    case Repo.update(changeset) do
      {:ok, monster27} ->
        conn
        |> put_flash(:info, "Monster27 updated successfully.")
        |> redirect(to: monster27_path(conn, :show, monster27))
      {:error, changeset} ->
        render(conn, "edit.html", monster27: monster27, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster27 = Repo.get!(Monster27, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster27)

    conn
    |> put_flash(:info, "Monster27 deleted successfully.")
    |> redirect(to: monster27_path(conn, :index))
  end
end
