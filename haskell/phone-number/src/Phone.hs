module Phone (number) where

number :: String -> Maybe String
number xs = res
  where fillNum = filter (`elem` ['0'..'9']) xs
        numWithoutCountryCode = drop (length fillNum - 10) fillNum
        res
          | correctCountryCode fillNum && correctAreaCode numWithoutCountryCode && correctExchangeCode numWithoutCountryCode = Just numWithoutCountryCode
          | otherwise = Nothing
        
correctCountryCode :: String -> Bool 
correctCountryCode xs
  | length xs == 11 && head xs == '1' = True
  | length xs == 10 = True 
  | otherwise = False

correctAreaCode :: String -> Bool 
correctAreaCode xs = head xs `elem` ['2'..'9']

correctExchangeCode :: String -> Bool 
correctExchangeCode xs = (xs !! 3) `elem` ['2'..'9']
