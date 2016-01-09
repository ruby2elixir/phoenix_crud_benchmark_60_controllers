defmodule Back.Repo.Migrations.CreateMonster2 do
  use Ecto.Migration

  def change do
    create table(:monsters2) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
