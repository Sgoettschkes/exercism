module Raindrops
  def self.convert(num)
    res = ""
    
    if num % 3 == 0
      res += "Pling"
    end
    if num % 5 == 0
      res += "Plang"
    end
    if num % 7 == 0
      res += "Plong"
    end
    
    res == "" ? num.to_s : res
  end
end
