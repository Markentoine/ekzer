defmodule Ekzer do
  defdelegate create(level, type, field), to: Ekzer.Interface
end
