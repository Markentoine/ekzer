defmodule Ekzer.Schema.Keyword do
  use Ecto.Schema

  schema "keywords" do
    field(:keyword, :string)

    many_to_many(:exercices, Ekzer.Schema.Exercice, join_through: "exercice_keyword")
  end
end
