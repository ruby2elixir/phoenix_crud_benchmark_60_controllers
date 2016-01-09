defmodule Back.Monster16Controller do
  use Back.Web, :controller

  alias Back.Monster16

  plug :scrub_params, "monster16" when action in [:create, :update]

  def index(conn, _params) do
    monsters16 = Repo.all(Monster16)
    render(conn, "index.html", monsters16: monsters16)
  end

  def new(conn, _params) do
    changeset = Monster16.changeset(%Monster16{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"monster16" => monster16_params}) do
    changeset = Monster16.changeset(%Monster16{}, monster16_params)

    case Repo.insert(changeset) do
      {:ok, _monster16} ->
        conn
        |> put_flash(:info, "Monster16 created successfully.")
        |> redirect(to: monster16_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    monster16 = Repo.get!(Monster16, id)
    render(conn, "show.html", monster16: monster16)
  end

  def edit(conn, %{"id" => id}) do
    monster16 = Repo.get!(Monster16, id)
    changeset = Monster16.changeset(monster16)
    render(conn, "edit.html", monster16: monster16, changeset: changeset)
  end

  def update(conn, %{"id" => id, "monster16" => monster16_params}) do
    monster16 = Repo.get!(Monster16, id)
    changeset = Monster16.changeset(monster16, monster16_params)

    case Repo.update(changeset) do
      {:ok, monster16} ->
        conn
        |> put_flash(:info, "Monster16 updated successfully.")
        |> redirect(to: monster16_path(conn, :show, monster16))
      {:error, changeset} ->
        render(conn, "edit.html", monster16: monster16, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    monster16 = Repo.get!(Monster16, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(monster16)

    conn
    |> put_flash(:info, "Monster16 deleted successfully.")
    |> redirect(to: monster16_path(conn, :index))
  end
end
