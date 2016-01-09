defmodule Back.Repo.Migrations.CreateMonster12 do
  use Ecto.Migration

  def change do
    create table(:monsters12) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
