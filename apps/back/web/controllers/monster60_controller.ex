defmodule Back.Monster60Controller do
  use Back.Web, :controller

  alias Back.Monster60

  plug :scrub_params, "monster60" when action in [:create, :update]

  def index(conn, _params) do
    monsters60 = Repo.all(Monster60)
    render(conn, "index.html", monsters60: monsters60)
  end

  def new(conn, _params) do
    changeset = Monster60.changeset(%Monster60{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster60" => monster60_params}) do
    changeset = Monster60.changeset(%Monster60{}, monster60_params)

    case Repo.insert(changeset) do
      {:ok, _monster60} ->
        conn
        |> put_flash(:info, "Monster60 created successfully.")
        |> redirect(to: monster60_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster60 = Repo.get!(Monster60, id)
    render(conn, "show.html", monster60: monster60)
  end

  def edit(conn, %{"id" => id}) do
    monster60 = Repo.get!(Monster60, id)
    changeset = Monster60.changeset(monster60)
    render(conn, "edit.html", monster60: monster60, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster60" => monster60_params}) do
    monster60 = Repo.get!(Monster60, id)
    changeset = Monster60.changeset(monster60, monster60_params)

    case Repo.update(changeset) do
      {:ok, monster60} ->
        conn
        |> put_flash(:info, "Monster60 updated successfully.")
        |> redirect(to: monster60_path(conn, :show, monster60))
      {:error, changeset} ->
        render(conn, "edit.html", monster60: monster60, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster60 = Repo.get!(Monster60, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster60)

    conn
    |> put_flash(:info, "Monster60 deleted successfully.")
    |> redirect(to: monster60_path(conn, :index))
  end
end
