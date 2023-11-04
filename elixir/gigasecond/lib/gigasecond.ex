defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from({date, time}) do
    {:ok, date} = Date.from_erl(date)
    {:ok, time} = Time.from_erl(time)
    {:ok, datetime} = DateTime.new(date, time, "Etc/UTC")
    new_datetime = DateTime.add(datetime, 1_000_000_000, :second)
    new_time = DateTime.to_time(new_datetime)
    new_date = DateTime.to_date(new_datetime)
    {Date.to_erl(new_date), Time.to_erl(new_time)}
  end
end
