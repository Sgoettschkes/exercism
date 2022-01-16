return function(s)
  s = string.gsub(s, "%W", "")

  l = {}
  for i = 1, string.len(s)+1 do
    c = string.sub(s, i, i):lower()
    if l[c] then
      return false
    end
    l[c] = true
  end

  return true
end
