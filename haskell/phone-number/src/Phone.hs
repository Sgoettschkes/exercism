module Phone (number) where

import Text.Regex.Posix

number :: String -> Maybe String
number xs = res
  where realNum = filter (`elem` ['0'..'9']) xs
        res
          | realNum =~ "^[2-9][0-9]{2}[2-9][0-9]{2}[0-9]{4}$" = Just realNum
          | realNum =~ "^1[2-9][0-9]{2}[2-9][0-9]{2}[0-9]{4}$" = Just $ drop 1 realNum 
          | otherwise = Nothing
        