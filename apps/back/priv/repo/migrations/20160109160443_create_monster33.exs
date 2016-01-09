defmodule Back.Repo.Migrations.CreateMonster33 do
  use Ecto.Migration

  def change do
    create table(:monsters33) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
