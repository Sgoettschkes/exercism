defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    p = :math.sqrt(:math.pow(abs(x), 2) + :math.pow(abs(y), 2))

    cond do
      p > 10 -> 0
      p > 5 -> 1
      p > 1 -> 5
      true -> 10
    end
  end
end
