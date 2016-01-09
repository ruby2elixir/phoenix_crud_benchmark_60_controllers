defmodule Back.Monster48Controller do
  use Back.Web, :controller

  alias Back.Monster48

  plug :scrub_params, "monster48" when action in [:create, :update]

  def index(conn, _params) do
    monsters48 = Repo.all(Monster48)
    render(conn, "index.html", monsters48: monsters48)
  end

  def new(conn, _params) do
    changeset = Monster48.changeset(%Monster48{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster48" => monster48_params}) do
    changeset = Monster48.changeset(%Monster48{}, monster48_params)

    case Repo.insert(changeset) do
      {:ok, _monster48} ->
        conn
        |> put_flash(:info, "Monster48 created successfully.")
        |> redirect(to: monster48_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster48 = Repo.get!(Monster48, id)
    render(conn, "show.html", monster48: monster48)
  end

  def edit(conn, %{"id" => id}) do
    monster48 = Repo.get!(Monster48, id)
    changeset = Monster48.changeset(monster48)
    render(conn, "edit.html", monster48: monster48, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster48" => monster48_params}) do
    monster48 = Repo.get!(Monster48, id)
    changeset = Monster48.changeset(monster48, monster48_params)

    case Repo.update(changeset) do
      {:ok, monster48} ->
        conn
        |> put_flash(:info, "Monster48 updated successfully.")
        |> redirect(to: monster48_path(conn, :show, monster48))
      {:error, changeset} ->
        render(conn, "edit.html", monster48: monster48, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster48 = Repo.get!(Monster48, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster48)

    conn
    |> put_flash(:info, "Monster48 deleted successfully.")
    |> redirect(to: monster48_path(conn, :index))
  end
end
