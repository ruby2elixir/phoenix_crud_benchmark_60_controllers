defmodule Back.Monster35Controller do
  use Back.Web, :controller

  alias Back.Monster35

  plug :scrub_params, "monster35" when action in [:create, :update]

  def index(conn, _params) do
    monsters35 = Repo.all(Monster35)
    render(conn, "index.html", monsters35: monsters35)
  end

  def new(conn, _params) do
    changeset = Monster35.changeset(%Monster35{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster35" => monster35_params}) do
    changeset = Monster35.changeset(%Monster35{}, monster35_params)

    case Repo.insert(changeset) do
      {:ok, _monster35} ->
        conn
        |> put_flash(:info, "Monster35 created successfully.")
        |> redirect(to: monster35_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster35 = Repo.get!(Monster35, id)
    render(conn, "show.html", monster35: monster35)
  end

  def edit(conn, %{"id" => id}) do
    monster35 = Repo.get!(Monster35, id)
    changeset = Monster35.changeset(monster35)
    render(conn, "edit.html", monster35: monster35, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster35" => monster35_params}) do
    monster35 = Repo.get!(Monster35, id)
    changeset = Monster35.changeset(monster35, monster35_params)

    case Repo.update(changeset) do
      {:ok, monster35} ->
        conn
        |> put_flash(:info, "Monster35 updated successfully.")
        |> redirect(to: monster35_path(conn, :show, monster35))
      {:error, changeset} ->
        render(conn, "edit.html", monster35: monster35, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster35 = Repo.get!(Monster35, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster35)

    conn
    |> put_flash(:info, "Monster35 deleted successfully.")
    |> redirect(to: monster35_path(conn, :index))
  end
end
