defmodule Back.Repo.Migrations.CreateMonster26 do
  use Ecto.Migration

  def change do
    create table(:monsters26) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
