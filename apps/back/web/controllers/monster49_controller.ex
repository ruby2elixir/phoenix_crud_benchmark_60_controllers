defmodule Back.Monster49Controller do
  use Back.Web, :controller

  alias Back.Monster49

  plug :scrub_params, "monster49" when action in [:create, :update]

  def index(conn, _params) do
    monsters49 = Repo.all(Monster49)
    render(conn, "index.html", monsters49: monsters49)
  end

  def new(conn, _params) do
    changeset = Monster49.changeset(%Monster49{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster49" => monster49_params}) do
    changeset = Monster49.changeset(%Monster49{}, monster49_params)

    case Repo.insert(changeset) do
      {:ok, _monster49} ->
        conn
        |> put_flash(:info, "Monster49 created successfully.")
        |> redirect(to: monster49_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster49 = Repo.get!(Monster49, id)
    render(conn, "show.html", monster49: monster49)
  end

  def edit(conn, %{"id" => id}) do
    monster49 = Repo.get!(Monster49, id)
    changeset = Monster49.changeset(monster49)
    render(conn, "edit.html", monster49: monster49, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster49" => monster49_params}) do
    monster49 = Repo.get!(Monster49, id)
    changeset = Monster49.changeset(monster49, monster49_params)

    case Repo.update(changeset) do
      {:ok, monster49} ->
        conn
        |> put_flash(:info, "Monster49 updated successfully.")
        |> redirect(to: monster49_path(conn, :show, monster49))
      {:error, changeset} ->
        render(conn, "edit.html", monster49: monster49, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster49 = Repo.get!(Monster49, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster49)

    conn
    |> put_flash(:info, "Monster49 deleted successfully.")
    |> redirect(to: monster49_path(conn, :index))
  end
end
