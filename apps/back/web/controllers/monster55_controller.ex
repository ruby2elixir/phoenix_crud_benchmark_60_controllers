defmodule Back.Monster55Controller do
  use Back.Web, :controller

  alias Back.Monster55

  plug :scrub_params, "monster55" when action in [:create, :update]

  def index(conn, _params) do
    monsters55 = Repo.all(Monster55)
    render(conn, "index.html", monsters55: monsters55)
  end

  def new(conn, _params) do
    changeset = Monster55.changeset(%Monster55{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster55" => monster55_params}) do
    changeset = Monster55.changeset(%Monster55{}, monster55_params)

    case Repo.insert(changeset) do
      {:ok, _monster55} ->
        conn
        |> put_flash(:info, "Monster55 created successfully.")
        |> redirect(to: monster55_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster55 = Repo.get!(Monster55, id)
    render(conn, "show.html", monster55: monster55)
  end

  def edit(conn, %{"id" => id}) do
    monster55 = Repo.get!(Monster55, id)
    changeset = Monster55.changeset(monster55)
    render(conn, "edit.html", monster55: monster55, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster55" => monster55_params}) do
    monster55 = Repo.get!(Monster55, id)
    changeset = Monster55.changeset(monster55, monster55_params)

    case Repo.update(changeset) do
      {:ok, monster55} ->
        conn
        |> put_flash(:info, "Monster55 updated successfully.")
        |> redirect(to: monster55_path(conn, :show, monster55))
      {:error, changeset} ->
        render(conn, "edit.html", monster55: monster55, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster55 = Repo.get!(Monster55, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster55)

    conn
    |> put_flash(:info, "Monster55 deleted successfully.")
    |> redirect(to: monster55_path(conn, :index))
  end
end
