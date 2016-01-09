defmodule Back.Repo.Migrations.CreateMonster41 do
  use Ecto.Migration

  def change do
    create table(:monsters41) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
