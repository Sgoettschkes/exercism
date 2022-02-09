defmodule Username do
  def sanitize([]), do: []

  def sanitize([head | tail]) do
    case head do
      ?ß -> [?s, ?s]
      ?ä -> [?a, ?e]
      ?ö -> [?o, ?e]
      ?ü -> [?u, ?e]
      ?_ -> [?_]
      head when head in ?a..?z -> [head]
      _else -> []
    end
    |> Kernel.++(sanitize(tail))
  end
end
