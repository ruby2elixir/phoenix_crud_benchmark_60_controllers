defmodule Back.Monster40Controller do
  use Back.Web, :controller

  alias Back.Monster40

  plug :scrub_params, "monster40" when action in [:create, :update]

  def index(conn, _params) do
    monsters40 = Repo.all(Monster40)
    render(conn, "index.html", monsters40: monsters40)
  end

  def new(conn, _params) do
    changeset = Monster40.changeset(%Monster40{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster40" => monster40_params}) do
    changeset = Monster40.changeset(%Monster40{}, monster40_params)

    case Repo.insert(changeset) do
      {:ok, _monster40} ->
        conn
        |> put_flash(:info, "Monster40 created successfully.")
        |> redirect(to: monster40_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster40 = Repo.get!(Monster40, id)
    render(conn, "show.html", monster40: monster40)
  end

  def edit(conn, %{"id" => id}) do
    monster40 = Repo.get!(Monster40, id)
    changeset = Monster40.changeset(monster40)
    render(conn, "edit.html", monster40: monster40, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster40" => monster40_params}) do
    monster40 = Repo.get!(Monster40, id)
    changeset = Monster40.changeset(monster40, monster40_params)

    case Repo.update(changeset) do
      {:ok, monster40} ->
        conn
        |> put_flash(:info, "Monster40 updated successfully.")
        |> redirect(to: monster40_path(conn, :show, monster40))
      {:error, changeset} ->
        render(conn, "edit.html", monster40: monster40, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster40 = Repo.get!(Monster40, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster40)

    conn
    |> put_flash(:info, "Monster40 deleted successfully.")
    |> redirect(to: monster40_path(conn, :index))
  end
end
