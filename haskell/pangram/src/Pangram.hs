module Pangram (isPangram) where

import qualified Data.List
import qualified Data.Char 

isPangram :: String -> Bool
isPangram text = Data.List.null (['a' .. 'z'] Data.List.\\ map Data.Char.toLower text)
