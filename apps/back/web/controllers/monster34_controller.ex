defmodule Back.Monster34Controller do
  use Back.Web, :controller

  alias Back.Monster34

  plug :scrub_params, "monster34" when action in [:create, :update]

  def index(conn, _params) do
    monsters34 = Repo.all(Monster34)
    render(conn, "index.html", monsters34: monsters34)
  end

  def new(conn, _params) do
    changeset = Monster34.changeset(%Monster34{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster34" => monster34_params}) do
    changeset = Monster34.changeset(%Monster34{}, monster34_params)

    case Repo.insert(changeset) do
      {:ok, _monster34} ->
        conn
        |> put_flash(:info, "Monster34 created successfully.")
        |> redirect(to: monster34_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster34 = Repo.get!(Monster34, id)
    render(conn, "show.html", monster34: monster34)
  end

  def edit(conn, %{"id" => id}) do
    monster34 = Repo.get!(Monster34, id)
    changeset = Monster34.changeset(monster34)
    render(conn, "edit.html", monster34: monster34, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster34" => monster34_params}) do
    monster34 = Repo.get!(Monster34, id)
    changeset = Monster34.changeset(monster34, monster34_params)

    case Repo.update(changeset) do
      {:ok, monster34} ->
        conn
        |> put_flash(:info, "Monster34 updated successfully.")
        |> redirect(to: monster34_path(conn, :show, monster34))
      {:error, changeset} ->
        render(conn, "edit.html", monster34: monster34, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster34 = Repo.get!(Monster34, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster34)

    conn
    |> put_flash(:info, "Monster34 deleted successfully.")
    |> redirect(to: monster34_path(conn, :index))
  end
end
