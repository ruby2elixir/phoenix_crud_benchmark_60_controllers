defmodule Back.Monster42Controller do
  use Back.Web, :controller

  alias Back.Monster42

  plug :scrub_params, "monster42" when action in [:create, :update]

  def index(conn, _params) do
    monsters42 = Repo.all(Monster42)
    render(conn, "index.html", monsters42: monsters42)
  end

  def new(conn, _params) do
    changeset = Monster42.changeset(%Monster42{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster42" => monster42_params}) do
    changeset = Monster42.changeset(%Monster42{}, monster42_params)

    case Repo.insert(changeset) do
      {:ok, _monster42} ->
        conn
        |> put_flash(:info, "Monster42 created successfully.")
        |> redirect(to: monster42_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster42 = Repo.get!(Monster42, id)
    render(conn, "show.html", monster42: monster42)
  end

  def edit(conn, %{"id" => id}) do
    monster42 = Repo.get!(Monster42, id)
    changeset = Monster42.changeset(monster42)
    render(conn, "edit.html", monster42: monster42, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster42" => monster42_params}) do
    monster42 = Repo.get!(Monster42, id)
    changeset = Monster42.changeset(monster42, monster42_params)

    case Repo.update(changeset) do
      {:ok, monster42} ->
        conn
        |> put_flash(:info, "Monster42 updated successfully.")
        |> redirect(to: monster42_path(conn, :show, monster42))
      {:error, changeset} ->
        render(conn, "edit.html", monster42: monster42, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster42 = Repo.get!(Monster42, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster42)

    conn
    |> put_flash(:info, "Monster42 deleted successfully.")
    |> redirect(to: monster42_path(conn, :index))
  end
end
