use Mix.Config

config :ekzer, Ekzer.Repo, url: "ecto://jerometoulouse:postgres@localhost/ekzer_db"

config :ekzer, ecto_repos: [Ekzer.Repo]
