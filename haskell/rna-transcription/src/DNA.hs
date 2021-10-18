module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA y 
  | all (`elem` "ACGT") y = Right $ map dnaRnaMapper y
  | otherwise = Left $ head $ filter (not . (`elem` "ACGT")) y

dnaRnaMapper :: Char -> Char
dnaRnaMapper 'G' = 'C'
dnaRnaMapper 'C' = 'G'
dnaRnaMapper 'T' = 'A'
dnaRnaMapper 'A' = 'U'
dnaRnaMapper _ = error ""
