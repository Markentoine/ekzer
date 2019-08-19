defmodule Ekzer.Schema.Type do
    use Ecto.Schema

    schema "types" do
        field :type, :string

        has_many :exercices, Ekzer.Schema.Exercice
    end
end