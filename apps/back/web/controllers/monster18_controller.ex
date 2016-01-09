defmodule Back.Monster18Controller do
  use Back.Web, :controller

  alias Back.Monster18

  plug :scrub_params, "monster18" when action in [:create, :update]

  def index(conn, _params) do
    monsters18 = Repo.all(Monster18)
    render(conn, "index.html", monsters18: monsters18)
  end

  def new(conn, _params) do
    changeset = Monster18.changeset(%Monster18{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster18" => monster18_params}) do
    changeset = Monster18.changeset(%Monster18{}, monster18_params)

    case Repo.insert(changeset) do
      {:ok, _monster18} ->
        conn
        |> put_flash(:info, "Monster18 created successfully.")
        |> redirect(to: monster18_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster18 = Repo.get!(Monster18, id)
    render(conn, "show.html", monster18: monster18)
  end

  def edit(conn, %{"id" => id}) do
    monster18 = Repo.get!(Monster18, id)
    changeset = Monster18.changeset(monster18)
    render(conn, "edit.html", monster18: monster18, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster18" => monster18_params}) do
    monster18 = Repo.get!(Monster18, id)
    changeset = Monster18.changeset(monster18, monster18_params)

    case Repo.update(changeset) do
      {:ok, monster18} ->
        conn
        |> put_flash(:info, "Monster18 updated successfully.")
        |> redirect(to: monster18_path(conn, :show, monster18))
      {:error, changeset} ->
        render(conn, "edit.html", monster18: monster18, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster18 = Repo.get!(Monster18, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster18)

    conn
    |> put_flash(:info, "Monster18 deleted successfully.")
    |> redirect(to: monster18_path(conn, :index))
  end
end
