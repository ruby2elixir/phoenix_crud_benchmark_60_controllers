defmodule Back.Repo.Migrations.CreateMonster32 do
  use Ecto.Migration

  def change do
    create table(:monsters32) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
