defmodule Back.Repo.Migrations.CreateMonster58 do
  use Ecto.Migration

  def change do
    create table(:monsters58) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
