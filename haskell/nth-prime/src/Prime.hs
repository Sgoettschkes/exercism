module Prime (nth) where

nth :: Int -> Maybe Integer
nth 0 = Nothing 
nth n = Just (primes 1 !! (n - 1))

primes :: Integer -> [Integer]
primes num
  | isPrime num = num : primes (num + 1)
  | otherwise = primes (num + 1)

isPrime :: Integer -> Bool 
isPrime num
  | num <= 1 = False
  | num == 2 = True
  | even num = False
  | otherwise = all (\x -> num `mod` x /= 0) [3,5..num-1]
