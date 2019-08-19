defmodule Ekzer.Schema.Exercice do
    use Ecto.Schema

    alias Ekzer.Schema.{Type, Keyword, Field, Level, Objective}

    schema "exercices" do
        many_to_many :keywords, Keyword, join_through: "exercice_keyword"
        many_to_many :objectives, Objective, join_through: "exercice_objective"

        belongs_to :level, Level
        belongs_to :type, Type
        belongs_to :field, Field
    end

end