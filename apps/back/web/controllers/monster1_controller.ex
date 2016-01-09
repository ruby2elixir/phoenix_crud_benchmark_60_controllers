defmodule Back.Monster1Controller do
  use Back.Web, :controller

  alias Back.Monster1

  plug :scrub_params, "monster1" when action in [:create, :update]

  def index(conn, _params) do
    monsters1 = Repo.all(Monster1)
    render(conn, "index.html", monsters1: monsters1)
  end

  def new(conn, _params) do
    changeset = Monster1.changeset(%Monster1{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster1" => monster1_params}) do
    changeset = Monster1.changeset(%Monster1{}, monster1_params)

    case Repo.insert(changeset) do
      {:ok, _monster1} ->
        conn
        |> put_flash(:info, "Monster1 created successfully.")
        |> redirect(to: monster1_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster1 = Repo.get!(Monster1, id)
    render(conn, "show.html", monster1: monster1)
  end

  def edit(conn, %{"id" => id}) do
    monster1 = Repo.get!(Monster1, id)
    changeset = Monster1.changeset(monster1)
    render(conn, "edit.html", monster1: monster1, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster1" => monster1_params}) do
    monster1 = Repo.get!(Monster1, id)
    changeset = Monster1.changeset(monster1, monster1_params)

    case Repo.update(changeset) do
      {:ok, monster1} ->
        conn
        |> put_flash(:info, "Monster1 updated successfully.")
        |> redirect(to: monster1_path(conn, :show, monster1))
      {:error, changeset} ->
        render(conn, "edit.html", monster1: monster1, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster1 = Repo.get!(Monster1, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster1)

    conn
    |> put_flash(:info, "Monster1 deleted successfully.")
    |> redirect(to: monster1_path(conn, :index))
  end
end
