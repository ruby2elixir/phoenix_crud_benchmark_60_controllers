defmodule Back.Monster7Controller do
  use Back.Web, :controller

  alias Back.Monster7

  plug :scrub_params, "monster7" when action in [:create, :update]

  def index(conn, _params) do
    monsters7 = Repo.all(Monster7)
    render(conn, "index.html", monsters7: monsters7)
  end

  def new(conn, _params) do
    changeset = Monster7.changeset(%Monster7{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster7" => monster7_params}) do
    changeset = Monster7.changeset(%Monster7{}, monster7_params)

    case Repo.insert(changeset) do
      {:ok, _monster7} ->
        conn
        |> put_flash(:info, "Monster7 created successfully.")
        |> redirect(to: monster7_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster7 = Repo.get!(Monster7, id)
    render(conn, "show.html", monster7: monster7)
  end

  def edit(conn, %{"id" => id}) do
    monster7 = Repo.get!(Monster7, id)
    changeset = Monster7.changeset(monster7)
    render(conn, "edit.html", monster7: monster7, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster7" => monster7_params}) do
    monster7 = Repo.get!(Monster7, id)
    changeset = Monster7.changeset(monster7, monster7_params)

    case Repo.update(changeset) do
      {:ok, monster7} ->
        conn
        |> put_flash(:info, "Monster7 updated successfully.")
        |> redirect(to: monster7_path(conn, :show, monster7))
      {:error, changeset} ->
        render(conn, "edit.html", monster7: monster7, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster7 = Repo.get!(Monster7, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster7)

    conn
    |> put_flash(:info, "Monster7 deleted successfully.")
    |> redirect(to: monster7_path(conn, :index))
  end
end
