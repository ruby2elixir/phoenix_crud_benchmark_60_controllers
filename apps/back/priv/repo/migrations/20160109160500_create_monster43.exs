defmodule Back.Repo.Migrations.CreateMonster43 do
  use Ecto.Migration

  def change do
    create table(:monsters43) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
