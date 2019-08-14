defmodule Ekzer do
  defdelegate create(level, type, field, keywords), to: Ekzer.Interface
end
