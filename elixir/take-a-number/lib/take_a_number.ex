defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(curr) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, curr)
        loop(curr)

      {:take_a_number, sender_pid} ->
        send(sender_pid, curr + 1)
        loop(curr + 1)

      :stop ->
        nil

      _ ->
        loop(curr)
    end
  end
end
