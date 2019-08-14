defmodule Ekzer.Insertion do
    alias Ekzer.{Repo, Exercice}
    def create_exercise(level, type, field) do
        {:ok, exercice} = Repo.insert(%Exercice{level: level, type: type, field: field})
    end
end