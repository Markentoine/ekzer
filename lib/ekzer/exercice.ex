defmodule Ekzer.Exercice do
    use Ecto.Schema

    schema "exercice" do
        field :level, :integer
        field :type, :string
        field :field, :string
    end
end