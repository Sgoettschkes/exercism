class CircularBuffer
  def initialize(size)
    @size = size
    @buffer = []
  end

  def read()
    raise BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def write(data)
    raise BufferFullException if @buffer.length == @size
    @buffer.push(data)
  end

  def write!(data)
    read() if @buffer.length == @size
    write(data)
  end

  def clear()
    @buffer = []
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
end
