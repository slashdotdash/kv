defmodule Kv.Application do
  use Application

  def start(_type, _args) do
    children = [
      Kv.Repo,
      Kv.LoggingHandler,
      Kv.Read.Projector
    ]

    opts = [strategy: :one_for_one, name: Kv.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
