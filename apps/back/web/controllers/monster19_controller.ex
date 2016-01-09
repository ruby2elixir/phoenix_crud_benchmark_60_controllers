defmodule Back.Monster19Controller do
  use Back.Web, :controller

  alias Back.Monster19

  plug :scrub_params, "monster19" when action in [:create, :update]

  def index(conn, _params) do
    monsters19 = Repo.all(Monster19)
    render(conn, "index.html", monsters19: monsters19)
  end

  def new(conn, _params) do
    changeset = Monster19.changeset(%Monster19{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster19" => monster19_params}) do
    changeset = Monster19.changeset(%Monster19{}, monster19_params)

    case Repo.insert(changeset) do
      {:ok, _monster19} ->
        conn
        |> put_flash(:info, "Monster19 created successfully.")
        |> redirect(to: monster19_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster19 = Repo.get!(Monster19, id)
    render(conn, "show.html", monster19: monster19)
  end

  def edit(conn, %{"id" => id}) do
    monster19 = Repo.get!(Monster19, id)
    changeset = Monster19.changeset(monster19)
    render(conn, "edit.html", monster19: monster19, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster19" => monster19_params}) do
    monster19 = Repo.get!(Monster19, id)
    changeset = Monster19.changeset(monster19, monster19_params)

    case Repo.update(changeset) do
      {:ok, monster19} ->
        conn
        |> put_flash(:info, "Monster19 updated successfully.")
        |> redirect(to: monster19_path(conn, :show, monster19))
      {:error, changeset} ->
        render(conn, "edit.html", monster19: monster19, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster19 = Repo.get!(Monster19, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster19)

    conn
    |> put_flash(:info, "Monster19 deleted successfully.")
    |> redirect(to: monster19_path(conn, :index))
  end
end
