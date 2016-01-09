defmodule Back.Repo.Migrations.CreateMonster6 do
  use Ecto.Migration

  def change do
    create table(:monsters6) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
