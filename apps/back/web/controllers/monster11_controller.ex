defmodule Back.Monster11Controller do
  use Back.Web, :controller

  alias Back.Monster11

  plug :scrub_params, "monster11" when action in [:create, :update]

  def index(conn, _params) do
    monsters11 = Repo.all(Monster11)
    render(conn, "index.html", monsters11: monsters11)
  end

  def new(conn, _params) do
    changeset = Monster11.changeset(%Monster11{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster11" => monster11_params}) do
    changeset = Monster11.changeset(%Monster11{}, monster11_params)

    case Repo.insert(changeset) do
      {:ok, _monster11} ->
        conn
        |> put_flash(:info, "Monster11 created successfully.")
        |> redirect(to: monster11_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster11 = Repo.get!(Monster11, id)
    render(conn, "show.html", monster11: monster11)
  end

  def edit(conn, %{"id" => id}) do
    monster11 = Repo.get!(Monster11, id)
    changeset = Monster11.changeset(monster11)
    render(conn, "edit.html", monster11: monster11, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster11" => monster11_params}) do
    monster11 = Repo.get!(Monster11, id)
    changeset = Monster11.changeset(monster11, monster11_params)

    case Repo.update(changeset) do
      {:ok, monster11} ->
        conn
        |> put_flash(:info, "Monster11 updated successfully.")
        |> redirect(to: monster11_path(conn, :show, monster11))
      {:error, changeset} ->
        render(conn, "edit.html", monster11: monster11, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster11 = Repo.get!(Monster11, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster11)

    conn
    |> put_flash(:info, "Monster11 deleted successfully.")
    |> redirect(to: monster11_path(conn, :index))
  end
end
