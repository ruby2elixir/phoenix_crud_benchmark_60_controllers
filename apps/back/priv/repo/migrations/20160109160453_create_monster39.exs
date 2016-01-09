defmodule Back.Repo.Migrations.CreateMonster39 do
  use Ecto.Migration

  def change do
    create table(:monsters39) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
