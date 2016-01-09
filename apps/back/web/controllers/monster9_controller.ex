defmodule Back.Monster9Controller do
  use Back.Web, :controller

  alias Back.Monster9

  plug :scrub_params, "monster9" when action in [:create, :update]

  def index(conn, _params) do
    monsters9 = Repo.all(Monster9)
    render(conn, "index.html", monsters9: monsters9)
  end

  def new(conn, _params) do
    changeset = Monster9.changeset(%Monster9{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster9" => monster9_params}) do
    changeset = Monster9.changeset(%Monster9{}, monster9_params)

    case Repo.insert(changeset) do
      {:ok, _monster9} ->
        conn
        |> put_flash(:info, "Monster9 created successfully.")
        |> redirect(to: monster9_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster9 = Repo.get!(Monster9, id)
    render(conn, "show.html", monster9: monster9)
  end

  def edit(conn, %{"id" => id}) do
    monster9 = Repo.get!(Monster9, id)
    changeset = Monster9.changeset(monster9)
    render(conn, "edit.html", monster9: monster9, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster9" => monster9_params}) do
    monster9 = Repo.get!(Monster9, id)
    changeset = Monster9.changeset(monster9, monster9_params)

    case Repo.update(changeset) do
      {:ok, monster9} ->
        conn
        |> put_flash(:info, "Monster9 updated successfully.")
        |> redirect(to: monster9_path(conn, :show, monster9))
      {:error, changeset} ->
        render(conn, "edit.html", monster9: monster9, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster9 = Repo.get!(Monster9, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster9)

    conn
    |> put_flash(:info, "Monster9 deleted successfully.")
    |> redirect(to: monster9_path(conn, :index))
  end
end
