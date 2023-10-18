defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_digits, input_base, _output_base) when input_base < 2,
    do: {:error, "input base must be >= 2"}

  def convert(_digits, _input_base, output_base) when output_base < 2,
    do: {:error, "output base must be >= 2"}

  def convert(digits, input_base, output_base) do
    if Enum.any?(digits, fn digit ->
         digit < 0 or digit >= input_base
       end) do
      {:error, "all digits must be >= 0 and < input base"}
    else
      base_10 =
        digits
        |> Enum.with_index()
        |> Enum.map(fn {value, index} ->
          value * :math.pow(input_base, length(digits) - index - 1)
        end)
        |> Enum.map(&Kernel.trunc/1)
        |> Enum.sum()

      {:ok,
       convert_to_base(
         base_10,
         output_base,
         biggest_multiplicator(base_10, output_base, 1),
         []
       )}
    end
  end

  defp convert_to_base(_rest, _base, 0, result), do: result

  defp convert_to_base(rest, base, current_power, result) do
    cur = Kernel.trunc(rest / current_power)
    rest = rest - cur * current_power
    convert_to_base(rest, base, Kernel.trunc(current_power / base), result ++ [cur])
  end

  defp biggest_multiplicator(number, base, tmp) do
    if number < base * tmp do
      tmp
    else
      biggest_multiplicator(number, base, base * tmp)
    end
  end
end
