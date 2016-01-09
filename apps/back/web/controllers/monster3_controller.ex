defmodule Back.Monster3Controller do
  use Back.Web, :controller

  alias Back.Monster3

  plug :scrub_params, "monster3" when action in [:create, :update]

  def index(conn, _params) do
    monsters3 = Repo.all(Monster3)
    render(conn, "index.html", monsters3: monsters3)
  end

  def new(conn, _params) do
    changeset = Monster3.changeset(%Monster3{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster3" => monster3_params}) do
    changeset = Monster3.changeset(%Monster3{}, monster3_params)

    case Repo.insert(changeset) do
      {:ok, _monster3} ->
        conn
        |> put_flash(:info, "Monster3 created successfully.")
        |> redirect(to: monster3_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster3 = Repo.get!(Monster3, id)
    render(conn, "show.html", monster3: monster3)
  end

  def edit(conn, %{"id" => id}) do
    monster3 = Repo.get!(Monster3, id)
    changeset = Monster3.changeset(monster3)
    render(conn, "edit.html", monster3: monster3, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster3" => monster3_params}) do
    monster3 = Repo.get!(Monster3, id)
    changeset = Monster3.changeset(monster3, monster3_params)

    case Repo.update(changeset) do
      {:ok, monster3} ->
        conn
        |> put_flash(:info, "Monster3 updated successfully.")
        |> redirect(to: monster3_path(conn, :show, monster3))
      {:error, changeset} ->
        render(conn, "edit.html", monster3: monster3, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster3 = Repo.get!(Monster3, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster3)

    conn
    |> put_flash(:info, "Monster3 deleted successfully.")
    |> redirect(to: monster3_path(conn, :index))
  end
end
