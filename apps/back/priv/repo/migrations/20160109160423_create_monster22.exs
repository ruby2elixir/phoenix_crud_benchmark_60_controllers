defmodule Back.Repo.Migrations.CreateMonster22 do
  use Ecto.Migration

  def change do
    create table(:monsters22) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
