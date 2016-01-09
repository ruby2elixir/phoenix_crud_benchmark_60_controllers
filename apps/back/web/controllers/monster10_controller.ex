defmodule Back.Monster10Controller do
  use Back.Web, :controller

  alias Back.Monster10

  plug :scrub_params, "monster10" when action in [:create, :update]

  def index(conn, _params) do
    monsters10 = Repo.all(Monster10)
    render(conn, "index.html", monsters10: monsters10)
  end

  def new(conn, _params) do
    changeset = Monster10.changeset(%Monster10{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster10" => monster10_params}) do
    changeset = Monster10.changeset(%Monster10{}, monster10_params)

    case Repo.insert(changeset) do
      {:ok, _monster10} ->
        conn
        |> put_flash(:info, "Monster10 created successfully.")
        |> redirect(to: monster10_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster10 = Repo.get!(Monster10, id)
    render(conn, "show.html", monster10: monster10)
  end

  def edit(conn, %{"id" => id}) do
    monster10 = Repo.get!(Monster10, id)
    changeset = Monster10.changeset(monster10)
    render(conn, "edit.html", monster10: monster10, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster10" => monster10_params}) do
    monster10 = Repo.get!(Monster10, id)
    changeset = Monster10.changeset(monster10, monster10_params)

    case Repo.update(changeset) do
      {:ok, monster10} ->
        conn
        |> put_flash(:info, "Monster10 updated successfully.")
        |> redirect(to: monster10_path(conn, :show, monster10))
      {:error, changeset} ->
        render(conn, "edit.html", monster10: monster10, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster10 = Repo.get!(Monster10, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster10)

    conn
    |> put_flash(:info, "Monster10 deleted successfully.")
    |> redirect(to: monster10_path(conn, :index))
  end
end
