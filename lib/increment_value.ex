defmodule Kv.IncrementValue do
  @enforce_keys [:key, :increment]
  defstruct [:key, :increment]
end
