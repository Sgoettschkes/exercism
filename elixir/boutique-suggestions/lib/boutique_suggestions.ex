defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    options = Keyword.merge([maximum_price: 100], options)

    for x <- tops,
        y <- bottoms,
        x.base_color != y.base_color and x.price + y.price <= Keyword.get(options, :maximum_price) do
      {x, y}
    end
  end
end
