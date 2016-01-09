defmodule Back.Monster37Controller do
  use Back.Web, :controller

  alias Back.Monster37

  plug :scrub_params, "monster37" when action in [:create, :update]

  def index(conn, _params) do
    monsters37 = Repo.all(Monster37)
    render(conn, "index.html", monsters37: monsters37)
  end

  def new(conn, _params) do
    changeset = Monster37.changeset(%Monster37{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster37" => monster37_params}) do
    changeset = Monster37.changeset(%Monster37{}, monster37_params)

    case Repo.insert(changeset) do
      {:ok, _monster37} ->
        conn
        |> put_flash(:info, "Monster37 created successfully.")
        |> redirect(to: monster37_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster37 = Repo.get!(Monster37, id)
    render(conn, "show.html", monster37: monster37)
  end

  def edit(conn, %{"id" => id}) do
    monster37 = Repo.get!(Monster37, id)
    changeset = Monster37.changeset(monster37)
    render(conn, "edit.html", monster37: monster37, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster37" => monster37_params}) do
    monster37 = Repo.get!(Monster37, id)
    changeset = Monster37.changeset(monster37, monster37_params)

    case Repo.update(changeset) do
      {:ok, monster37} ->
        conn
        |> put_flash(:info, "Monster37 updated successfully.")
        |> redirect(to: monster37_path(conn, :show, monster37))
      {:error, changeset} ->
        render(conn, "edit.html", monster37: monster37, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster37 = Repo.get!(Monster37, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster37)

    conn
    |> put_flash(:info, "Monster37 deleted successfully.")
    |> redirect(to: monster37_path(conn, :index))
  end
end
