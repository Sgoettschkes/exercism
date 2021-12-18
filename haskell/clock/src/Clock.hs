module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock 
  { clockHour :: Int
  , clockMinute :: Int
  }
  deriving Eq

fromHourMin :: Int -> Int -> Clock
fromHourMin hours minutes = Clock ((hours + minutes `div` 60) `mod` 24) (minutes `mod` 60)

toString :: Clock -> String
toString clock = toTimeString (clockHour clock) ++ ":" ++ toTimeString (clockMinute clock)

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minutes clock = fromHourMin (hour + clockHour clock) (minutes + clockMinute clock)

toTimeString :: Int -> String 
toTimeString time
  | time < 10 = "0" ++ show time
  | otherwise = show time
