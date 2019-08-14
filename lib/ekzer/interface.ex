defmodule Ekzer.Interface do
    alias Ekzer.{Repo, Exercice}

    def create(level, type, field) do
        {:ok, exercice} = Repo.insert(%Exercice{level: level, type: type, field: field})
        exercice
    end
end