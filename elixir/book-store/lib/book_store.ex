defmodule BookStore do
  @typedoc "A book is represented by its number in the 5-book series"
  @type book :: 1 | 2 | 3 | 4 | 5

  @doc """
  Calculate lowest price (in cents) for a shopping basket containing books.
  """
  @spec total(basket :: [book]) :: integer
  def total(basket) do
    groups =
      basket
      |> group([])
      |> Enum.map(fn group ->
        book_amount = length(group)
        book_amount * 800 * (1 - discount(book_amount))
      end)
      |> Enum.sum()
  end

  defp group([], groups), do: groups

  defp group(remaining_basket, groups) do
    next_group = Enum.uniq(remaining_basket)
    group(remaining_basket -- next_group, [next_group | groups])
  end

  defp discount(1), do: 0
  defp discount(2), do: 0.05
  defp discount(3), do: 0.1
  defp discount(4), do: 0.2
  defp discount(5), do: 0.25
end
