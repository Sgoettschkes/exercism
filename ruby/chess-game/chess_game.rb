module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    RANKS.include? rank and FILES.include? file
  end

  def self.nick_name(first_name, last_name)
    (first_name[..1] + last_name[-2..]).upcase
  end

  def self.move_message(first_name, last_name, square)
    rank = square[1].to_i
    file = square[0]
    if valid_square?(rank, file) then
      "#{nick_name(first_name, last_name)} moved to #{square}"
    else 
      "#{nick_name(first_name, last_name)} attempted to move to #{square}, but that is not a valid square"
    end
  end
end