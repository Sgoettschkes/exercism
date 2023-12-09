defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    result =
      [1000, 500, 100, 50, 10, 5, 1]
      |> Enum.reduce({"", number}, fn cur, {result, num} ->
        case round(:math.floor(num / cur)) do
          0 ->
            {result, num}

          amount ->
            result =
              result <>
                (Range.to_list(1..amount) |> Enum.map(fn _ -> to_literal(cur) end) |> Enum.join())

            {result, num - amount * cur}
        end
      end)
      |> then(fn {result, _} -> result end)

    Enum.reduce(
      [
        {"DCCCC", "CM"},
        {"CCCC", "CD"},
        {"LXXXX", "XC"},
        {"XXXX", "XL"},
        {"VIIII", "IX"},
        {"IIII", "IV"}
      ],
      result,
      fn {src, dest}, acc ->
        String.replace(acc, src, dest)
      end
    )
  end

  defp to_literal(1), do: "I"
  defp to_literal(5), do: "V"
  defp to_literal(10), do: "X"
  defp to_literal(50), do: "L"
  defp to_literal(100), do: "C"
  defp to_literal(500), do: "D"
  defp to_literal(1000), do: "M"
  defp to_literal(_), do: ""
end
