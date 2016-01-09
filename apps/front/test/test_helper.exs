ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Front.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Front.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Front.Repo)

