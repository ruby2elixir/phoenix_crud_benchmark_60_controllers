defmodule Back.Repo.Migrations.CreateMonster1 do
  use Ecto.Migration

  def change do
    create table(:monsters1) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
