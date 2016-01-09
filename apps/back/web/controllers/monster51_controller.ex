defmodule Back.Monster51Controller do
  use Back.Web, :controller

  alias Back.Monster51

  plug :scrub_params, "monster51" when action in [:create, :update]

  def index(conn, _params) do
    monsters51 = Repo.all(Monster51)
    render(conn, "index.html", monsters51: monsters51)
  end

  def new(conn, _params) do
    changeset = Monster51.changeset(%Monster51{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster51" => monster51_params}) do
    changeset = Monster51.changeset(%Monster51{}, monster51_params)

    case Repo.insert(changeset) do
      {:ok, _monster51} ->
        conn
        |> put_flash(:info, "Monster51 created successfully.")
        |> redirect(to: monster51_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster51 = Repo.get!(Monster51, id)
    render(conn, "show.html", monster51: monster51)
  end

  def edit(conn, %{"id" => id}) do
    monster51 = Repo.get!(Monster51, id)
    changeset = Monster51.changeset(monster51)
    render(conn, "edit.html", monster51: monster51, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster51" => monster51_params}) do
    monster51 = Repo.get!(Monster51, id)
    changeset = Monster51.changeset(monster51, monster51_params)

    case Repo.update(changeset) do
      {:ok, monster51} ->
        conn
        |> put_flash(:info, "Monster51 updated successfully.")
        |> redirect(to: monster51_path(conn, :show, monster51))
      {:error, changeset} ->
        render(conn, "edit.html", monster51: monster51, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster51 = Repo.get!(Monster51, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster51)

    conn
    |> put_flash(:info, "Monster51 deleted successfully.")
    |> redirect(to: monster51_path(conn, :index))
  end
end
