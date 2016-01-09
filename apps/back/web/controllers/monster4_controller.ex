defmodule Back.Monster4Controller do
  use Back.Web, :controller

  alias Back.Monster4

  plug :scrub_params, "monster4" when action in [:create, :update]

  def index(conn, _params) do
    monsters4 = Repo.all(Monster4)
    render(conn, "index.html", monsters4: monsters4)
  end

  def new(conn, _params) do
    changeset = Monster4.changeset(%Monster4{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster4" => monster4_params}) do
    changeset = Monster4.changeset(%Monster4{}, monster4_params)

    case Repo.insert(changeset) do
      {:ok, _monster4} ->
        conn
        |> put_flash(:info, "Monster4 created successfully.")
        |> redirect(to: monster4_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster4 = Repo.get!(Monster4, id)
    render(conn, "show.html", monster4: monster4)
  end

  def edit(conn, %{"id" => id}) do
    monster4 = Repo.get!(Monster4, id)
    changeset = Monster4.changeset(monster4)
    render(conn, "edit.html", monster4: monster4, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster4" => monster4_params}) do
    monster4 = Repo.get!(Monster4, id)
    changeset = Monster4.changeset(monster4, monster4_params)

    case Repo.update(changeset) do
      {:ok, monster4} ->
        conn
        |> put_flash(:info, "Monster4 updated successfully.")
        |> redirect(to: monster4_path(conn, :show, monster4))
      {:error, changeset} ->
        render(conn, "edit.html", monster4: monster4, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster4 = Repo.get!(Monster4, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster4)

    conn
    |> put_flash(:info, "Monster4 deleted successfully.")
    |> redirect(to: monster4_path(conn, :index))
  end
end
