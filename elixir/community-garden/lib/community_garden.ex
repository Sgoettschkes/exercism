# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> %{cur_id: 0, plots: []} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn %{plots: plots} -> plots end)
  end

  def register(pid, register_to) do
    Agent.update(pid, fn %{cur_id: cur_id, plots: plots} ->
      %{
        cur_id: cur_id + 1,
        plots: [%Plot{plot_id: cur_id + 1, registered_to: register_to} | plots]
      }
    end)

    pid
    |> Agent.get(fn %{plots: plots} -> plots end)
    |> List.first()
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn %{cur_id: cur_id, plots: plots} ->
      %{
        cur_id: cur_id,
        plots: Enum.filter(plots, fn plot -> plot.plot_id != plot_id end)
      }
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn %{plots: plots} ->
      Enum.find(plots, {:not_found, "plot is unregistered"}, fn plot ->
        plot.plot_id == plot_id
      end)
    end)
  end
end
