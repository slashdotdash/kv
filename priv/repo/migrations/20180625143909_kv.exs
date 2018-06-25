defmodule Kv.Repo.Migrations.Kv do
  use Ecto.Migration

  def change do
    create table("kv", primary_key: false) do
      add :key, :string, primary_key: true
      add :value, :string

      timestamps()
    end
  end
end
