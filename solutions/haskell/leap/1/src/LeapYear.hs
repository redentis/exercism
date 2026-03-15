module LeapYear (isLeapYear) where

type Year = Int

isLeapYear :: Year -> Bool
isLeapYear y = 
  divisibleBy 4 && not (divisibleBy 100) || divisibleBy 400
  where
    divisibleBy n = mod y n == 0