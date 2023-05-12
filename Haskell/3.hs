firstFromList = head
secondFromList (x:xs) = head xs
lastFromList = last
secondLastFromList = last . init 

mergeLists :: [[a]] -> [a]
mergeLists [] = []
mergeLists (x:xs) = x ++ mergeLists xs

howManyTimes :: (Eq a) => a -> [a] -> Int
howManyTimes n [] = 0
howManyTimes n (x:xs) = (if n == x then 1 else 0) + howManyTimes n xs

connectOneAfterOne :: [a] -> [a] -> [a]
connectOneAfterOne [] [] = []
connectOneAfterOne (x:xs) (y:ys) = x : y : connectOneAfterOne xs ys

sumPositiveOnList :: [Int] -> Int
sumPositiveOnList [] = 0
sumPositiveOnList (x:xs) = (if x > 0 then 1 else 0) + sumPositiveOnList xs

count :: Num p => (t-> Bool) -> [t] -> p
count t [] = 0
count t (x:xs) = (if t x then 1 else 0) + count t xs

isPalindrome [] = True
isPalindrome [x] = True
isPalindrome x = head x == last x && isPalindrome (init $ tail x)

isPalindrome' x = reverse x == x

-- Oblicz sume i roznice dwoch liczb podanych przez uzytkownika
wczytaj = do
    putStrLn "Podaj pierwsza liczbe"
    a <- getLine
    putStrLn "Podaj druga liczbe"
    b <- getLine
    let x = read a :: Int
    let y = read b :: Int
    putStrLn ("Suma: " ++ show (x + y))
    putStrLn ("Roznica: " ++ show (x - y))
