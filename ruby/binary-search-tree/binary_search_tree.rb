class Bst
  attr_accessor :data, :left, :right

  def initialize(num)
    @data = num
  end

  def insert(num)
    if num <= @data then
      if @left == nil then
        @left = Bst.new(num)
      else
        @left.insert(num)
      end
    else
      if @right == nil then
        @right = Bst.new(num)
      else
        @right.insert(num)
      end
    end
  end

  def each(&block)
    res = []
    if @left != nil then
      res += @left.each.to_a
    end
    res += [@data].each.to_a
    if @right != nil then
      res += @right.each.to_a
    end

    res.each(&block)
  end
end
