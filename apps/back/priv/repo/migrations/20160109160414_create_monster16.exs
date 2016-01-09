defmodule Back.Repo.Migrations.CreateMonster16 do
  use Ecto.Migration

  def change do
    create table(:monsters16) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
