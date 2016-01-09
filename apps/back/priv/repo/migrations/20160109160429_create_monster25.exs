defmodule Back.Repo.Migrations.CreateMonster25 do
  use Ecto.Migration

  def change do
    create table(:monsters25) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
