-- Problem 1
-- Part a
data LinkedList = EmptyList | ListNode Integer LinkedList
  deriving Show

ll_contains :: LinkedList -> Integer -> Bool
ll_contains EmptyList _ = False
ll_contains (ListNode x xs) y
    | x == y = True
    | otherwise = ll_contains xs y
-- Part b
ll_insert :: (Eq LinkedList) => LinkedList -> Integer -> Integer -> LinkedList
ll_insert (ListNode x xs) pos y
  | pos <= 0 = ListNode y (ListNode x xs)
  | xs == EmptyList = ListNode x (ListNode y EmptyList)
  | otherwise = ListNode x (ll_insert xs (pos-1) y)

-- Problem 2
