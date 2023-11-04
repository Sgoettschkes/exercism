defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count > 0 do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.filter(&prime?/1)
    |> Stream.take(count)
    |> Enum.to_list()
    |> List.last()
  end

  defp prime?(2), do: true
  defp prime?(3), do: true

  defp prime?(num) do
    2..ceil(num / 2)
    |> Enum.filter(&(rem(num, &1) == 0))
    |> Enum.empty?()
  end
end
