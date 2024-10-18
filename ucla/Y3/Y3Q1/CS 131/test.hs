fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n-1)

binom :: Int -> Int -> Int
binom n k = fact n `div` (fact k * fact (n-k))

binomials :: Int -> [Int]
binomials n = [ binom n k | k <- [0..n] ]

pascalsTriangle :: [[Int]]
pascalsTriangle = [binomials n | n <- [0..]]

hasDivisible :: Int -> [[Int]]
hasDivisible n = [x | x <- pascalsTriangle, divisble x n > 0] 
  where divisble x n = length [y | y <- x, y `mod` n == 0]

hasBalancedParens :: [String] -> Bool
hasBalancedParens [] = True
hasBalancedParens xs = bal 0 xs
  where bal op [] = op == 0
        bal op (x:xs)
          | x == "(" = bal (op+1) xs
          | x == ")" = if op == 0 then False else bal (op-1) xs
          | otherwise = bal op xs

data Expr = Multiply Expr Expr | Add Expr Expr | N Integer deriving (Show)
zeroOptimizer :: Expr -> Expr
zeroOptimizer (N x) = N x
zeroOptimizer (Add x y) = Add (zeroOptimizer x) (zeroOptimizer y)
zeroOptimizer (Multiply x y)
  | x == N 0 || y == N 0 = N 0
  | otherwise = Multiply (zeroOptimizer x) (zeroOptimizer y)
