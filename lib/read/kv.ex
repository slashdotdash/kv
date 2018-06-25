defmodule Kv.Read.Kv do
  use Ecto.Schema

  @primary_key {:key, :string, autogenerate: false}
  schema "kv" do
    field :value, :string

    timestamps()
  end
end
