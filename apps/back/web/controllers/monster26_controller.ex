defmodule Back.Monster26Controller do
  use Back.Web, :controller

  alias Back.Monster26

  plug :scrub_params, "monster26" when action in [:create, :update]

  def index(conn, _params) do
    monsters26 = Repo.all(Monster26)
    render(conn, "index.html", monsters26: monsters26)
  end

  def new(conn, _params) do
    changeset = Monster26.changeset(%Monster26{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster26" => monster26_params}) do
    changeset = Monster26.changeset(%Monster26{}, monster26_params)

    case Repo.insert(changeset) do
      {:ok, _monster26} ->
        conn
        |> put_flash(:info, "Monster26 created successfully.")
        |> redirect(to: monster26_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster26 = Repo.get!(Monster26, id)
    render(conn, "show.html", monster26: monster26)
  end

  def edit(conn, %{"id" => id}) do
    monster26 = Repo.get!(Monster26, id)
    changeset = Monster26.changeset(monster26)
    render(conn, "edit.html", monster26: monster26, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster26" => monster26_params}) do
    monster26 = Repo.get!(Monster26, id)
    changeset = Monster26.changeset(monster26, monster26_params)

    case Repo.update(changeset) do
      {:ok, monster26} ->
        conn
        |> put_flash(:info, "Monster26 updated successfully.")
        |> redirect(to: monster26_path(conn, :show, monster26))
      {:error, changeset} ->
        render(conn, "edit.html", monster26: monster26, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster26 = Repo.get!(Monster26, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster26)

    conn
    |> put_flash(:info, "Monster26 deleted successfully.")
    |> redirect(to: monster26_path(conn, :index))
  end
end
