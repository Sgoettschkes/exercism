module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor _ [] = []
anagramsFor "" _ = []
anagramsFor letters wordList = filter (`isAnagram` letters) wordList

isAnagram :: String -> String -> Bool 
isAnagram l w = lLower /= wLower && lSort == wSort
  where 
    lLower = map toLower l
    wLower = map toLower w
    lSort = sort lLower
    wSort = sort wLower
