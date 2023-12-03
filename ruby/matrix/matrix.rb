class Matrix
  def initialize(str)
    @matrix = str.split("\n").map{|l| l.split(" ")}
  end

  def row(num)
    @matrix[num-1].map{|c| c.to_i}
  end

  def column(num)
    @matrix.map{|l| l[num-1].to_i}
  end
end
