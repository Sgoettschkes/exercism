defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn el -> el.price end, :asc)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn el -> el.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn el ->
      Map.put(el, :name, String.replace(el.name, old_word, new_word))
    end)
  end

  def increase_quantity(item, count) do
    Map.update!(item, :quantity_by_size, fn qbz ->
      qbz
      |> Enum.into(%{}, fn {size, quantity} -> {size, quantity + count} end)
    end)
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_size, quantity}, acc -> quantity + acc end)
  end
end
