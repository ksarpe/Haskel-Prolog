-- problem1
myLast :: [a] -> a
myLast [x] = x
myLast (_:xs) = myLast xs

--problem2
myButLast :: [a] -> a
myButLast [x, _] = x
myButLast (_:xs) = myButLast xs
--myButLast' x = reverse x !! 1 --alternative

--problem3
elementAt :: [a] -> Int -> a
elementAt (x:_) 1 = x
elementAt (_:xs) n = elementAt xs (n-1)

--problem4
myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

--problem5
myReverse = reverse

--problem6
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = True
isPalindrome [a] = True
isPalindrome xs = head xs == last xs && isPalindrome (init $ tail xs)

--problem7
flatten :: [[a]] -> [a]
flatten [] = []
flatten (x:xs) = x ++ flatten xs

--problem8
compress :: (Eq a) => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:xs) = if x == head xs then compress xs else x : compress xs

--problem10
encode :: (Eq a) => [a] -> [(Int, a)]
encode [] = []
encode (x:xs) = (length $ x : takeWhile (==x) xs, x) : encode (dropWhile (==x) xs)



