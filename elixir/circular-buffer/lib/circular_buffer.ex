defmodule CircularBuffer do
  @moduledoc """
  An API to a stateful process that fills and empties a circular buffer
  """

  @doc """
  Create a new buffer of a given capacity
  """
  @spec new(capacity :: integer) :: {:ok, pid}
  def new(capacity) do
    Agent.start(fn ->
      %{list: [], pos: 0, capacity: capacity}
    end)
  end

  @doc """
  Read the oldest entry in the buffer, fail if it is empty
  """
  @spec read(buffer :: pid) :: {:ok, any} | {:error, atom}
  def read(buffer) do
    l =
      Agent.get_and_update(buffer, fn state ->
        {_, new_list} = List.pop_at(state.list, 0)
        {state.list, %{state | list: new_list}}
      end)

    case Enum.at(l, 0) do
      nil -> {:error, :empty}
      val -> {:ok, val}
    end
  end

  @doc """
  Write a new item in the buffer, fail if is full
  """
  @spec write(buffer :: pid, item :: any) :: :ok | {:error, atom}
  def write(buffer, item) do
    {l, capacity} = Agent.get(buffer, fn %{list: l, capacity: capacity} -> {l, capacity} end)

    if length(l) >= capacity do
      {:error, :full}
    else
      Agent.update(buffer, fn %{list: l} = state ->
        %{state | list: l ++ [item]}
      end)
    end
  end

  @doc """
  Write an item in the buffer, overwrite the oldest entry if it is full
  """
  @spec overwrite(buffer :: pid, item :: any) :: :ok
  def overwrite(buffer, item) do
    Agent.update(buffer, fn %{list: l, capacity: capacity} = state ->
      if length(l) >= capacity do
        {_, new_list} = List.pop_at(state.list, 0)
        %{state | list: new_list ++ [item]}
      else
        %{state | list: l ++ [item]}
      end
    end)
  end

  @doc """
  Clear the buffer
  """
  @spec clear(buffer :: pid) :: :ok
  def clear(buffer) do
    Agent.update(buffer, fn state -> %{state | list: []} end)
  end
end
