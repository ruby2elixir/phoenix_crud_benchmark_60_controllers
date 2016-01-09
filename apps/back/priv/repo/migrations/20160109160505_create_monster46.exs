defmodule Back.Repo.Migrations.CreateMonster46 do
  use Ecto.Migration

  def change do
    create table(:monsters46) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
