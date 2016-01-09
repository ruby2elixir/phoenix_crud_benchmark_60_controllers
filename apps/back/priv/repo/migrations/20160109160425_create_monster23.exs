defmodule Back.Repo.Migrations.CreateMonster23 do
  use Ecto.Migration

  def change do
    create table(:monsters23) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
