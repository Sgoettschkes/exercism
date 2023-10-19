defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.reject(candidates, fn candidate ->
      String.downcase(candidate) == String.downcase(base) or charlist(candidate) != charlist(base)
    end)
  end

  defp charlist(str) do
    str |> String.downcase() |> String.split("", trim: true) |> Enum.sort()
  end
end
