defmodule Back.Monster43Controller do
  use Back.Web, :controller

  alias Back.Monster43

  plug :scrub_params, "monster43" when action in [:create, :update]

  def index(conn, _params) do
    monsters43 = Repo.all(Monster43)
    render(conn, "index.html", monsters43: monsters43)
  end

  def new(conn, _params) do
    changeset = Monster43.changeset(%Monster43{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster43" => monster43_params}) do
    changeset = Monster43.changeset(%Monster43{}, monster43_params)

    case Repo.insert(changeset) do
      {:ok, _monster43} ->
        conn
        |> put_flash(:info, "Monster43 created successfully.")
        |> redirect(to: monster43_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster43 = Repo.get!(Monster43, id)
    render(conn, "show.html", monster43: monster43)
  end

  def edit(conn, %{"id" => id}) do
    monster43 = Repo.get!(Monster43, id)
    changeset = Monster43.changeset(monster43)
    render(conn, "edit.html", monster43: monster43, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster43" => monster43_params}) do
    monster43 = Repo.get!(Monster43, id)
    changeset = Monster43.changeset(monster43, monster43_params)

    case Repo.update(changeset) do
      {:ok, monster43} ->
        conn
        |> put_flash(:info, "Monster43 updated successfully.")
        |> redirect(to: monster43_path(conn, :show, monster43))
      {:error, changeset} ->
        render(conn, "edit.html", monster43: monster43, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster43 = Repo.get!(Monster43, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster43)

    conn
    |> put_flash(:info, "Monster43 deleted successfully.")
    |> redirect(to: monster43_path(conn, :index))
  end
end
