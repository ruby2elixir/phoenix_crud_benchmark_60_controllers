defmodule Back.Monster24Controller do
  use Back.Web, :controller

  alias Back.Monster24

  plug :scrub_params, "monster24" when action in [:create, :update]

  def index(conn, _params) do
    monsters24 = Repo.all(Monster24)
    render(conn, "index.html", monsters24: monsters24)
  end

  def new(conn, _params) do
    changeset = Monster24.changeset(%Monster24{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster24" => monster24_params}) do
    changeset = Monster24.changeset(%Monster24{}, monster24_params)

    case Repo.insert(changeset) do
      {:ok, _monster24} ->
        conn
        |> put_flash(:info, "Monster24 created successfully.")
        |> redirect(to: monster24_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster24 = Repo.get!(Monster24, id)
    render(conn, "show.html", monster24: monster24)
  end

  def edit(conn, %{"id" => id}) do
    monster24 = Repo.get!(Monster24, id)
    changeset = Monster24.changeset(monster24)
    render(conn, "edit.html", monster24: monster24, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster24" => monster24_params}) do
    monster24 = Repo.get!(Monster24, id)
    changeset = Monster24.changeset(monster24, monster24_params)

    case Repo.update(changeset) do
      {:ok, monster24} ->
        conn
        |> put_flash(:info, "Monster24 updated successfully.")
        |> redirect(to: monster24_path(conn, :show, monster24))
      {:error, changeset} ->
        render(conn, "edit.html", monster24: monster24, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster24 = Repo.get!(Monster24, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster24)

    conn
    |> put_flash(:info, "Monster24 deleted successfully.")
    |> redirect(to: monster24_path(conn, :index))
  end
end
