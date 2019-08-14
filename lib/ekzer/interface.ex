defmodule Ekzer.Interface do
    alias Ekzer.{Insertion}

    def create(level, type, field) do
        Insertion.create_exercise(level, type, field)
    end
end