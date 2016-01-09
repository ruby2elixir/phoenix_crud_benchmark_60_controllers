defmodule Back.Repo.Migrations.CreateMonster14 do
  use Ecto.Migration

  def change do
    create table(:monsters14) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
