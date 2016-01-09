defmodule Back.Repo.Migrations.CreateMonster55 do
  use Ecto.Migration

  def change do
    create table(:monsters55) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
