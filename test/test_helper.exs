ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Microflow.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Microflow.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Microflow.Repo)

