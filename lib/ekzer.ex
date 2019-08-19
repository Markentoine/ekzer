defmodule Ekzer do
  defdelegate create(params), to: Ekzer.Interface
end
