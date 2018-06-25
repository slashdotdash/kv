defmodule Kv.PutValue do
  @enforce_keys [:key]
  defstruct [:key, :value]
end
