module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples [3, 0] x = 3
sumOfMultiples multipliers x = sum $ filter isMultipleOfAny [1..(x-1)]
    where isMultipleOfAny num = any (\x -> num `mod` x == 0) multipliers
