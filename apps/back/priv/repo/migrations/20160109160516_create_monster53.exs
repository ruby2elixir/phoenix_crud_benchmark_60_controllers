defmodule Back.Repo.Migrations.CreateMonster53 do
  use Ecto.Migration

  def change do
    create table(:monsters53) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
