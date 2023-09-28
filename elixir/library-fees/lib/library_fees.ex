defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    time = NaiveDateTime.to_time(datetime)
    Time.after?(~T[12:00:00], time)
  end

  def return_date(checkout_datetime) do
    add =
      if before_noon?(checkout_datetime) do
        28
      else
        29
      end

    checkout_datetime |> NaiveDateTime.add(add, :day) |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    case Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date) do
      diff when diff <= 0 -> 0
      diff -> diff
    end
  end

  def monday?(datetime) do
    date = NaiveDateTime.to_date(datetime)
    Date.day_of_week(date) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    naive_checkout = NaiveDateTime.from_iso8601!(checkout)
    naive_actual_return = NaiveDateTime.from_iso8601!(return)

    rate =
      if(monday?(naive_actual_return)) do
        rate / 2
      else
        rate
      end

    naive_checkout = NaiveDateTime.from_iso8601!(checkout)
    naive_actual_return = NaiveDateTime.from_iso8601!(return)
    floor(days_late(return_date(naive_checkout), naive_actual_return) * rate)
  end
end
