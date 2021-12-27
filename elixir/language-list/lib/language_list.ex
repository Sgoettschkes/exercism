defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language] ++ list
  end

  def remove([_head | tail]) do
    tail
  end

  def first([head | _tail]) do
    head
  end

  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)

  def exciting_list?([]), do: false
  def exciting_list?([head | _tail]) when head == "Elixir", do: true
  def exciting_list?([_head | tail]), do: exciting_list?(tail)
end
