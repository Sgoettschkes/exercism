def chunk(len):
  if length <= len then
    .
  else
    .[:len], .[1:] | chunk(len)
  end
;

(.sliceLength | tonumber) as $len |
if $len < 0 then
  "slice length cannot be negative" | halt_error
elif $len == 0 then
  "slice length cannot be zero" | halt_error
elif (.series | length) < 1 then
  "series cannot be empty" | halt_error
elif (.series | length) < $len then
  "slice length cannot be greater than series length" | halt_error
else
  [.series | chunk($len)]
end
