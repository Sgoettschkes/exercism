module Luhn (isValid) where

import Data.Char(digitToInt)

isValid :: String -> Bool
isValid n 
  | length reversedNumStr < 2 = False
  | otherwise = luhnCalc reversedNumStr `mod` 10 == 0
  where
    reversedNumStr = reverse $ filter (`elem` ['0'..'9']) n

luhnCalc :: String -> Int
luhnCalc [] = 0
luhnCalc [x] = luhnDoubling x
luhnCalc (x:xs:xss) = digitToInt x + luhnDoubling xs + luhnCalc xss

luhnDoubling :: Char -> Int
luhnDoubling c
  | cD < 10 = cD
  | otherwise = cD - 9
  where 
    cD = digitToInt c * 2
