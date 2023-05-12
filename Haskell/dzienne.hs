razy5 [] = []
razy5 x = map (*5) x

razy5' [] = []
razy5' (x:xs) = x*5 : razy5' xs

b n | n `mod` 3 == 0 = 3
    | otherwise = 4*(n + 1) * 2

b' n = if n `mod` 3 == 0 then 3 else 4*(n+1)*2

-- function to take n elements from
func n = [b x | x <- [1..n]]

wczytaj = do
    x <- getLine
    y <- getLine
    z <- getLine
    return (if x > y && x > z then x else if y > z && y >x then y else z)

usunPuste [] = []
usunPuste (x:xs) = if null x then usunPuste xs else x : usunPuste xs