defmodule Back.Repo.Migrations.CreateMonster31 do
  use Ecto.Migration

  def change do
    create table(:monsters31) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
