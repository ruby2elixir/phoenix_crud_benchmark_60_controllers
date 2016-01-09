defmodule Back.Monster21Controller do
  use Back.Web, :controller

  alias Back.Monster21

  plug :scrub_params, "monster21" when action in [:create, :update]

  def index(conn, _params) do
    monsters21 = Repo.all(Monster21)
    render(conn, "index.html", monsters21: monsters21)
  end

  def new(conn, _params) do
    changeset = Monster21.changeset(%Monster21{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster21" => monster21_params}) do
    changeset = Monster21.changeset(%Monster21{}, monster21_params)

    case Repo.insert(changeset) do
      {:ok, _monster21} ->
        conn
        |> put_flash(:info, "Monster21 created successfully.")
        |> redirect(to: monster21_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster21 = Repo.get!(Monster21, id)
    render(conn, "show.html", monster21: monster21)
  end

  def edit(conn, %{"id" => id}) do
    monster21 = Repo.get!(Monster21, id)
    changeset = Monster21.changeset(monster21)
    render(conn, "edit.html", monster21: monster21, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster21" => monster21_params}) do
    monster21 = Repo.get!(Monster21, id)
    changeset = Monster21.changeset(monster21, monster21_params)

    case Repo.update(changeset) do
      {:ok, monster21} ->
        conn
        |> put_flash(:info, "Monster21 updated successfully.")
        |> redirect(to: monster21_path(conn, :show, monster21))
      {:error, changeset} ->
        render(conn, "edit.html", monster21: monster21, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster21 = Repo.get!(Monster21, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster21)

    conn
    |> put_flash(:info, "Monster21 deleted successfully.")
    |> redirect(to: monster21_path(conn, :index))
  end
end
