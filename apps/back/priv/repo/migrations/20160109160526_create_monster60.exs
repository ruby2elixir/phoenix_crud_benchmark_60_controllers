defmodule Back.Repo.Migrations.CreateMonster60 do
  use Ecto.Migration

  def change do
    create table(:monsters60) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
