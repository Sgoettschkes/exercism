defmodule Scrabble do

  @score %{
    "b" => 3,
    "c" => 3,
    "d" => 2,
    "f" => 4,
    "g" => 2,
    "h" => 4,
    "j" => 8,
    "k" => 5,
    "m" => 3,
    "p" => 3,
    "q" => 10,
    "v" => 4,
    "w" => 4,
    "x" => 8,
    "y" => 4,
    "z" => 10
  }
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase()
    |> String.trim()
    |> String.codepoints()
    |> Enum.map(fn char -> Map.get(@score, char, 1) end)
    |> Enum.sum()
  end
end
