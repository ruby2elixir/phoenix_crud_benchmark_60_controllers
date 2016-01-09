defmodule Back.Monster14Controller do
  use Back.Web, :controller

  alias Back.Monster14

  plug :scrub_params, "monster14" when action in [:create, :update]

  def index(conn, _params) do
    monsters14 = Repo.all(Monster14)
    render(conn, "index.html", monsters14: monsters14)
  end

  def new(conn, _params) do
    changeset = Monster14.changeset(%Monster14{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster14" => monster14_params}) do
    changeset = Monster14.changeset(%Monster14{}, monster14_params)

    case Repo.insert(changeset) do
      {:ok, _monster14} ->
        conn
        |> put_flash(:info, "Monster14 created successfully.")
        |> redirect(to: monster14_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster14 = Repo.get!(Monster14, id)
    render(conn, "show.html", monster14: monster14)
  end

  def edit(conn, %{"id" => id}) do
    monster14 = Repo.get!(Monster14, id)
    changeset = Monster14.changeset(monster14)
    render(conn, "edit.html", monster14: monster14, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster14" => monster14_params}) do
    monster14 = Repo.get!(Monster14, id)
    changeset = Monster14.changeset(monster14, monster14_params)

    case Repo.update(changeset) do
      {:ok, monster14} ->
        conn
        |> put_flash(:info, "Monster14 updated successfully.")
        |> redirect(to: monster14_path(conn, :show, monster14))
      {:error, changeset} ->
        render(conn, "edit.html", monster14: monster14, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster14 = Repo.get!(Monster14, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster14)

    conn
    |> put_flash(:info, "Monster14 deleted successfully.")
    |> redirect(to: monster14_path(conn, :index))
  end
end
