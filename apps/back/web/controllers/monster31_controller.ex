defmodule Back.Monster31Controller do
  use Back.Web, :controller

  alias Back.Monster31

  plug :scrub_params, "monster31" when action in [:create, :update]

  def index(conn, _params) do
    monsters31 = Repo.all(Monster31)
    render(conn, "index.html", monsters31: monsters31)
  end

  def new(conn, _params) do
    changeset = Monster31.changeset(%Monster31{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster31" => monster31_params}) do
    changeset = Monster31.changeset(%Monster31{}, monster31_params)

    case Repo.insert(changeset) do
      {:ok, _monster31} ->
        conn
        |> put_flash(:info, "Monster31 created successfully.")
        |> redirect(to: monster31_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster31 = Repo.get!(Monster31, id)
    render(conn, "show.html", monster31: monster31)
  end

  def edit(conn, %{"id" => id}) do
    monster31 = Repo.get!(Monster31, id)
    changeset = Monster31.changeset(monster31)
    render(conn, "edit.html", monster31: monster31, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster31" => monster31_params}) do
    monster31 = Repo.get!(Monster31, id)
    changeset = Monster31.changeset(monster31, monster31_params)

    case Repo.update(changeset) do
      {:ok, monster31} ->
        conn
        |> put_flash(:info, "Monster31 updated successfully.")
        |> redirect(to: monster31_path(conn, :show, monster31))
      {:error, changeset} ->
        render(conn, "edit.html", monster31: monster31, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster31 = Repo.get!(Monster31, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster31)

    conn
    |> put_flash(:info, "Monster31 deleted successfully.")
    |> redirect(to: monster31_path(conn, :index))
  end
end
