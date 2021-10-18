module Grains(square, total) where

square :: Int -> Integer
square 0 = 0
square a = 2 ^ (a - 1)

total :: Integer
total = square 65 - 1