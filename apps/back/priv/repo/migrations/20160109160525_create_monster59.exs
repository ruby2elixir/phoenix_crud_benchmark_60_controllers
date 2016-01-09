defmodule Back.Repo.Migrations.CreateMonster59 do
  use Ecto.Migration

  def change do
    create table(:monsters59) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
