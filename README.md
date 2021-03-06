# Kv

Key/value store in Elixir using Commanded CQRS/ES.

## Getting started

1. Clone Git repo from GitHub:

    ```console
    git clone https://github.com/slashdotdash/kv.git
    ```

2. Fetch mix dependencies:

    ```console
    mix deps.get
    ```

3. Create and initialise event store database:

    ```console
    mix do event_store.create, event_store.init
    ```

4. Create and migrate read store database:

    ```console
    mix do ecto.create, ecto.migrate
    ```

Finally, run the application using `iex`:

```console
iex -S mix run
```

## Usage

Once you've started an `iex` console you can start interacting with the `kv` application by dispatching commands.

```elixir
:ok = Kv.Router.dispatch(%Kv.PutValue{key: "foo", value: 1})
:ok = Kv.Router.dispatch(%Kv.IncrementValue{key: "foo", increment: 1})
```
