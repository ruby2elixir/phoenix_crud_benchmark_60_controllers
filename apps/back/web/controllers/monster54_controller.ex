defmodule Back.Monster54Controller do
  use Back.Web, :controller

  alias Back.Monster54

  plug :scrub_params, "monster54" when action in [:create, :update]

  def index(conn, _params) do
    monsters54 = Repo.all(Monster54)
    render(conn, "index.html", monsters54: monsters54)
  end

  def new(conn, _params) do
    changeset = Monster54.changeset(%Monster54{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster54" => monster54_params}) do
    changeset = Monster54.changeset(%Monster54{}, monster54_params)

    case Repo.insert(changeset) do
      {:ok, _monster54} ->
        conn
        |> put_flash(:info, "Monster54 created successfully.")
        |> redirect(to: monster54_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster54 = Repo.get!(Monster54, id)
    render(conn, "show.html", monster54: monster54)
  end

  def edit(conn, %{"id" => id}) do
    monster54 = Repo.get!(Monster54, id)
    changeset = Monster54.changeset(monster54)
    render(conn, "edit.html", monster54: monster54, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster54" => monster54_params}) do
    monster54 = Repo.get!(Monster54, id)
    changeset = Monster54.changeset(monster54, monster54_params)

    case Repo.update(changeset) do
      {:ok, monster54} ->
        conn
        |> put_flash(:info, "Monster54 updated successfully.")
        |> redirect(to: monster54_path(conn, :show, monster54))
      {:error, changeset} ->
        render(conn, "edit.html", monster54: monster54, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster54 = Repo.get!(Monster54, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster54)

    conn
    |> put_flash(:info, "Monster54 deleted successfully.")
    |> redirect(to: monster54_path(conn, :index))
  end
end
