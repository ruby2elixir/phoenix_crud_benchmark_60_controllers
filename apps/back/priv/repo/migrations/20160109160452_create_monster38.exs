defmodule Back.Repo.Migrations.CreateMonster38 do
  use Ecto.Migration

  def change do
    create table(:monsters38) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
