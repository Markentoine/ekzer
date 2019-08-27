defmodule Ekzer.Interface do
  alias Ekzer.{Insertion}

  def create(params) do
    Insertion.exercise(params)
    # |> Insertion.process_keywords(keywords)
  end
end
