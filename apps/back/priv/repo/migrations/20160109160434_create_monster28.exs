defmodule Back.Repo.Migrations.CreateMonster28 do
  use Ecto.Migration

  def change do
    create table(:monsters28) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
