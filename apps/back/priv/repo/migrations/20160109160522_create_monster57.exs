defmodule Back.Repo.Migrations.CreateMonster57 do
  use Ecto.Migration

  def change do
    create table(:monsters57) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
