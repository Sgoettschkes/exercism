local function square_of_sum(n)
  a = 0
  for i=1, n do
    a = a + i
  end

  return a^2
end

local function sum_of_squares(n)
  a = 0
  for i=1, n do
    a = a + i^2
  end

  return a
end

local function difference_of_squares(n)
  return square_of_sum(n) - sum_of_squares(n)
end

return {
  square_of_sum = square_of_sum,
  sum_of_squares = sum_of_squares,
  difference_of_squares = difference_of_squares
}
