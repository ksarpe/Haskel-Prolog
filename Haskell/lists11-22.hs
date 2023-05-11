--problem14
dupli :: [a] -> [a]
dupli [] = []
dupli (x:xs) = x:x:dupli xs

--problem17
split :: [a] -> Int -> ([a], [a])
split xs n = splitAt n xs

--problem 20
removeAt :: Int -> [a] -> [a]
removeAt n xs = take (n-1) xs ++ drop n xs --drop x xs itself will drop everything before

--problem22
range :: Int -> Int -> [Int]
range x y = [x..y]


