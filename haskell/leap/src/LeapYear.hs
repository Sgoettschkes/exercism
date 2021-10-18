module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = yearModBy 400 || (yearNotModBy 100 && yearModBy 4)
    where yearModBy i = year `mod` i == 0
          yearNotModBy = not . yearModBy
