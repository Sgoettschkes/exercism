return function(array, target)
  if #array == 0 then
    return -1
  else
    local lower_pos = 1
    local upper_pos = #array

    for _=1,10 do
      local middle_pos = math.ceil((lower_pos + upper_pos) / 2)
      local value = array[middle_pos]
      if (value == target) then
        return middle_pos
      elseif (middle_pos == 1) or (middle_pos == #array) then
        return -1
      elseif (value > target) then
        upper_pos = middle_pos - 1
      elseif (value < target) then
        lower_pos = middle_pos + 1
      end
    end
  end
end
