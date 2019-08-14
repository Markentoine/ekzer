defmodule Ekzer.Insertion do
    alias Ekzer.{Repo, Exercice, Keyword}

    import Ecto.Query

    def create_exercise(level, type, field) do
        {:ok, exercice} = Repo.insert(%Exercice{level: level, type: type, field: field})
        exercice
    end

    def process_keywords(%Exercice{id: exercice_id}, keywords) do
        Enum.each(keywords, fn k -> 
            associate_keyword(value_exists_db?("keyword", k), k)
        end)
    end

    defp associate_keyword([], kw) do
        {:ok, keyword} = Repo.insert(%Keyword{keyword: kw})
        keyword
    end

    defp associate_keyword(already_exists_db, kw) do
        IO.inspect(already_exists_db)
    end

    defp value_exists_db?(table, v) do
        query = from k in table,
        where: k.keyword == ^v,
        select: [k.keyword]
        Repo.all(query)
    end
end