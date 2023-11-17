defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.codepoints()
    |> Enum.reduce({"", 1, ""}, fn
      char, {current_elem, count, result} when current_elem == char ->
        {current_elem, count + 1, result}

      char, {current_elem, 1, result} ->
        {char, 1, result <> current_elem}

      char, {current_elem, count, result} ->
        {char, 1, "#{result}#{count}#{current_elem}"}
    end)
    |> then(fn
      {current_elem, 1, result} ->
        result <> current_elem

      {current_elem, count, result} ->
        "#{result}#{count}#{current_elem}"
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    string
    |> String.codepoints()
    |> Enum.reduce({"0", ""}, fn
      char, {current_num, result} ->
        case Integer.parse(char) do
          :error ->
            repeat =
              case Integer.parse(current_num) do
                {0, _} -> 1
                {num, _} -> num
              end

            {"0", result <> String.duplicate(char, repeat)}

          _ ->
            {current_num <> char, result}
        end
    end)
    |> then(fn {_, result} -> result end)
  end
end
