defmodule Back.Repo.Migrations.CreateMonster7 do
  use Ecto.Migration

  def change do
    create table(:monsters7) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
