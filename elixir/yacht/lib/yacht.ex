defmodule Yacht do
  @type category ::
          :ones
          | :twos
          | :threes
          | :fours
          | :fives
          | :sixes
          | :full_house
          | :four_of_a_kind
          | :little_straight
          | :big_straight
          | :choice
          | :yacht

  @doc """
  Calculate the score of 5 dice using the given category's scoring method.
  """
  @spec score(category :: category(), dice :: [integer]) :: integer
  def score(:yacht, dice) do
    if count_different_numbers(dice) == 1 do
      50
    else
      0
    end
  end

  def score(:ones, dice), do: count_specific_number(dice, 1)
  def score(:twos, dice), do: count_specific_number(dice, 2) * 2
  def score(:threes, dice), do: count_specific_number(dice, 3) * 3
  def score(:fours, dice), do: count_specific_number(dice, 4) * 4
  def score(:fives, dice), do: count_specific_number(dice, 5) * 5
  def score(:sixes, dice), do: count_specific_number(dice, 6) * 6

  def score(:full_house, dice) do
    if Enum.sort(Map.values(Enum.frequencies(dice))) == [2, 3] do
      Enum.sum(dice)
    else
      0
    end
  end

  def score(:four_of_a_kind, dice) do
    case frequencies(dice) do
      %{4 => roll1} -> roll1 * 4
      %{5 => roll1} -> roll1 * 4
      _ -> 0
    end
  end

  def score(:little_straight, dice) do
    if count_different_numbers(dice) == 5 && count_specific_number(dice, 1) == 1 &&
         count_specific_number(dice, 6) == 0 do
      30
    else
      0
    end
  end

  def score(:big_straight, dice) do
    if count_different_numbers(dice) == 5 && count_specific_number(dice, 1) == 0 &&
         count_specific_number(dice, 6) == 1 do
      30
    else
      0
    end
  end

  def score(:choice, dice), do: Enum.sum(dice)

  defp count_different_numbers(dice), do: dice |> Enum.uniq() |> Enum.count()
  defp count_specific_number(dice, number), do: Enum.count(dice, fn roll -> roll == number end)

  defp frequencies(dice) do
    dice
    |> Enum.frequencies()
    |> Enum.into(%{}, &{elem(&1, 1), elem(&1, 0)})
  end
end
