class AssemblyLine
  CARS_PER_HOUR = 221

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    cars_per_hour = @speed * CARS_PER_HOUR
    if @speed <= 4
      cars_per_hour
    elsif @speed <= 8
      cars_per_hour * 0.9
    elsif @speed == 9
      cars_per_hour * 0.8
    else
      cars_per_hour * 0.77
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
