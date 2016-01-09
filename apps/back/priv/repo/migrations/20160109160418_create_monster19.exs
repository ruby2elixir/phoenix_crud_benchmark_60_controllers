defmodule Back.Repo.Migrations.CreateMonster19 do
  use Ecto.Migration

  def change do
    create table(:monsters19) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
