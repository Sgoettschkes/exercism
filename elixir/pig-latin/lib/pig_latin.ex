defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(phrase) do
    cond do
      String.starts_with?(phrase, ["a", "e", "i", "o", "u"]) ->
        phrase <> "ay"

      String.starts_with?(phrase, "qu") ->
        String.slice(phrase, 2..String.length(phrase)) <> "quay"

      String.match?(phrase, ~r/^.qu/) ->
        String.slice(phrase, 3..String.length(phrase)) <> String.first(phrase) <> "quay"

      String.match?(phrase, ~r/^[xy][^aeiou].+$/) ->
        phrase <> "ay"

      String.match?(phrase, ~r/^\wy$/) ->
        "y" <> String.first(phrase) <> "ay"

      String.match?(phrase, ~r/^[^aeiou]+y/) ->
        first_consonants =
          phrase
          |> String.codepoints()
          |> Enum.take_while(fn char ->
            char != "y"
          end)
          |> to_string()

        String.slice(phrase, String.length(first_consonants)..String.length(phrase)) <>
          first_consonants <> "ay"

      true ->
        first_consonants =
          phrase
          |> String.codepoints()
          |> Enum.take_while(fn char ->
            !(char in ["a", "e", "i", "o", "u"])
          end)
          |> to_string()

        String.slice(phrase, String.length(first_consonants)..String.length(phrase)) <>
          first_consonants <> "ay"
    end
  end
end
