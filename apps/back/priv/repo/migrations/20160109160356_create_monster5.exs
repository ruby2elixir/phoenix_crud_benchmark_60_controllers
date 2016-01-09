defmodule Back.Repo.Migrations.CreateMonster5 do
  use Ecto.Migration

  def change do
    create table(:monsters5) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
