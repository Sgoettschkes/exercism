class Clock
  attr_accessor :hour, :minute
  def initialize(hour:0, minute:0)
    @hour = (hour + (minute / 60).floor) % 24
    @minute = minute % 60
  end

  def to_s
    "#{hour_string}:#{minute_string}"
  end

  def +(other)
    Clock.new(hour: @hour + other.hour, minute: @minute + other.minute)
  end

  def -(other)
    Clock.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  def ==(other)
    @hour == other.hour and @minute == other.minute
  end

  def hour_string
    if @hour < 10 then "0" else "" end + @hour.to_s
  end

  def minute_string
    if @minute < 10 then "0" else "" end + @minute.to_s
  end
end
