defmodule Back.Monster58Controller do
  use Back.Web, :controller

  alias Back.Monster58

  plug :scrub_params, "monster58" when action in [:create, :update]

  def index(conn, _params) do
    monsters58 = Repo.all(Monster58)
    render(conn, "index.html", monsters58: monsters58)
  end

  def new(conn, _params) do
    changeset = Monster58.changeset(%Monster58{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster58" => monster58_params}) do
    changeset = Monster58.changeset(%Monster58{}, monster58_params)

    case Repo.insert(changeset) do
      {:ok, _monster58} ->
        conn
        |> put_flash(:info, "Monster58 created successfully.")
        |> redirect(to: monster58_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster58 = Repo.get!(Monster58, id)
    render(conn, "show.html", monster58: monster58)
  end

  def edit(conn, %{"id" => id}) do
    monster58 = Repo.get!(Monster58, id)
    changeset = Monster58.changeset(monster58)
    render(conn, "edit.html", monster58: monster58, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster58" => monster58_params}) do
    monster58 = Repo.get!(Monster58, id)
    changeset = Monster58.changeset(monster58, monster58_params)

    case Repo.update(changeset) do
      {:ok, monster58} ->
        conn
        |> put_flash(:info, "Monster58 updated successfully.")
        |> redirect(to: monster58_path(conn, :show, monster58))
      {:error, changeset} ->
        render(conn, "edit.html", monster58: monster58, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster58 = Repo.get!(Monster58, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster58)

    conn
    |> put_flash(:info, "Monster58 deleted successfully.")
    |> redirect(to: monster58_path(conn, :index))
  end
end
