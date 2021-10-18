module Grains (square, total) where

import Data.Maybe

square :: Integer -> Maybe Integer
square a 
    | a < 1 || a > 64 = Nothing
    | otherwise = Just $ 2 ^ (a - 1)

total :: Integer
total = sum $ map (fromJust . square) [1..64]
