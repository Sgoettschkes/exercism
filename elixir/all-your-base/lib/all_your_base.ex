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
        Enum.reduce(digits, 0, fn digit, acc -> acc * input_base + digit end)

      result =
        base_10
        |> convert_to_base(output_base)
        |> Enum.reverse()

      {:ok, if(result != [], do: result, else: [0])}
    end
  end

  defp convert_to_base(0, _base), do: []

  defp convert_to_base(rest, base) do
    [rem(rest, base) | convert_to_base(div(rest, base), base)]
  end
end
