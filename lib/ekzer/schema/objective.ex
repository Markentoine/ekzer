defmodule Ekzer.Schema.Objective do
  use Ecto.Schema

  schema "objectives" do
    field(:objective, :string)

    many_to_many(:exercices, Ekzer.Schema.Exercice, join_through: "exercice_objective")
  end
end
