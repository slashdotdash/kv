defmodule Kv.Router do
  use Commanded.Commands.Router

  dispatch [
    Kv.PutValue,
    Kv.IncrementValue], to: Kv, identity: :key
end
