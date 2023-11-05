defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    clean =
      sentence
      |> String.downcase()
      |> String.codepoints()
      |> Enum.reject(fn char -> char == "-" || char == " " end)

    length(clean) == length(Enum.uniq(clean))
  end
end
