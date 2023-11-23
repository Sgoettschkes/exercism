(.x | abs) as $x |
(.y | abs) as $y |
((($x * $x) + ($y * $y) | sqrt) | pow(.;2)) as $d |
if $d <= 1 then 10
elif $d <= 25 then 5
elif $d <= 100 then 1
else 0 end
