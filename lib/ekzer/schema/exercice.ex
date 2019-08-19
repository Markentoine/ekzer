defmodule Ekzer.Schema.Exercice do
    use Ecto.Schema

    alias Ekzer.Schema.{Type, Keyword, Field, Level, Objective}

    schema "exercice" do
        many_to_many :type, Type, join_through: "exercice_type"
        many_to_many :keyword, Keyword, join_through: "exercice_keyword"
        many_to_many :field, Field, join_through: "exercice_field"
        many_to_many :field, Level, join_through: "exercice_level"
        many_to_many :field, Objective, join_through: "exercice_objective"
    end

end