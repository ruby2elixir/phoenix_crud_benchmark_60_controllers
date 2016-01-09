defmodule Back.Repo.Migrations.CreateMonster29 do
  use Ecto.Migration

  def change do
    create table(:monsters29) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
