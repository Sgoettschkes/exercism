defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(char1, char2) when length(char1) != length(char2),
    do: {:error, "strands must be of equal length"}

  def hamming_distance(char1, char2) do
    {:ok, calc_hamming_distance(char1, char2)}
  end

  defp calc_hamming_distance([], []), do: 0

  defp calc_hamming_distance([head1 | tail1], [head2 | tail2]) do
    dist =
      if head1 == head2 do
        0
      else
        1
      end

    dist + calc_hamming_distance(tail1, tail2)
  end
end
