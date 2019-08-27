defmodule Ekzer.Insertion do
  alias Ekzer.{Repo}
  alias Ekzer.Schema.{Exercice, Keyword, Type, Level, Field}

  import Ecto.Query
  import Ecto.Changeset

  def exercise(%{
        level: level,
        progression: progression,
        type: type,
        field: field,
        keywords: keywords
      }) do
    {:ok, exercice} =
      level
      |> assoc_level(progression)
      |> assoc_type(type)
      |> assoc_field(field)
      |> Repo.insert()
  end

  def process_keywords(exercice, keywords) do
    Enum.each(keywords, fn kw ->
      nil
    end)
  end

  # PRIVATE
  defp assoc_type(struc, type) do
    type = Repo.get_by(Type, type: type)
    %Exercice{type_id: type_id} = Ecto.build_assoc(type, :exercices)
    %Exercice{struc | type_id: type_id}
  end

  defp assoc_field(struc, field) do
    field = Repo.get_by(Field, field: field)
    %Exercice{field_id: field_id} = Ecto.build_assoc(field, :exercices)
    %Exercice{struc | field_id: field_id}
  end

  defp assoc_level(level, progression) do
    level = check(level_exists_db?(level, progression)) || insert_level(level, progression)
    Ecto.build_assoc(level, :exercices)
  end

  defp insert_level(level, progression) do
    params = %{level: level, progression: progression}

    changeset =
      %Level{}
      |> cast(params, [:level, :progression])
      |> validate_required([:level, :progression])

    {:ok, level} = Repo.insert(changeset)
    level
  end

  defp associate_keyword([], kw) do
    params = %{keyword: kw}

    changeset =
      %Keyword{}
      |> cast(params, [:keyword])
      |> validate_required([:keyword])

    {:ok, keyword} = Repo.insert(changeset)
    keyword
  end

  defp associate_keyword([[kw_id]], _kw) do
    Repo.get(Keyword, kw_id)
  end

  defp check([]), do: false
  defp check([[id]]), do: Repo.get(Level, id)

  defp keyword_exists_db?(v) do
    query =
      from(k in "keywords",
        where: k.keyword == ^v,
        select: [k.id]
      )

    Repo.all(query)
  end

  defp level_exists_db?(level, progression) do
    query =
      from(l in "levels",
        where: l.level == ^level and l.progression == ^progression,
        select: [l.id]
      )

    Repo.all(query)
  end
end
