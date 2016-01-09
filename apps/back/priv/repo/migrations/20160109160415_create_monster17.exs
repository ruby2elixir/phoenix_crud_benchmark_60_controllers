defmodule Back.Repo.Migrations.CreateMonster17 do
  use Ecto.Migration

  def change do
    create table(:monsters17) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
