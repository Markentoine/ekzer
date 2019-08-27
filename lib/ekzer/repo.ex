defmodule Ekzer.Repo do

  use Ecto.Repo,
    otp_app: :ekzer,
    adapter: Ecto.Adapters.Postgres

  def init(_type, config) do
      {:ok, Keyword.put(config, :url, "ecto://jerometoulouse:postgres@localhost/ekzer_db")}
  end
end
