defmodule Back.Repo.Migrations.CreateMonster56 do
  use Ecto.Migration

  def change do
    create table(:monsters56) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
