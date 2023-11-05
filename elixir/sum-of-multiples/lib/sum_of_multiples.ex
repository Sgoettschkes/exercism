defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.map(fn
      0 -> 0
      factor -> Enum.to_list(factor..limit-1//factor)
    end)
    |> List.flatten()
    |> Enum.uniq()
    |> Enum.sum()
  end
end
