defmodule Lasagna do
  # Please define the 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven, do: 40

  # Please define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(x), do: expected_minutes_in_oven() - x

  # Please define the 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(x), do: x * 2

  # Please define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(x, y), do: preparation_time_in_minutes(x) + y

  # Please define the 'alarm/0' function
  def alarm, do: "Ding!"
end
