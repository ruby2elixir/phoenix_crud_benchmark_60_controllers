defmodule Back.Repo.Migrations.CreateMonster34 do
  use Ecto.Migration

  def change do
    create table(:monsters34) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
