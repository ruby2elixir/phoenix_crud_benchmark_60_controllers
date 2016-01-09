defmodule Back.Monster2Controller do
  use Back.Web, :controller

  alias Back.Monster2

  plug :scrub_params, "monster2" when action in [:create, :update]

  def index(conn, _params) do
    monsters2 = Repo.all(Monster2)
    render(conn, "index.html", monsters2: monsters2)
  end

  def new(conn, _params) do
    changeset = Monster2.changeset(%Monster2{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster2" => monster2_params}) do
    changeset = Monster2.changeset(%Monster2{}, monster2_params)

    case Repo.insert(changeset) do
      {:ok, _monster2} ->
        conn
        |> put_flash(:info, "Monster2 created successfully.")
        |> redirect(to: monster2_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster2 = Repo.get!(Monster2, id)
    render(conn, "show.html", monster2: monster2)
  end

  def edit(conn, %{"id" => id}) do
    monster2 = Repo.get!(Monster2, id)
    changeset = Monster2.changeset(monster2)
    render(conn, "edit.html", monster2: monster2, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster2" => monster2_params}) do
    monster2 = Repo.get!(Monster2, id)
    changeset = Monster2.changeset(monster2, monster2_params)

    case Repo.update(changeset) do
      {:ok, monster2} ->
        conn
        |> put_flash(:info, "Monster2 updated successfully.")
        |> redirect(to: monster2_path(conn, :show, monster2))
      {:error, changeset} ->
        render(conn, "edit.html", monster2: monster2, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster2 = Repo.get!(Monster2, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster2)

    conn
    |> put_flash(:info, "Monster2 deleted successfully.")
    |> redirect(to: monster2_path(conn, :index))
  end
end
