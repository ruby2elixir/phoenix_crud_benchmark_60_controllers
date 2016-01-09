defmodule Back.Repo.Migrations.CreateMonster11 do
  use Ecto.Migration

  def change do
    create table(:monsters11) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
