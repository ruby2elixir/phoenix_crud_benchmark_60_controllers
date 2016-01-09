defmodule Back.Monster52Controller do
  use Back.Web, :controller

  alias Back.Monster52

  plug :scrub_params, "monster52" when action in [:create, :update]

  def index(conn, _params) do
    monsters52 = Repo.all(Monster52)
    render(conn, "index.html", monsters52: monsters52)
  end

  def new(conn, _params) do
    changeset = Monster52.changeset(%Monster52{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster52" => monster52_params}) do
    changeset = Monster52.changeset(%Monster52{}, monster52_params)

    case Repo.insert(changeset) do
      {:ok, _monster52} ->
        conn
        |> put_flash(:info, "Monster52 created successfully.")
        |> redirect(to: monster52_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster52 = Repo.get!(Monster52, id)
    render(conn, "show.html", monster52: monster52)
  end

  def edit(conn, %{"id" => id}) do
    monster52 = Repo.get!(Monster52, id)
    changeset = Monster52.changeset(monster52)
    render(conn, "edit.html", monster52: monster52, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster52" => monster52_params}) do
    monster52 = Repo.get!(Monster52, id)
    changeset = Monster52.changeset(monster52, monster52_params)

    case Repo.update(changeset) do
      {:ok, monster52} ->
        conn
        |> put_flash(:info, "Monster52 updated successfully.")
        |> redirect(to: monster52_path(conn, :show, monster52))
      {:error, changeset} ->
        render(conn, "edit.html", monster52: monster52, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster52 = Repo.get!(Monster52, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster52)

    conn
    |> put_flash(:info, "Monster52 deleted successfully.")
    |> redirect(to: monster52_path(conn, :index))
  end
end
