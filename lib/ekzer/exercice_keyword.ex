defmodule Ekzer.ExerciceKeyword do
    use Ecto.Schema

    schema "exercice_keyword" do
        field :exercice_id, :integer
        field :keyword_id, :integer
    end
end