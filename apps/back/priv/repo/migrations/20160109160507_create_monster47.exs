defmodule Back.Repo.Migrations.CreateMonster47 do
  use Ecto.Migration

  def change do
    create table(:monsters47) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
