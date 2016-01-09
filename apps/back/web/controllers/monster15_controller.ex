defmodule Back.Monster15Controller do
  use Back.Web, :controller

  alias Back.Monster15

  plug :scrub_params, "monster15" when action in [:create, :update]

  def index(conn, _params) do
    monsters15 = Repo.all(Monster15)
    render(conn, "index.html", monsters15: monsters15)
  end

  def new(conn, _params) do
    changeset = Monster15.changeset(%Monster15{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster15" => monster15_params}) do
    changeset = Monster15.changeset(%Monster15{}, monster15_params)

    case Repo.insert(changeset) do
      {:ok, _monster15} ->
        conn
        |> put_flash(:info, "Monster15 created successfully.")
        |> redirect(to: monster15_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster15 = Repo.get!(Monster15, id)
    render(conn, "show.html", monster15: monster15)
  end

  def edit(conn, %{"id" => id}) do
    monster15 = Repo.get!(Monster15, id)
    changeset = Monster15.changeset(monster15)
    render(conn, "edit.html", monster15: monster15, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster15" => monster15_params}) do
    monster15 = Repo.get!(Monster15, id)
    changeset = Monster15.changeset(monster15, monster15_params)

    case Repo.update(changeset) do
      {:ok, monster15} ->
        conn
        |> put_flash(:info, "Monster15 updated successfully.")
        |> redirect(to: monster15_path(conn, :show, monster15))
      {:error, changeset} ->
        render(conn, "edit.html", monster15: monster15, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster15 = Repo.get!(Monster15, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster15)

    conn
    |> put_flash(:info, "Monster15 deleted successfully.")
    |> redirect(to: monster15_path(conn, :index))
  end
end
