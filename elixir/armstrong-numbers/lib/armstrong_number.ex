defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)

    Enum.reduce(digits, 0, fn digit, acc ->
      Integer.pow(digit, length(digits)) + acc
    end) == number
  end
end
