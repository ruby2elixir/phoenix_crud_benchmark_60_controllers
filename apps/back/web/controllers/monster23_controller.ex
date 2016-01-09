defmodule Back.Monster23Controller do
  use Back.Web, :controller

  alias Back.Monster23

  plug :scrub_params, "monster23" when action in [:create, :update]

  def index(conn, _params) do
    monsters23 = Repo.all(Monster23)
    render(conn, "index.html", monsters23: monsters23)
  end

  def new(conn, _params) do
    changeset = Monster23.changeset(%Monster23{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster23" => monster23_params}) do
    changeset = Monster23.changeset(%Monster23{}, monster23_params)

    case Repo.insert(changeset) do
      {:ok, _monster23} ->
        conn
        |> put_flash(:info, "Monster23 created successfully.")
        |> redirect(to: monster23_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster23 = Repo.get!(Monster23, id)
    render(conn, "show.html", monster23: monster23)
  end

  def edit(conn, %{"id" => id}) do
    monster23 = Repo.get!(Monster23, id)
    changeset = Monster23.changeset(monster23)
    render(conn, "edit.html", monster23: monster23, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster23" => monster23_params}) do
    monster23 = Repo.get!(Monster23, id)
    changeset = Monster23.changeset(monster23, monster23_params)

    case Repo.update(changeset) do
      {:ok, monster23} ->
        conn
        |> put_flash(:info, "Monster23 updated successfully.")
        |> redirect(to: monster23_path(conn, :show, monster23))
      {:error, changeset} ->
        render(conn, "edit.html", monster23: monster23, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster23 = Repo.get!(Monster23, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster23)

    conn
    |> put_flash(:info, "Monster23 deleted successfully.")
    |> redirect(to: monster23_path(conn, :index))
  end
end
