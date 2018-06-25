defmodule Kv do
  defstruct [:key, :value]

  # Public command functions

  def execute(%Kv{value: value}, %Kv.PutValue{value: value}), do: []

  def execute(%Kv{}, %Kv.PutValue{key: key, value: value}) do
    %Kv.ValuePut{key: key, value: value}
  end

  def execute(%Kv{key: key, value: value}, %Kv.IncrementValue{increment: increment})
   when is_number(value) and is_number(increment) do
    %Kv.ValueIncremented{key: key, value: value + increment}
  end

  def execute(%Kv{}, %Kv.IncrementValue{}) do
    {:error, :invalid_value}
  end

  # State mutators

  def apply(%Kv{}, %Kv.ValuePut{key: key, value: value}) do
    %Kv{key: key, value: value}
  end

  def apply(%Kv{}, %Kv.ValueIncremented{key: key, value: value}) do
    %Kv{key: key, value: value}
  end
end
