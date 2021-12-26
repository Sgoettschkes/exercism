module CryptoSquare (encode) where
  
import Data.Char (toLower)

encode :: String -> String
encode message = unwords (chunksOf r encodedMessage)
  where normalizedMessage = normalize message
        strLen = length normalizedMessage
        c = calcC strLen
        r = calcR strLen c
        paddedMessage = padMessage normalizedMessage ((c - strLen) `mod` c)
        encodedMessage = concatMap (\row -> getFirstRow (drop row paddedMessage) (c-1)) [0..(c-1)]

normalize :: String -> String 
normalize = map toLower . filter (`elem` charList)

charList :: [Char]
charList = ['a'..'z'] ++ ['A'..'Z'] ++ ['0'..'9']

calcC :: Int -> Int 
calcC strLen = ceiling (sqrt (fromIntegral strLen))

calcR :: Int -> Int -> Int
calcR strLen c = ceiling (fromIntegral strLen / fromIntegral c)

padMessage :: String -> Int -> String 
padMessage str 0 = str
padMessage str x = str ++ replicate x ' '

getFirstRow :: String -> Int -> String
getFirstRow "" _c = ""
getFirstRow (x:xs) c = x : getFirstRow (drop c xs) c

chunksOf :: Int -> String -> [String]
chunksOf _x "" = []
chunksOf x remStr = take x remStr : chunksOf x (drop x remStr)
