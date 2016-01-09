ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Back.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Back.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Back.Repo)

