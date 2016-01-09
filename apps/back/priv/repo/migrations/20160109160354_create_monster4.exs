defmodule Back.Repo.Migrations.CreateMonster4 do
  use Ecto.Migration

  def change do
    create table(:monsters4) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
