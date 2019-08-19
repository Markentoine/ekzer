defmodule Ekzer.Schema.Keyword do
    use Ecto.Schema

    schema "keywords" do
        field :keyword, :string
    end
end