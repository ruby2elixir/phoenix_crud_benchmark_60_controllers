defmodule Back.Monster12Controller do
  use Back.Web, :controller

  alias Back.Monster12

  plug :scrub_params, "monster12" when action in [:create, :update]

  def index(conn, _params) do
    monsters12 = Repo.all(Monster12)
    render(conn, "index.html", monsters12: monsters12)
  end

  def new(conn, _params) do
    changeset = Monster12.changeset(%Monster12{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster12" => monster12_params}) do
    changeset = Monster12.changeset(%Monster12{}, monster12_params)

    case Repo.insert(changeset) do
      {:ok, _monster12} ->
        conn
        |> put_flash(:info, "Monster12 created successfully.")
        |> redirect(to: monster12_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster12 = Repo.get!(Monster12, id)
    render(conn, "show.html", monster12: monster12)
  end

  def edit(conn, %{"id" => id}) do
    monster12 = Repo.get!(Monster12, id)
    changeset = Monster12.changeset(monster12)
    render(conn, "edit.html", monster12: monster12, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster12" => monster12_params}) do
    monster12 = Repo.get!(Monster12, id)
    changeset = Monster12.changeset(monster12, monster12_params)

    case Repo.update(changeset) do
      {:ok, monster12} ->
        conn
        |> put_flash(:info, "Monster12 updated successfully.")
        |> redirect(to: monster12_path(conn, :show, monster12))
      {:error, changeset} ->
        render(conn, "edit.html", monster12: monster12, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster12 = Repo.get!(Monster12, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster12)

    conn
    |> put_flash(:info, "Monster12 deleted successfully.")
    |> redirect(to: monster12_path(conn, :index))
  end
end
