defmodule Back.Monster47Controller do
  use Back.Web, :controller

  alias Back.Monster47

  plug :scrub_params, "monster47" when action in [:create, :update]

  def index(conn, _params) do
    monsters47 = Repo.all(Monster47)
    render(conn, "index.html", monsters47: monsters47)
  end

  def new(conn, _params) do
    changeset = Monster47.changeset(%Monster47{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster47" => monster47_params}) do
    changeset = Monster47.changeset(%Monster47{}, monster47_params)

    case Repo.insert(changeset) do
      {:ok, _monster47} ->
        conn
        |> put_flash(:info, "Monster47 created successfully.")
        |> redirect(to: monster47_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster47 = Repo.get!(Monster47, id)
    render(conn, "show.html", monster47: monster47)
  end

  def edit(conn, %{"id" => id}) do
    monster47 = Repo.get!(Monster47, id)
    changeset = Monster47.changeset(monster47)
    render(conn, "edit.html", monster47: monster47, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster47" => monster47_params}) do
    monster47 = Repo.get!(Monster47, id)
    changeset = Monster47.changeset(monster47, monster47_params)

    case Repo.update(changeset) do
      {:ok, monster47} ->
        conn
        |> put_flash(:info, "Monster47 updated successfully.")
        |> redirect(to: monster47_path(conn, :show, monster47))
      {:error, changeset} ->
        render(conn, "edit.html", monster47: monster47, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster47 = Repo.get!(Monster47, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster47)

    conn
    |> put_flash(:info, "Monster47 deleted successfully.")
    |> redirect(to: monster47_path(conn, :index))
  end
end
