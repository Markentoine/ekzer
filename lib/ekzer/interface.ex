defmodule Ekzer.Interface do
    alias Ekzer.{Insertion}

    def create(level, type, field, keywords) do
        Insertion.create_exercise(level, type, field)
        |> Insertion.process_keywords(keywords)
    end
end