defmodule Kv.Read.Projector do
  use Commanded.Projections.Ecto, name: inspect(__MODULE__), repo: Kv.Repo

  import Ecto.Query

  project %Kv.ValuePut{key: key, value: value} do
    Ecto.Multi.insert(
      multi,
      :kv,
      %Kv.Read.Kv{key: key, value: inspect(value)},
      on_conflict: [set: [value: inspect(value)]],
      conflict_target: :key
    )
  end

  project %Kv.ValueIncremented{key: key, value: value} do
    query = from(kv in Kv.Read.Kv, where: kv.key == ^key)

    Ecto.Multi.update_all(multi, :kv, query, set: [value: inspect(value)])
  end
end
