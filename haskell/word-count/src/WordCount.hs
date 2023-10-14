module WordCount (wordCount) where

import Data.Char (isAlphaNum, toLower)
import Data.List (dropWhileEnd)
import Data.Map (Map, fromListWith)

wordCount :: String -> Map String Int
wordCount = fromListWith (+) . wordPairs
    where wordPairs = flip zip (repeat 1) . extractWords

extractWords :: String -> [String]
extractWords = map stripWord . words . map toLowerCaseOrSpace
    where 
        stripWord = dropWhile (not.isAlphaNum) . dropWhileEnd (not.isAlphaNum)
        toLowerCaseOrSpace x = if isAlphaNum x || x == '\'' then toLower x else ' '
