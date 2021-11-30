module Acronym (abbreviate) where

import Data.Char (toUpper, isUpper, isLower)

abbreviate :: String -> String
abbreviate xs = map (toUpper . head) $ words $ addWhitespaceOnPunctiation $ addWhitespaceOnUppercase $ filter (`elem` wordList) xs

wordList :: [Char]
wordList = ['a'..'z'] ++ ['A'..'Z'] ++ [' ', '-']

addWhitespaceOnUppercase :: String -> String 
addWhitespaceOnUppercase "" = ""
addWhitespaceOnUppercase (s':s'':s''') = if isUpper s' && isLower s'' then
                                            (" " ++ [s']) ++ addWhitespaceOnUppercase (s'':s''')
                                          else
                                            s' : addWhitespaceOnUppercase (s'':s''')
addWhitespaceOnUppercase (s':s'') = if isUpper s' then
                                (" " ++ [s']) ++ addWhitespaceOnUppercase s''
                              else
                                s':addWhitespaceOnUppercase s''

addWhitespaceOnPunctiation :: String -> String 
addWhitespaceOnPunctiation "" = ""
addWhitespaceOnPunctiation (s':s'') = if s' == '-' then
                                        " " ++ addWhitespaceOnPunctiation s''
                                      else
                                        s' : addWhitespaceOnPunctiation s''
