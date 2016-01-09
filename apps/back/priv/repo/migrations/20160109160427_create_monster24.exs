defmodule Back.Repo.Migrations.CreateMonster24 do
  use Ecto.Migration

  def change do
    create table(:monsters24) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
