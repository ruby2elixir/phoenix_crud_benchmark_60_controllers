defmodule Back.Monster38Controller do
  use Back.Web, :controller

  alias Back.Monster38

  plug :scrub_params, "monster38" when action in [:create, :update]

  def index(conn, _params) do
    monsters38 = Repo.all(Monster38)
    render(conn, "index.html", monsters38: monsters38)
  end

  def new(conn, _params) do
    changeset = Monster38.changeset(%Monster38{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster38" => monster38_params}) do
    changeset = Monster38.changeset(%Monster38{}, monster38_params)

    case Repo.insert(changeset) do
      {:ok, _monster38} ->
        conn
        |> put_flash(:info, "Monster38 created successfully.")
        |> redirect(to: monster38_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster38 = Repo.get!(Monster38, id)
    render(conn, "show.html", monster38: monster38)
  end

  def edit(conn, %{"id" => id}) do
    monster38 = Repo.get!(Monster38, id)
    changeset = Monster38.changeset(monster38)
    render(conn, "edit.html", monster38: monster38, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster38" => monster38_params}) do
    monster38 = Repo.get!(Monster38, id)
    changeset = Monster38.changeset(monster38, monster38_params)

    case Repo.update(changeset) do
      {:ok, monster38} ->
        conn
        |> put_flash(:info, "Monster38 updated successfully.")
        |> redirect(to: monster38_path(conn, :show, monster38))
      {:error, changeset} ->
        render(conn, "edit.html", monster38: monster38, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster38 = Repo.get!(Monster38, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster38)

    conn
    |> put_flash(:info, "Monster38 deleted successfully.")
    |> redirect(to: monster38_path(conn, :index))
  end
end
