defmodule Back.Repo.Migrations.CreateMonster18 do
  use Ecto.Migration

  def change do
    create table(:monsters18) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
