defmodule Back.Repo.Migrations.CreateMonster27 do
  use Ecto.Migration

  def change do
    create table(:monsters27) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
