module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts x
   | all (`elem` "ACGT") x = Right (nucleotideCount (map nucleotideMap x))
   | otherwise = Left "error"

nucleotideMap :: Char -> Nucleotide
nucleotideMap 'A' = A
nucleotideMap 'C' = C
nucleotideMap 'G' = G
nucleotideMap 'T' = T
nucleotideMap _ = error "Wrong"

nucleotideCount :: [Nucleotide] -> Map Nucleotide Int
nucleotideCount m = fromList [(A, count A m), (C, count C m), (G, count G m), (T, count T m)]

count :: Nucleotide -> [Nucleotide] -> Int
count needle haystack = length (filter (== needle) haystack) 
