local prime_table = {false}

local function fill_sieve(first, last)
  for i = first, last do
    prime_table[i] = true
  end

  for i = first, math.floor(math.sqrt(last)) do
    if prime_table[i] then
      for j = i*i, last, i do
        prime_table[j] = false
      end
    end
  end
end

return function(n)
  if (n < 1) then
    error()
  end

  fill_sieve(2, 1000000)

  local num = 1
  local prime_count = 0
  while (true) do
    num = num + 1
    if (prime_table[num]) then
      prime_count = prime_count + 1
    end
    if (prime_count == n) then
      return num
    end
  end
end
