defmodule Ekzer.Repo do
    use Ecto.Repo,

    otp_app: :ekzer,
    adapter: Ecto.Adapters.Postgres
end