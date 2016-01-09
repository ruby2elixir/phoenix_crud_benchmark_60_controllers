defmodule Back.Repo.Migrations.CreateMonster21 do
  use Ecto.Migration

  def change do
    create table(:monsters21) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
