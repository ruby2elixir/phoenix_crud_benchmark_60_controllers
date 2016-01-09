defmodule Back.Repo.Migrations.CreateMonster52 do
  use Ecto.Migration

  def change do
    create table(:monsters52) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
