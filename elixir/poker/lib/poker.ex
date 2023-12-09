defmodule Poker do
  @doc """
  Given a list of poker hands, return a list containing the highest scoring hand.

  If two or more hands tie, return the list of tied hands in the order they were received.

  The basic rules and hand rankings for Poker can be found at:

  https://en.wikipedia.org/wiki/List_of_poker_hands

  For this exercise, we'll consider the game to be using no Jokers,
  so five-of-a-kind hands will not be tested. We will also consider
  the game to be using multiple decks, so it is possible for multiple
  players to have identical cards.

  Aces can be used in low (A 2 3 4 5) or high (10 J Q K A) straights, but do not count as
  a high card in the former case.

  For example, (A 2 3 4 5) will lose to (2 3 4 5 6).

  You can also assume all inputs will be valid, and do not need to perform error checking
  when parsing card values. All hands will be a list of 5 strings, containing a number
  (or letter) for the rank, followed by the suit.

  Ranks (lowest to highest): 2 3 4 5 6 7 8 9 10 J Q K A
  Suits (order doesn't matter): C D H S

  Example hand: ~w(4S 5H 4C 5D 4H) # Full house, 5s over 4s
  """
  @spec best_hand(list(list(String.t()))) :: list(list(String.t()))
  def best_hand(hands) do
    hands
    |> Enum.map(&make_hand/1)
    |> Enum.sort_by(fn %{sort_key: sort_key} -> sort_key end, :desc)
    |> Enum.reduce([], fn
      cur, [] ->
        [cur]

      cur, [first | _rest] = acc ->
        if cur.sort_key == first.sort_key do
          acc ++ [cur]
        else
          acc
        end
    end)
    |> Enum.map(&Map.get(&1, :original))
  end

  defp make_hand(hands_str) do
    hand =
      Enum.map(hands_str, fn hand_str ->
        hand_str
        |> String.split("", trim: true)
        |> then(fn
          [val, col] ->
            {get_value(val), String.to_atom(col)}

          [val1, val2, col] ->
            {get_value(val1 <> val2), String.to_atom(col)}
        end)
      end)

    %{original: hands_str, hand: hand, sort_key: get_sort_key(hand)}
  end

  defp get_value(str) do
    case Integer.parse(str) do
      {int, _} ->
        int

      :error ->
        case str do
          "J" -> 11
          "Q" -> 12
          "K" -> 13
          "A" -> 14
        end
    end
  end

  defp get_sort_key(hand) do
    case hand_type(hand) do
      105 ->
        {first_val, _g} =
          hand
          |> count_cards()
          |> Enum.find(fn {_, g} -> g == 4 end)

        {second_val, _g} =
          hand
          |> count_cards()
          |> Enum.find(fn {_, g} -> g == 1 end)

        [105, first_val, second_val]

      104 ->
        {first_val, _g} =
          hand
          |> count_cards()
          |> Enum.find(fn {_, g} -> g == 3 end)

        {second_val, _g} =
          hand
          |> count_cards()
          |> Enum.find(fn {_, g} -> g == 2 end)

        [104, first_val, second_val]

      hand_type ->
        hand
        |> Enum.map(fn {val, _col} -> 95 + val end)
        |> Enum.sort(:desc)
        |> then(fn sk -> [hand_type | sk] end)
    end
  end

  defp hand_type(hand) do
    cond do
      flush?(hand) && high_straight?(hand) -> 107
      flush?(hand) && low_straight?(hand) -> 106
      four_oak?(hand) -> 105
      fh?(hand) -> 104
      flush?(hand) -> 103
      high_straight?(hand) -> 102
      low_straight?(hand) -> 101
      three_oak?(hand) -> 100
      two_pair?(hand) -> 99
      one_pair?(hand) -> 98
      true -> 97
    end
  end

  defp four_oak?(hand) do
    hand
    |> count_cards()
    |> Enum.any?(fn {_, g} -> g == 4 end)
  end

  defp fh?(hand) do
    hand
    |> count_cards()
    |> Enum.count() == 2
  end

  defp flush?(hand) do
    hand
    |> Enum.map(fn {_val, col} -> col end)
    |> Enum.uniq()
    |> length() == 1
  end

  defp high_straight?(hand) do
    all_singles =
      hand
      |> count_cards()
      |> Enum.all?(fn {_, g} -> g == 1 end)

    distance_matches =
      hand
      |> Enum.map(fn {val, _col} -> val end)
      |> then(fn l ->
        Enum.max(l) - Enum.min(l) == 4
      end)

    all_singles && distance_matches
  end

  defp low_straight?(hand) do
    all_singles =
      hand
      |> count_cards()
      |> Enum.all?(fn {_, g} -> g == 1 end)

    distance_matches =
      hand
      |> Enum.map(fn
        {14, _col} -> 1
        {val, _col} -> val
      end)
      |> then(fn l ->
        Enum.max(l) - Enum.min(l) == 4
      end)

    all_singles && distance_matches
  end

  defp three_oak?(hand) do
    hand
    |> count_cards()
    |> Enum.any?(fn {_, g} -> g == 3 end)
  end

  defp two_pair?(hand) do
    hand
    |> count_cards()
    |> Enum.filter(fn {_, g} -> g == 2 end)
    |> length() == 2
  end

  defp one_pair?(hand) do
    hand
    |> count_cards()
    |> Enum.any?(fn {_, g} -> g == 2 end)
  end

  defp count_cards(hand) do
    hand
    |> Enum.map(fn {val, _col} -> val end)
    |> Enum.reduce(%{}, fn char, acc ->
      Map.update(acc, char, 1, &(&1 + 1))
    end)
  end
end
