module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn Mercury seconds = seconds / yearsToSeconds 0.2408467
ageOn Venus seconds = seconds / yearsToSeconds 0.61519726
ageOn Earth seconds = seconds / yearsToSeconds 1.0
ageOn Mars seconds = seconds / yearsToSeconds 1.8808158
ageOn Jupiter seconds = seconds / yearsToSeconds 11.862615
ageOn Saturn seconds = seconds / yearsToSeconds 29.447498
ageOn Uranus seconds = seconds / yearsToSeconds 84.016846
ageOn Neptune seconds = seconds / yearsToSeconds 164.79132

yearsToSeconds :: Float -> Float
yearsToSeconds y = y * 60 * 60 * 24 * 365.25
