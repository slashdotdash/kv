defmodule Kv.LoggingHandler do
  use Commanded.Event.Handler, name: __MODULE__, start_from: :origin

  def handle(%Kv.ValuePut{key: key, value: value}, _metadata) do
    IO.puts("Received event for key #{inspect(key)} with value #{inspect(value)}")

    :ok
  end

  def handle(%Kv.ValueIncremented{key: key, value: value}, _metadata) do
    IO.puts("Value for key #{inspect(key)} incremented to #{inspect(value)}")

    :ok
  end
end
