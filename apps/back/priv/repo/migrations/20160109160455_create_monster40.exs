defmodule Back.Repo.Migrations.CreateMonster40 do
  use Ecto.Migration

  def change do
    create table(:monsters40) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
