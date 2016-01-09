defmodule Back.Repo.Migrations.CreateMonster36 do
  use Ecto.Migration

  def change do
    create table(:monsters36) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
