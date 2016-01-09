defmodule Back.Repo.Migrations.CreateMonster20 do
  use Ecto.Migration

  def change do
    create table(:monsters20) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
