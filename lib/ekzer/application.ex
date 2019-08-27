defmodule Ekzer.Application do
  use Application

  def start(_type, _args) do
    children = [
      Ekzer.Repo
    ]

    opts = [strategy: :one_for_one, name: Ekzer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
