defmodule Back.Monster53Controller do
  use Back.Web, :controller

  alias Back.Monster53

  plug :scrub_params, "monster53" when action in [:create, :update]

  def index(conn, _params) do
    monsters53 = Repo.all(Monster53)
    render(conn, "index.html", monsters53: monsters53)
  end

  def new(conn, _params) do
    changeset = Monster53.changeset(%Monster53{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster53" => monster53_params}) do
    changeset = Monster53.changeset(%Monster53{}, monster53_params)

    case Repo.insert(changeset) do
      {:ok, _monster53} ->
        conn
        |> put_flash(:info, "Monster53 created successfully.")
        |> redirect(to: monster53_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster53 = Repo.get!(Monster53, id)
    render(conn, "show.html", monster53: monster53)
  end

  def edit(conn, %{"id" => id}) do
    monster53 = Repo.get!(Monster53, id)
    changeset = Monster53.changeset(monster53)
    render(conn, "edit.html", monster53: monster53, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster53" => monster53_params}) do
    monster53 = Repo.get!(Monster53, id)
    changeset = Monster53.changeset(monster53, monster53_params)

    case Repo.update(changeset) do
      {:ok, monster53} ->
        conn
        |> put_flash(:info, "Monster53 updated successfully.")
        |> redirect(to: monster53_path(conn, :show, monster53))
      {:error, changeset} ->
        render(conn, "edit.html", monster53: monster53, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster53 = Repo.get!(Monster53, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster53)

    conn
    |> put_flash(:info, "Monster53 deleted successfully.")
    |> redirect(to: monster53_path(conn, :index))
  end
end
