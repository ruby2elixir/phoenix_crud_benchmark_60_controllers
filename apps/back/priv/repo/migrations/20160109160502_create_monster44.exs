defmodule Back.Repo.Migrations.CreateMonster44 do
  use Ecto.Migration

  def change do
    create table(:monsters44) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
