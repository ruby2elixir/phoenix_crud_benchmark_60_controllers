defmodule Back.Repo.Migrations.CreateMonster37 do
  use Ecto.Migration

  def change do
    create table(:monsters37) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
