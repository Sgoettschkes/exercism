module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz x
  | x < 1 = Nothing 
  | otherwise = Just (collatz' x)

collatz' :: Integer -> Integer
collatz' x
  | x == 1 = 0
  | even x = 1 + collatz' (x `div` 2)
  | odd x = 1 + collatz' (3 * x + 1)
  | otherwise = 0
