defmodule ResistorColorTrio do

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
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    {result, _} =
      "#{Map.get(@resistor_colors, Enum.at(colors, 0))}#{Map.get(@resistor_colors, Enum.at(colors, 1))}"
      |> Integer.parse()

    ohms = result * :math.pow(10, Map.get(@resistor_colors, Enum.at(colors, 2)))

    case ohms do
      ohms when ohms > 999 -> {round(ohms/1000), :kiloohms}
      ohms -> {ohms, :ohms}
    end
  end
end
