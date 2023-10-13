module Prime (nth) where

nth :: Int -> Maybe Integer
nth 0 = Nothing 
nth n = Just $ primes !! (n - 1)

primes :: [Integer]
primes = sieve [2..]
    where
        sieve [] = []
        sieve (p:ps) = p : sieve [x | x <- ps, mod x p /= 0]
