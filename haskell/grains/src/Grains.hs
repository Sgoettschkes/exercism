module Grains (square, total) where

square :: Integer -> Maybe Integer
square 0 = Nothing
square a 
    | a < 1 || a > 64 = Nothing
    | otherwise = Just $ 2 ^ (a - 1)

total :: Integer
total = case square 65 of 
  Just x -> x - 1
  Nothing -> 0
