defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  # Add code to define the protocol and its implementations below here...
  defprotocol Edible do
    def eat(item, character)
  end

  defimpl Edible, for: RPG.LoafOfBread do
    def eat(_item, %Character{health: health} = character) do
      {nil, %{character | health: health + 5}}
    end
  end

  defimpl Edible, for: RPG.ManaPotion do
    def eat(%ManaPotion{strength: strength}, %Character{mana: mana} = character) do
      {%RPG.EmptyBottle{}, %{character | mana: mana + strength}}
    end
  end

  defimpl Edible, for: RPG.Poison do
    def eat(%Poison{}, %Character{} = character) do
      {%RPG.EmptyBottle{}, %{character | health: 0}}
    end
  end
end
