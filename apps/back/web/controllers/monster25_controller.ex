defmodule Back.Monster25Controller do
  use Back.Web, :controller

  alias Back.Monster25

  plug :scrub_params, "monster25" when action in [:create, :update]

  def index(conn, _params) do
    monsters25 = Repo.all(Monster25)
    render(conn, "index.html", monsters25: monsters25)
  end

  def new(conn, _params) do
    changeset = Monster25.changeset(%Monster25{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster25" => monster25_params}) do
    changeset = Monster25.changeset(%Monster25{}, monster25_params)

    case Repo.insert(changeset) do
      {:ok, _monster25} ->
        conn
        |> put_flash(:info, "Monster25 created successfully.")
        |> redirect(to: monster25_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster25 = Repo.get!(Monster25, id)
    render(conn, "show.html", monster25: monster25)
  end

  def edit(conn, %{"id" => id}) do
    monster25 = Repo.get!(Monster25, id)
    changeset = Monster25.changeset(monster25)
    render(conn, "edit.html", monster25: monster25, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster25" => monster25_params}) do
    monster25 = Repo.get!(Monster25, id)
    changeset = Monster25.changeset(monster25, monster25_params)

    case Repo.update(changeset) do
      {:ok, monster25} ->
        conn
        |> put_flash(:info, "Monster25 updated successfully.")
        |> redirect(to: monster25_path(conn, :show, monster25))
      {:error, changeset} ->
        render(conn, "edit.html", monster25: monster25, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster25 = Repo.get!(Monster25, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster25)

    conn
    |> put_flash(:info, "Monster25 deleted successfully.")
    |> redirect(to: monster25_path(conn, :index))
  end
end
