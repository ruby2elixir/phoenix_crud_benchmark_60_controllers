defmodule Back.Repo.Migrations.CreateMonster49 do
  use Ecto.Migration

  def change do
    create table(:monsters49) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
