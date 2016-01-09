defmodule Back.Monster29Controller do
  use Back.Web, :controller

  alias Back.Monster29

  plug :scrub_params, "monster29" when action in [:create, :update]

  def index(conn, _params) do
    monsters29 = Repo.all(Monster29)
    render(conn, "index.html", monsters29: monsters29)
  end

  def new(conn, _params) do
    changeset = Monster29.changeset(%Monster29{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster29" => monster29_params}) do
    changeset = Monster29.changeset(%Monster29{}, monster29_params)

    case Repo.insert(changeset) do
      {:ok, _monster29} ->
        conn
        |> put_flash(:info, "Monster29 created successfully.")
        |> redirect(to: monster29_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster29 = Repo.get!(Monster29, id)
    render(conn, "show.html", monster29: monster29)
  end

  def edit(conn, %{"id" => id}) do
    monster29 = Repo.get!(Monster29, id)
    changeset = Monster29.changeset(monster29)
    render(conn, "edit.html", monster29: monster29, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster29" => monster29_params}) do
    monster29 = Repo.get!(Monster29, id)
    changeset = Monster29.changeset(monster29, monster29_params)

    case Repo.update(changeset) do
      {:ok, monster29} ->
        conn
        |> put_flash(:info, "Monster29 updated successfully.")
        |> redirect(to: monster29_path(conn, :show, monster29))
      {:error, changeset} ->
        render(conn, "edit.html", monster29: monster29, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster29 = Repo.get!(Monster29, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster29)

    conn
    |> put_flash(:info, "Monster29 deleted successfully.")
    |> redirect(to: monster29_path(conn, :index))
  end
end
