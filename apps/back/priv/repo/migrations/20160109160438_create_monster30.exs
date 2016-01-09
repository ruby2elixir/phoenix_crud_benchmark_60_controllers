defmodule Back.Repo.Migrations.CreateMonster30 do
  use Ecto.Migration

  def change do
    create table(:monsters30) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
