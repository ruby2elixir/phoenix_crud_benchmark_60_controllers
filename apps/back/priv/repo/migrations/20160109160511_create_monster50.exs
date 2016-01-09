defmodule Back.Repo.Migrations.CreateMonster50 do
  use Ecto.Migration

  def change do
    create table(:monsters50) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
