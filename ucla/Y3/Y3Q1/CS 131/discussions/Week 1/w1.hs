import Data.Char(digitToInt)

-- Problem 1
pythagorean :: [(Int, Int, Int)]
pythagorean = [(a, b, c) | c <- [1..], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]

-- Problem 6
numberToInt :: String -> Int
numberToInt a
  | length a == 1 = digitToInt (head a)
  | head a == '-' = -1 * numberToInt (tail a)
  | otherwise = digitToInt (head a) * 10^(length a - 1) + numberToInt (tail a)




