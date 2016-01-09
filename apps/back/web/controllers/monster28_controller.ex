defmodule Back.Monster28Controller do
  use Back.Web, :controller

  alias Back.Monster28

  plug :scrub_params, "monster28" when action in [:create, :update]

  def index(conn, _params) do
    monsters28 = Repo.all(Monster28)
    render(conn, "index.html", monsters28: monsters28)
  end

  def new(conn, _params) do
    changeset = Monster28.changeset(%Monster28{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster28" => monster28_params}) do
    changeset = Monster28.changeset(%Monster28{}, monster28_params)

    case Repo.insert(changeset) do
      {:ok, _monster28} ->
        conn
        |> put_flash(:info, "Monster28 created successfully.")
        |> redirect(to: monster28_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster28 = Repo.get!(Monster28, id)
    render(conn, "show.html", monster28: monster28)
  end

  def edit(conn, %{"id" => id}) do
    monster28 = Repo.get!(Monster28, id)
    changeset = Monster28.changeset(monster28)
    render(conn, "edit.html", monster28: monster28, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster28" => monster28_params}) do
    monster28 = Repo.get!(Monster28, id)
    changeset = Monster28.changeset(monster28, monster28_params)

    case Repo.update(changeset) do
      {:ok, monster28} ->
        conn
        |> put_flash(:info, "Monster28 updated successfully.")
        |> redirect(to: monster28_path(conn, :show, monster28))
      {:error, changeset} ->
        render(conn, "edit.html", monster28: monster28, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster28 = Repo.get!(Monster28, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster28)

    conn
    |> put_flash(:info, "Monster28 deleted successfully.")
    |> redirect(to: monster28_path(conn, :index))
  end
end
