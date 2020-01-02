defmodule PhoenixPoc.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_poc,
    adapter: Ecto.Adapters.Postgres
end
