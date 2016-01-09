defmodule Back.Repo.Migrations.CreateMonster9 do
  use Ecto.Migration

  def change do
    create table(:monsters9) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
