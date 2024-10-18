-- import GHC.Base (VecElem(Int16ElemRep))
-- -- Problem 1a
-- scale_nums :: [Int] -> Int -> [Int]
-- scale_nums l a = map (\x -> x*a)  l

-- -- Problem 1b - using partial application
-- only_odds :: [[Int]] -> [[Int]]
-- only_odds = filter (\x -> all (\y -> y `mod` 2 == 1) x)

-- -- Problem 1c - using partial application
-- largest :: String -> String -> String
-- largest first second = if length first >= length second then first else second

-- largest_in_list :: [String] -> String
-- largest_in_list = foldl largest ""


-- -- Problem 2a
-- count_if :: (a -> Bool) -> [a] -> Int
-- count_if f [] = 0
-- count_if f (x:xs) = (if f x then 1 else 0) + count_if f xs

-- -- Problem 2b
-- count_if_with_filter :: (a -> Bool) -> [a] -> Int
-- count_if_with_filter f l = length (filter f l)

-- -- Problem 2c
-- count_if_with_fold :: (a -> Bool) -> [a] -> Int
-- count_if_with_fold f l = foldl (\x y -> if f y then x+1 else x) 0 l

-- -- Problem 4
-- f :: p1 -> t1 -> t2 -> p2 -> t1
-- f a b =
--   let c = \a -> a -- (1)
--       d = \c -> b -- (2)
--   in \e f -> c d e

-- -- Problem 7
-- data LinkedList = EmptyList | ListNode Integer LinkedList
--   deriving Show
-- -- part a
-- ll_contains :: LinkedList -> Integer -> Bool
-- ll_contains EmptyList _ = False
-- ll_contains (ListNode x xs) y = if x == y then True else ll_contains xs y
-- -- part b - linked list, position, value to insert, returns new linked list
-- ll_insert :: (Eq LinkedList) => LinkedList -> Integer -> Integer -> LinkedList
-- ll_insert (ListNode x xs) pos y
--   | pos <= 0 = ListNode y (ListNode x xs)
--   | xs == EmptyList = ListNode x (ListNode y EmptyList)
--   | otherwise = ListNode x (ll_insert xs (pos-1) y)

-- -- Problem 8b
-- -- returns the length of the longest consecutive sequence of True values in that list
-- longest_run :: [Bool] -> Int
-- longest_run l = maximum (scanl1 (\x y -> if y==1 then x+1 else 0) (map (\x -> if x then 1 else 0) l))

-- -- Problem 8d
-- data Tree = Empty | Node Integer [Tree]

-- max_tree_value :: Tree -> Integer
-- max_tree_value Empty = 0
-- max_tree_value (Node x []) = x
-- max_tree_value (Node x xs) = maximum (x:(map max_tree_value xs))

-- Problem 9
fibonacciN :: Int -> [Int]
fibonacciN (-1) = []
fibonacciN n = take n (1 : 1 : zipWith (+) (fibonacciN n) (tail (fibonacciN n)))