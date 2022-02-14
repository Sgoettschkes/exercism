defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a === b, do: :equal

  def compare([], _b), do: :sublist

  def compare(_a, []), do: :superlist

  # A can be a superlist of B or unequal
  def compare(a, b) when length(a) > length(b) do
    case sublist?(b, a) do
      true -> :superlist
      false -> :unequal
    end
  end

  # A can be a sublist or unequal
  def compare(a, b) when length(a) < length(b) do
    case sublist?(a, b) do
      true -> :sublist
      false -> :unequal
    end
  end

  def compare(_a, _b), do: :unequal

  defp sublist?(_a, []), do: false

  defp sublist?(a, b) when length(a) > length(b), do: false

  defp sublist?(a, [_head_b | tail_b] = b) do
    case a === Enum.take(b, length(a)) do
      true -> true
      false -> sublist?(a, tail_b)
    end
  end
end
