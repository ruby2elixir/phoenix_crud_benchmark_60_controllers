defmodule Back.Repo.Migrations.CreateMonster48 do
  use Ecto.Migration

  def change do
    create table(:monsters48) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
