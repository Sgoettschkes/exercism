def chunk:
  if length <= 5 then
    .
  else
    "\(.[:5]) \(.[5:] | chunk)"
  end
;

if .property == "encode" then
  .input.phrase | 
  ascii_downcase | 
  explode | 
  map(
    select(
      (. >= 48 and . <= 57) or (. >= 97 and . <= 122)
    )
  ) | 
  map(
    if . >= 97 then
      122-(.-97)
    else
      .
    end
  ) | 
  implode |
  chunk
else
  .input.phrase |
  explode | 
  map(
    select(
      (. >= 48 and . <= 57) or (. >= 97 and . <= 122)
    )
  ) | 
  map(
    if . >= 97 then
      122-(.-97)
    else
      .
    end
  ) | 
  implode
end
