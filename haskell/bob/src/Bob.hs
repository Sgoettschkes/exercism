module Bob (responseFor) where

import Data.Char (isAlpha, isSpace, isUpper)

responseFor :: String -> String
responseFor x 
    | all isSpace x = "Fine. Be that way!"
    | charsAreUppercase && atLeastOneCharIsUppercase && last x == '?' = "Calm down, I know what I'm doing!"
    | charsAreUppercase && atLeastOneCharIsUppercase = "Whoa, chill out!"
    | last (trim x) == '?' = "Sure."
    | otherwise = "Whatever."
    where charsAreUppercase = all isUpper (filter isAlpha x)
          atLeastOneCharIsUppercase = any isUpper x

trim :: String -> String
trim = f . f
   where f = reverse . dropWhile isSpace
