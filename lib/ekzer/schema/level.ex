defmodule Ekzer.Schema.Level do
  use Ecto.Schema

  schema "levels" do
    field(:level, :integer)
    field(:progression, :integer)

    has_many(:exercices, Ekzer.Schema.Exercice)
  end
end
