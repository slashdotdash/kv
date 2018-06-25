use Mix.Config

config :commanded, event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :eventstore, EventStore.Storage,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "kv_dev",
  hostname: "localhost",
  pool_size: 10,
  pool_overflow: 5

config :commanded_ecto_projections, repo: Kv.Repo

config :kv, :ecto_repos, [Kv.Repo]

config :kv, Kv.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "kv_read_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
