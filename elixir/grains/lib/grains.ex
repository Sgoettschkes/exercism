defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer()) :: {:ok, pos_integer()} | {:error, String.t()}
  def square(number) when number < 1 or number > 64,
    do: {:error, "The requested square must be between 1 and 64 (inclusive)"}

  def square(number) do
    1..number
    |> Enum.to_list()
    |> Enum.reduce(fn
      1, _ -> 1
      _num, acc -> acc * 2
    end)
    |> then(fn num -> {:ok, num} end)
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: {:ok, pos_integer()}
  def total do
    1..64
    |> Enum.to_list()
    |> Enum.map(fn num ->
      {:ok, result} = square(num)
      result
    end)
    |> Enum.sum()
    |> then(fn num -> {:ok, num} end)
  end
end
