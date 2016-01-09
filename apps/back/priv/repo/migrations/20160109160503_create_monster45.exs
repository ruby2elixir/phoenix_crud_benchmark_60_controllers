defmodule Back.Repo.Migrations.CreateMonster45 do
  use Ecto.Migration

  def change do
    create table(:monsters45) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
