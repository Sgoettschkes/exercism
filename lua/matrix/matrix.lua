return function(s)
  local rows = {}
  local columns = {}

  local ri = 1
  for r in string.gmatch(s, "([^\n]+)") do
    local row = {}
    local ci = 1
    for c in string.gmatch(r, "%d+") do
      local cnum = tonumber(c)
      table.insert(row, cnum)
      if (ri == 1) then
        table.insert(columns, {cnum})
      else
        table.insert(columns[ci], cnum)
      end
      ci = ci + 1
    end
    table.insert(rows, row)
    ri = ri + 1
  end

  local function row(n)
    return rows[n]
  end

  local function column(n)
    return columns[n]
  end

  return {
    row = row,
    column = column
  }
end
