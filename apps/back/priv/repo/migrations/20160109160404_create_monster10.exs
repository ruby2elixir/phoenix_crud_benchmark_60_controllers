defmodule Back.Repo.Migrations.CreateMonster10 do
  use Ecto.Migration

  def change do
    create table(:monsters10) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
