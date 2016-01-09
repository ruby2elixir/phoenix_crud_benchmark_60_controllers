defmodule Back.Repo.Migrations.CreateMonster15 do
  use Ecto.Migration

  def change do
    create table(:monsters15) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
