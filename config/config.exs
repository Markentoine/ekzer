use Mix.Config

config :ekzer, Ekzer.Repo,
database: "exercice",
username: "jerometoulouse",
password: "postgres",
hostname: "localhost"

config :ekzer, ecto_repos: [Ekzer.Repo]