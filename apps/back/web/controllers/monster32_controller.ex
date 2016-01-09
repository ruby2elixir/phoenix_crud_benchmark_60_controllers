defmodule Back.Monster32Controller do
  use Back.Web, :controller

  alias Back.Monster32

  plug :scrub_params, "monster32" when action in [:create, :update]

  def index(conn, _params) do
    monsters32 = Repo.all(Monster32)
    render(conn, "index.html", monsters32: monsters32)
  end

  def new(conn, _params) do
    changeset = Monster32.changeset(%Monster32{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster32" => monster32_params}) do
    changeset = Monster32.changeset(%Monster32{}, monster32_params)

    case Repo.insert(changeset) do
      {:ok, _monster32} ->
        conn
        |> put_flash(:info, "Monster32 created successfully.")
        |> redirect(to: monster32_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster32 = Repo.get!(Monster32, id)
    render(conn, "show.html", monster32: monster32)
  end

  def edit(conn, %{"id" => id}) do
    monster32 = Repo.get!(Monster32, id)
    changeset = Monster32.changeset(monster32)
    render(conn, "edit.html", monster32: monster32, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster32" => monster32_params}) do
    monster32 = Repo.get!(Monster32, id)
    changeset = Monster32.changeset(monster32, monster32_params)

    case Repo.update(changeset) do
      {:ok, monster32} ->
        conn
        |> put_flash(:info, "Monster32 updated successfully.")
        |> redirect(to: monster32_path(conn, :show, monster32))
      {:error, changeset} ->
        render(conn, "edit.html", monster32: monster32, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster32 = Repo.get!(Monster32, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster32)

    conn
    |> put_flash(:info, "Monster32 deleted successfully.")
    |> redirect(to: monster32_path(conn, :index))
  end
end
