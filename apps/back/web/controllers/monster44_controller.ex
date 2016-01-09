defmodule Back.Monster44Controller do
  use Back.Web, :controller

  alias Back.Monster44

  plug :scrub_params, "monster44" when action in [:create, :update]

  def index(conn, _params) do
    monsters44 = Repo.all(Monster44)
    render(conn, "index.html", monsters44: monsters44)
  end

  def new(conn, _params) do
    changeset = Monster44.changeset(%Monster44{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster44" => monster44_params}) do
    changeset = Monster44.changeset(%Monster44{}, monster44_params)

    case Repo.insert(changeset) do
      {:ok, _monster44} ->
        conn
        |> put_flash(:info, "Monster44 created successfully.")
        |> redirect(to: monster44_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster44 = Repo.get!(Monster44, id)
    render(conn, "show.html", monster44: monster44)
  end

  def edit(conn, %{"id" => id}) do
    monster44 = Repo.get!(Monster44, id)
    changeset = Monster44.changeset(monster44)
    render(conn, "edit.html", monster44: monster44, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster44" => monster44_params}) do
    monster44 = Repo.get!(Monster44, id)
    changeset = Monster44.changeset(monster44, monster44_params)

    case Repo.update(changeset) do
      {:ok, monster44} ->
        conn
        |> put_flash(:info, "Monster44 updated successfully.")
        |> redirect(to: monster44_path(conn, :show, monster44))
      {:error, changeset} ->
        render(conn, "edit.html", monster44: monster44, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster44 = Repo.get!(Monster44, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster44)

    conn
    |> put_flash(:info, "Monster44 deleted successfully.")
    |> redirect(to: monster44_path(conn, :index))
  end
end
