defmodule Back.Monster50Controller do
  use Back.Web, :controller

  alias Back.Monster50

  plug :scrub_params, "monster50" when action in [:create, :update]

  def index(conn, _params) do
    monsters50 = Repo.all(Monster50)
    render(conn, "index.html", monsters50: monsters50)
  end

  def new(conn, _params) do
    changeset = Monster50.changeset(%Monster50{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster50" => monster50_params}) do
    changeset = Monster50.changeset(%Monster50{}, monster50_params)

    case Repo.insert(changeset) do
      {:ok, _monster50} ->
        conn
        |> put_flash(:info, "Monster50 created successfully.")
        |> redirect(to: monster50_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster50 = Repo.get!(Monster50, id)
    render(conn, "show.html", monster50: monster50)
  end

  def edit(conn, %{"id" => id}) do
    monster50 = Repo.get!(Monster50, id)
    changeset = Monster50.changeset(monster50)
    render(conn, "edit.html", monster50: monster50, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster50" => monster50_params}) do
    monster50 = Repo.get!(Monster50, id)
    changeset = Monster50.changeset(monster50, monster50_params)

    case Repo.update(changeset) do
      {:ok, monster50} ->
        conn
        |> put_flash(:info, "Monster50 updated successfully.")
        |> redirect(to: monster50_path(conn, :show, monster50))
      {:error, changeset} ->
        render(conn, "edit.html", monster50: monster50, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster50 = Repo.get!(Monster50, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster50)

    conn
    |> put_flash(:info, "Monster50 deleted successfully.")
    |> redirect(to: monster50_path(conn, :index))
  end
end
