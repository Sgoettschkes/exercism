defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_head | tail]) do
    tail
  end

  def first([head | _tail]) do
    head
  end

  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)

  def functional_list?([]), do: false
  def functional_list?([head | _tail]) when head == "Elixir", do: true
  def functional_list?([_head | tail]), do: functional_list?(tail)
end
