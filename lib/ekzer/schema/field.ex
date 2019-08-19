defmodule Ekzer.Schema.Field do
    schema "fields" do
        field :field, :string

        has_many :exercices, Ekzer.Schema.Exercice
    end
end