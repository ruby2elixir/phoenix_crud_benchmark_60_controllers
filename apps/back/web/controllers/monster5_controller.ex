defmodule Back.Monster5Controller do
  use Back.Web, :controller

  alias Back.Monster5

  plug :scrub_params, "monster5" when action in [:create, :update]

  def index(conn, _params) do
    monsters5 = Repo.all(Monster5)
    render(conn, "index.html", monsters5: monsters5)
  end

  def new(conn, _params) do
    changeset = Monster5.changeset(%Monster5{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster5" => monster5_params}) do
    changeset = Monster5.changeset(%Monster5{}, monster5_params)

    case Repo.insert(changeset) do
      {:ok, _monster5} ->
        conn
        |> put_flash(:info, "Monster5 created successfully.")
        |> redirect(to: monster5_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster5 = Repo.get!(Monster5, id)
    render(conn, "show.html", monster5: monster5)
  end

  def edit(conn, %{"id" => id}) do
    monster5 = Repo.get!(Monster5, id)
    changeset = Monster5.changeset(monster5)
    render(conn, "edit.html", monster5: monster5, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster5" => monster5_params}) do
    monster5 = Repo.get!(Monster5, id)
    changeset = Monster5.changeset(monster5, monster5_params)

    case Repo.update(changeset) do
      {:ok, monster5} ->
        conn
        |> put_flash(:info, "Monster5 updated successfully.")
        |> redirect(to: monster5_path(conn, :show, monster5))
      {:error, changeset} ->
        render(conn, "edit.html", monster5: monster5, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster5 = Repo.get!(Monster5, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster5)

    conn
    |> put_flash(:info, "Monster5 deleted successfully.")
    |> redirect(to: monster5_path(conn, :index))
  end
end
