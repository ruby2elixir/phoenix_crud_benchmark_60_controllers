defmodule Back.Monster56Controller do
  use Back.Web, :controller

  alias Back.Monster56

  plug :scrub_params, "monster56" when action in [:create, :update]

  def index(conn, _params) do
    monsters56 = Repo.all(Monster56)
    render(conn, "index.html", monsters56: monsters56)
  end

  def new(conn, _params) do
    changeset = Monster56.changeset(%Monster56{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster56" => monster56_params}) do
    changeset = Monster56.changeset(%Monster56{}, monster56_params)

    case Repo.insert(changeset) do
      {:ok, _monster56} ->
        conn
        |> put_flash(:info, "Monster56 created successfully.")
        |> redirect(to: monster56_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster56 = Repo.get!(Monster56, id)
    render(conn, "show.html", monster56: monster56)
  end

  def edit(conn, %{"id" => id}) do
    monster56 = Repo.get!(Monster56, id)
    changeset = Monster56.changeset(monster56)
    render(conn, "edit.html", monster56: monster56, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster56" => monster56_params}) do
    monster56 = Repo.get!(Monster56, id)
    changeset = Monster56.changeset(monster56, monster56_params)

    case Repo.update(changeset) do
      {:ok, monster56} ->
        conn
        |> put_flash(:info, "Monster56 updated successfully.")
        |> redirect(to: monster56_path(conn, :show, monster56))
      {:error, changeset} ->
        render(conn, "edit.html", monster56: monster56, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster56 = Repo.get!(Monster56, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster56)

    conn
    |> put_flash(:info, "Monster56 deleted successfully.")
    |> redirect(to: monster56_path(conn, :index))
  end
end
