defmodule Back.Repo.Migrations.CreateMonster3 do
  use Ecto.Migration

  def change do
    create table(:monsters3) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
