defmodule Back.Monster46Controller do
  use Back.Web, :controller

  alias Back.Monster46

  plug :scrub_params, "monster46" when action in [:create, :update]

  def index(conn, _params) do
    monsters46 = Repo.all(Monster46)
    render(conn, "index.html", monsters46: monsters46)
  end

  def new(conn, _params) do
    changeset = Monster46.changeset(%Monster46{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster46" => monster46_params}) do
    changeset = Monster46.changeset(%Monster46{}, monster46_params)

    case Repo.insert(changeset) do
      {:ok, _monster46} ->
        conn
        |> put_flash(:info, "Monster46 created successfully.")
        |> redirect(to: monster46_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster46 = Repo.get!(Monster46, id)
    render(conn, "show.html", monster46: monster46)
  end

  def edit(conn, %{"id" => id}) do
    monster46 = Repo.get!(Monster46, id)
    changeset = Monster46.changeset(monster46)
    render(conn, "edit.html", monster46: monster46, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster46" => monster46_params}) do
    monster46 = Repo.get!(Monster46, id)
    changeset = Monster46.changeset(monster46, monster46_params)

    case Repo.update(changeset) do
      {:ok, monster46} ->
        conn
        |> put_flash(:info, "Monster46 updated successfully.")
        |> redirect(to: monster46_path(conn, :show, monster46))
      {:error, changeset} ->
        render(conn, "edit.html", monster46: monster46, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster46 = Repo.get!(Monster46, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster46)

    conn
    |> put_flash(:info, "Monster46 deleted successfully.")
    |> redirect(to: monster46_path(conn, :index))
  end
end
