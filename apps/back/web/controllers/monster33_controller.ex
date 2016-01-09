defmodule Back.Monster33Controller do
  use Back.Web, :controller

  alias Back.Monster33

  plug :scrub_params, "monster33" when action in [:create, :update]

  def index(conn, _params) do
    monsters33 = Repo.all(Monster33)
    render(conn, "index.html", monsters33: monsters33)
  end

  def new(conn, _params) do
    changeset = Monster33.changeset(%Monster33{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster33" => monster33_params}) do
    changeset = Monster33.changeset(%Monster33{}, monster33_params)

    case Repo.insert(changeset) do
      {:ok, _monster33} ->
        conn
        |> put_flash(:info, "Monster33 created successfully.")
        |> redirect(to: monster33_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster33 = Repo.get!(Monster33, id)
    render(conn, "show.html", monster33: monster33)
  end

  def edit(conn, %{"id" => id}) do
    monster33 = Repo.get!(Monster33, id)
    changeset = Monster33.changeset(monster33)
    render(conn, "edit.html", monster33: monster33, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster33" => monster33_params}) do
    monster33 = Repo.get!(Monster33, id)
    changeset = Monster33.changeset(monster33, monster33_params)

    case Repo.update(changeset) do
      {:ok, monster33} ->
        conn
        |> put_flash(:info, "Monster33 updated successfully.")
        |> redirect(to: monster33_path(conn, :show, monster33))
      {:error, changeset} ->
        render(conn, "edit.html", monster33: monster33, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster33 = Repo.get!(Monster33, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster33)

    conn
    |> put_flash(:info, "Monster33 deleted successfully.")
    |> redirect(to: monster33_path(conn, :index))
  end
end
