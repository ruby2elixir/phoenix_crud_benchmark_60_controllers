defmodule Back.Monster39Controller do
  use Back.Web, :controller

  alias Back.Monster39

  plug :scrub_params, "monster39" when action in [:create, :update]

  def index(conn, _params) do
    monsters39 = Repo.all(Monster39)
    render(conn, "index.html", monsters39: monsters39)
  end

  def new(conn, _params) do
    changeset = Monster39.changeset(%Monster39{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster39" => monster39_params}) do
    changeset = Monster39.changeset(%Monster39{}, monster39_params)

    case Repo.insert(changeset) do
      {:ok, _monster39} ->
        conn
        |> put_flash(:info, "Monster39 created successfully.")
        |> redirect(to: monster39_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster39 = Repo.get!(Monster39, id)
    render(conn, "show.html", monster39: monster39)
  end

  def edit(conn, %{"id" => id}) do
    monster39 = Repo.get!(Monster39, id)
    changeset = Monster39.changeset(monster39)
    render(conn, "edit.html", monster39: monster39, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster39" => monster39_params}) do
    monster39 = Repo.get!(Monster39, id)
    changeset = Monster39.changeset(monster39, monster39_params)

    case Repo.update(changeset) do
      {:ok, monster39} ->
        conn
        |> put_flash(:info, "Monster39 updated successfully.")
        |> redirect(to: monster39_path(conn, :show, monster39))
      {:error, changeset} ->
        render(conn, "edit.html", monster39: monster39, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster39 = Repo.get!(Monster39, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster39)

    conn
    |> put_flash(:info, "Monster39 deleted successfully.")
    |> redirect(to: monster39_path(conn, :index))
  end
end
