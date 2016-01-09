defmodule Back.Monster30Controller do
  use Back.Web, :controller

  alias Back.Monster30

  plug :scrub_params, "monster30" when action in [:create, :update]

  def index(conn, _params) do
    monsters30 = Repo.all(Monster30)
    render(conn, "index.html", monsters30: monsters30)
  end

  def new(conn, _params) do
    changeset = Monster30.changeset(%Monster30{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster30" => monster30_params}) do
    changeset = Monster30.changeset(%Monster30{}, monster30_params)

    case Repo.insert(changeset) do
      {:ok, _monster30} ->
        conn
        |> put_flash(:info, "Monster30 created successfully.")
        |> redirect(to: monster30_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster30 = Repo.get!(Monster30, id)
    render(conn, "show.html", monster30: monster30)
  end

  def edit(conn, %{"id" => id}) do
    monster30 = Repo.get!(Monster30, id)
    changeset = Monster30.changeset(monster30)
    render(conn, "edit.html", monster30: monster30, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster30" => monster30_params}) do
    monster30 = Repo.get!(Monster30, id)
    changeset = Monster30.changeset(monster30, monster30_params)

    case Repo.update(changeset) do
      {:ok, monster30} ->
        conn
        |> put_flash(:info, "Monster30 updated successfully.")
        |> redirect(to: monster30_path(conn, :show, monster30))
      {:error, changeset} ->
        render(conn, "edit.html", monster30: monster30, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster30 = Repo.get!(Monster30, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster30)

    conn
    |> put_flash(:info, "Monster30 deleted successfully.")
    |> redirect(to: monster30_path(conn, :index))
  end
end
