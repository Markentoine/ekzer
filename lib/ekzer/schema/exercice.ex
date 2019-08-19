defmodule Ekzer.Schema.Exercice do
    use Ecto.Schema

    alias Ekzer.Schema.{Type, Keyword, Field, Level, Objective}

    schema "exercices" do
        many_to_many :types, Type, join_through: "exercice_type"
        many_to_many :keywords, Keyword, join_through: "exercice_keyword"
        many_to_many :fields, Field, join_through: "exercice_field"
        many_to_many :levels, Level, join_through: "exercice_level"
        many_to_many :objectives, Objective, join_through: "exercice_objective"
    end

end