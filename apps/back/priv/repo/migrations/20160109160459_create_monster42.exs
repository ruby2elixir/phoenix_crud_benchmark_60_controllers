defmodule Back.Repo.Migrations.CreateMonster42 do
  use Ecto.Migration

  def change do
    create table(:monsters42) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
