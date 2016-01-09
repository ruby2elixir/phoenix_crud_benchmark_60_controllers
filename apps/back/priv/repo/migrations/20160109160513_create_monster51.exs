defmodule Back.Repo.Migrations.CreateMonster51 do
  use Ecto.Migration

  def change do
    create table(:monsters51) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
