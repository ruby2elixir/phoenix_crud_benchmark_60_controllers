defmodule Back.Monster20Controller do
  use Back.Web, :controller

  alias Back.Monster20

  plug :scrub_params, "monster20" when action in [:create, :update]

  def index(conn, _params) do
    monsters20 = Repo.all(Monster20)
    render(conn, "index.html", monsters20: monsters20)
  end

  def new(conn, _params) do
    changeset = Monster20.changeset(%Monster20{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster20" => monster20_params}) do
    changeset = Monster20.changeset(%Monster20{}, monster20_params)

    case Repo.insert(changeset) do
      {:ok, _monster20} ->
        conn
        |> put_flash(:info, "Monster20 created successfully.")
        |> redirect(to: monster20_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster20 = Repo.get!(Monster20, id)
    render(conn, "show.html", monster20: monster20)
  end

  def edit(conn, %{"id" => id}) do
    monster20 = Repo.get!(Monster20, id)
    changeset = Monster20.changeset(monster20)
    render(conn, "edit.html", monster20: monster20, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster20" => monster20_params}) do
    monster20 = Repo.get!(Monster20, id)
    changeset = Monster20.changeset(monster20, monster20_params)

    case Repo.update(changeset) do
      {:ok, monster20} ->
        conn
        |> put_flash(:info, "Monster20 updated successfully.")
        |> redirect(to: monster20_path(conn, :show, monster20))
      {:error, changeset} ->
        render(conn, "edit.html", monster20: monster20, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster20 = Repo.get!(Monster20, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster20)

    conn
    |> put_flash(:info, "Monster20 deleted successfully.")
    |> redirect(to: monster20_path(conn, :index))
  end
end
