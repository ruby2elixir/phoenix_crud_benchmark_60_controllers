defmodule Back.Repo.Migrations.CreateMonster35 do
  use Ecto.Migration

  def change do
    create table(:monsters35) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
