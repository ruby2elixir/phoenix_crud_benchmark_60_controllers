defmodule Back.Repo.Migrations.CreateMonster8 do
  use Ecto.Migration

  def change do
    create table(:monsters8) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
