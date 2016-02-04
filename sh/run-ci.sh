apk update
apk add postgresql-client
mix deps.get
MIX_ENV=test mix ecto.create ecto.migrate -r Back.Repo
MIX_ENV=test mix ecto.migrate -r Back.Repo
MIX_ENV=test mix ecto.create ecto.migrate -r Front.Repo
mix test
