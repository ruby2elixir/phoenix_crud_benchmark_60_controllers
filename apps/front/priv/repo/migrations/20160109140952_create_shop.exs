defmodule Front.Repo.Migrations.CreateShop do
  use Ecto.Migration

  def change do
    create table(:shops) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
