defmodule Back.Repo.Migrations.CreateMonster13 do
  use Ecto.Migration

  def change do
    create table(:monsters13) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
