local Set = {}
Set.__index = Set

function Set.new(...)
  local set = setmetatable({}, Set)
  for _, l in ipairs{...} do
    set:add(l)
  end
  return set
end

function Set:add(value)
  if not self[value] then self[value] = true end
end

function Set:is_empty()
  return next(self) == nil
end

function Set:contains(value)
  return self[value] and true or false
end

function Set:is_subset(set_2)
  return self == set_2
end

return function(...)
  return Set.new(...)
end
