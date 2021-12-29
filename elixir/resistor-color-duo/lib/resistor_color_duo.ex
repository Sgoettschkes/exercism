defmodule ResistorColorDuo do
  @resistor_colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    {result, _} =
      "#{Map.get(@resistor_colors, Enum.at(colors, 0))}#{Map.get(@resistor_colors, Enum.at(colors, 1))}"
      |> Integer.parse()

    result
  end
end
