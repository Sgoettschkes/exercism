def double_second:
  if (.key | tonumber) % 2 == 0 then
    (.value | tonumber) * 2 | if . > 9 then . - 9 else . end
  else
    (.value | tonumber)
  end;

. as $original |
$original | split("") | map(select(. != " ")) as $filtered |
if ($filtered | length) < 2 then 
  false 
elif $original | test("[^0-9\\s]") then false
else
  $filtered | reverse | with_entries(.key |= (1+.|tostring)) | to_entries | map(double_second) | add | . % 10 == 0
end
