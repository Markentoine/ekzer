defmodule Ekzer.Insertion do
    def create_exercise(level, type, field) do
        {:ok, exercice} = Repo.insert(%Exercice{level: level, type: type, field: field})
        exercice
    end
end