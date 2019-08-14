defmodule Ekzer.Insertion do
    alias Ekzer.{Repo, Exercice, Keyword, ExerciceKeyword}

    import Ecto.Query
    import Ecto.Changeset

    def create_exercise(level, type, field) do
        params = %{level: level, type: type, field: field}
        changeset =
        %Exercice{}
        |> cast(params, [:level, :type, :field])
        |> validate_required([:level, :type, :field])
        {:ok, exercice} = Repo.insert(changeset)
        exercice
    end

    def process_keywords(exercice, keywords) do
        Enum.each(keywords, fn k -> 
            associate_keyword(value_exists_db?("keyword", k), k, exercice.id)
        end)
    end

    # PRIVATE

    defp associate_keyword([], kw, exercice_id) do
        params = %{keyword: kw}
        changeset =
        %Keyword{}
        |> cast(params, [:keyword])
        |> validate_required([:keyword])
        {:ok, keyword} = Repo.insert(changeset)
        update_m_m_relationship(exercice_id, keyword.id)
    end
    
    defp associate_keyword([[kw_id]], kw, exercice_id) do
        update_m_m_relationship(exercice_id, kw_id)
    end

    defp update_m_m_relationship(ex_id, kw_id) do
        #{:ok, v} = Repo.insert(%ExerciceKeyword{exercice_id: ex_id, keyword_id: kw_id})
        #v
    end

    defp value_exists_db?(table, v) do
        query = from k in table,
        where: k.keyword == ^v,
        select: [k.id]
        Repo.all(query)
    end
end