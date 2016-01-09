defmodule Back.Monster8Controller do
  use Back.Web, :controller

  alias Back.Monster8

  plug :scrub_params, "monster8" when action in [:create, :update]

  def index(conn, _params) do
    monsters8 = Repo.all(Monster8)
    render(conn, "index.html", monsters8: monsters8)
  end

  def new(conn, _params) do
    changeset = Monster8.changeset(%Monster8{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster8" => monster8_params}) do
    changeset = Monster8.changeset(%Monster8{}, monster8_params)

    case Repo.insert(changeset) do
      {:ok, _monster8} ->
        conn
        |> put_flash(:info, "Monster8 created successfully.")
        |> redirect(to: monster8_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster8 = Repo.get!(Monster8, id)
    render(conn, "show.html", monster8: monster8)
  end

  def edit(conn, %{"id" => id}) do
    monster8 = Repo.get!(Monster8, id)
    changeset = Monster8.changeset(monster8)
    render(conn, "edit.html", monster8: monster8, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster8" => monster8_params}) do
    monster8 = Repo.get!(Monster8, id)
    changeset = Monster8.changeset(monster8, monster8_params)

    case Repo.update(changeset) do
      {:ok, monster8} ->
        conn
        |> put_flash(:info, "Monster8 updated successfully.")
        |> redirect(to: monster8_path(conn, :show, monster8))
      {:error, changeset} ->
        render(conn, "edit.html", monster8: monster8, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster8 = Repo.get!(Monster8, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster8)

    conn
    |> put_flash(:info, "Monster8 deleted successfully.")
    |> redirect(to: monster8_path(conn, :index))
  end
end
