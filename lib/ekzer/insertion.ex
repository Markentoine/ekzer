defmodule Ekzer.Insertion do
    alias Ekzer.{Repo, Exercice}

    import Ecto.Query

    def create_exercise(level, type, field) do
        {:ok, exercice} = Repo.insert(%Exercice{level: level, type: type, field: field})
        exercice
    end

    def associate_keywords(%Exercice{id: exercice_id}, keywords) do
        Enum.each(keywords, fn k -> 
            IO.inspect(value_exists_db?("keyword", k))
        end)
    end

    defp value_exists_db?(table, v) do
        query = from k in table,
        where: k.keyword == ^v,
        select: [k.keyword]
        Repo.all(query)
    end
end