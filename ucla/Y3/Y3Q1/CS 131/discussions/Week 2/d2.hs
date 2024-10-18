-- Problem 1 - compress using foldr
compress :: Eq a => [a] -> [a]  -- requires me to use Eq type constraint
compress [] = []
compress [x] = [x]
compress (x:xs) = foldr (\x acc -> if x == head acc then acc else x:acc) [x] tail xs

-- Problem 2: rev iin O(n) time
rev :: [a]->[a]
rev [] = []
rev [x] = [x]