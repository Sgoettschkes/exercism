defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search(tuple, key) when is_tuple(tuple), do: search(Tuple.to_list(tuple), key)
  def search([head], key) when head == key, do: {:ok, 0}
  def search([head], key) when head != key, do: :not_found

  def search(list, key) do
    middle_pos = round(length(list) / 2)

    case Enum.at(list, middle_pos) do
      elem when elem == key ->
        {:ok, middle_pos}

      elem when elem > key ->
        search(Enum.slice(list, 0..(middle_pos - 1)), key)

      elem when elem < key ->
        case search(Enum.slice(list, middle_pos..-1), key) do
          {:ok, pos} -> {:ok, pos + middle_pos}
          :not_found -> :not_found
        end
    end
  end
end
