defmodule Back.Monster17Controller do
  use Back.Web, :controller

  alias Back.Monster17

  plug :scrub_params, "monster17" when action in [:create, :update]

  def index(conn, _params) do
    monsters17 = Repo.all(Monster17)
    render(conn, "index.html", monsters17: monsters17)
  end

  def new(conn, _params) do
    changeset = Monster17.changeset(%Monster17{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster17" => monster17_params}) do
    changeset = Monster17.changeset(%Monster17{}, monster17_params)

    case Repo.insert(changeset) do
      {:ok, _monster17} ->
        conn
        |> put_flash(:info, "Monster17 created successfully.")
        |> redirect(to: monster17_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster17 = Repo.get!(Monster17, id)
    render(conn, "show.html", monster17: monster17)
  end

  def edit(conn, %{"id" => id}) do
    monster17 = Repo.get!(Monster17, id)
    changeset = Monster17.changeset(monster17)
    render(conn, "edit.html", monster17: monster17, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster17" => monster17_params}) do
    monster17 = Repo.get!(Monster17, id)
    changeset = Monster17.changeset(monster17, monster17_params)

    case Repo.update(changeset) do
      {:ok, monster17} ->
        conn
        |> put_flash(:info, "Monster17 updated successfully.")
        |> redirect(to: monster17_path(conn, :show, monster17))
      {:error, changeset} ->
        render(conn, "edit.html", monster17: monster17, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster17 = Repo.get!(Monster17, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster17)

    conn
    |> put_flash(:info, "Monster17 deleted successfully.")
    |> redirect(to: monster17_path(conn, :index))
  end
end
