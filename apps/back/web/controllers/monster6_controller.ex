defmodule Back.Monster6Controller do
  use Back.Web, :controller

  alias Back.Monster6

  plug :scrub_params, "monster6" when action in [:create, :update]

  def index(conn, _params) do
    monsters6 = Repo.all(Monster6)
    render(conn, "index.html", monsters6: monsters6)
  end

  def new(conn, _params) do
    changeset = Monster6.changeset(%Monster6{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster6" => monster6_params}) do
    changeset = Monster6.changeset(%Monster6{}, monster6_params)

    case Repo.insert(changeset) do
      {:ok, _monster6} ->
        conn
        |> put_flash(:info, "Monster6 created successfully.")
        |> redirect(to: monster6_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster6 = Repo.get!(Monster6, id)
    render(conn, "show.html", monster6: monster6)
  end

  def edit(conn, %{"id" => id}) do
    monster6 = Repo.get!(Monster6, id)
    changeset = Monster6.changeset(monster6)
    render(conn, "edit.html", monster6: monster6, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster6" => monster6_params}) do
    monster6 = Repo.get!(Monster6, id)
    changeset = Monster6.changeset(monster6, monster6_params)

    case Repo.update(changeset) do
      {:ok, monster6} ->
        conn
        |> put_flash(:info, "Monster6 updated successfully.")
        |> redirect(to: monster6_path(conn, :show, monster6))
      {:error, changeset} ->
        render(conn, "edit.html", monster6: monster6, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster6 = Repo.get!(Monster6, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster6)

    conn
    |> put_flash(:info, "Monster6 deleted successfully.")
    |> redirect(to: monster6_path(conn, :index))
  end
end
