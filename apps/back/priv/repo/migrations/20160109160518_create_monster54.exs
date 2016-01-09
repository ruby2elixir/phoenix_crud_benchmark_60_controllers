defmodule Back.Repo.Migrations.CreateMonster54 do
  use Ecto.Migration

  def change do
    create table(:monsters54) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
