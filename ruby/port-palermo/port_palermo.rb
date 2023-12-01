module Port
  IDENTIFIER = :pale.upcase

  def self.get_identifier(city)
    city[0..3].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    if ["OIL", "GAS"].include? ship_identifier.to_s[0..2] then
      :A
    else
      :B
    end
  end
end
