
-- Problem 1
largest :: String -> String -> String
largest a b = c where
    c = if (length a) >= (length b) then a else b

-- Problem 2

-- Problem 3: TODO
-- a
all_factors :: Int -> [Int]
all_factors n = [x | x <- [1..n], n `mod` x == 0]
-- b
perfect_numbers :: [Int]
perfect_numbers = [x | x <- [1..], sum (all_factors x) - x == x]

--Problem 4: even and odd only using addition and subtraction
-- using if statements
-- is_odd :: Int -> Bool
-- is_odd n = if n == 0 then False else is_even (n-1)
-- is_even :: Int -> Bool
-- is_even n = if n == 0 then True else is_odd (n-1)
-- using guards
-- is_odd :: Int -> Bool
-- is_odd n
--     | n == 0 = False
--     | n /= 0 = is_even (n-1)
-- is_even :: Int -> Bool
-- is_even n
--     | n == 0 = True
--     | n /= 0 = is_odd (n-1)
-- using pattern matching
is_odd :: Int -> Bool
is_odd 0 = False
is_odd n = is_even (n-1)
is_even :: Int -> Bool
is_even 0 = True
is_even n = is_odd (n-1)


