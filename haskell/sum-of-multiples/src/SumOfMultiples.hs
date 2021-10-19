module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples multipliers x = sum $ filter isMultipleOfAny [1..(x-1)]
    where m = filter (/= 0) multipliers
          isMultipleOfAny num = any (\y -> num `mod` y == 0) m
