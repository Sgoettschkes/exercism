defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)

    cond do
      input == "" ->
        "Fine. Be that way!"

      shouting?(input) and questionmark?(input) ->
        "Calm down, I know what I'm doing!"

      questionmark?(input) ->
        "Sure."

      shouting?(input) ->
        "Whoa, chill out!"

      true ->
        "Whatever."
    end
  end

  defp shouting?(input) do
    input == String.upcase(input) and input != String.downcase(input)
  end

  defp questionmark?(input), do: String.last(input) == "?"
end
