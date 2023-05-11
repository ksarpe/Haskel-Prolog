-- Zad. 1.
-- =======
-- Zdefiniować funkcję o nazwie witaj, która wywołana z argumentem typu 
-- String wydrukuje na ekranie tekst powitania z użyciem tego łańcucha
witaj :: String -> String
witaj s = "Witaj " ++ s ++ "!"


-- Zad. 2.
-- =======
-- Zdefiniować funkcję o nazwie objetosc, która oblicza objetość prostopadłościanu o bokach o długościach x, y, z.
objetosc :: Double -> Double -> Double -> Double
objetosc x y z = x * y * z

-- Zad. 3.
-- =======
-- a) Zdefiniować funkcję o nazwie podwajam, która liczbę podaną jako argument mnoży przez 2.	 
podwajam :: Integer -> Integer
podwajam x = 2 * x

-- b) Zdefiniować listę o nazwie liczby, której elementy to: 11, 12, 13, ..., 99.
liczby = [11..99]

-- c) Zastosować funkcje map i podwajam w celu uzyskania listy dwukrotności liczb z listy liczby.
-- map podwajam liczby

-- d) Zdefiniować funkcję o nazwie mod13, która z podanej listy liczb wyświetli liczby podzielne przez 13. Zastosować tę funkcję dla listy liczby.
mod13 :: Integral a => [a] -> [a]
mod13 xs = [a | a <- xs, a `mod` 13 == 0]

-- Zad. 4.
-- =======
-- Zdefiniować funkcję o nazwie inicjaly, która przy podaniu 
--imienia i nazwiska (dwa łańcuchy znakowe) wyświetli inicjały osoby 
--(z kropkami po pierwszych literach imienia i nzawiska), np.
inicjaly :: String -> String -> String
inicjaly a b = [head a] ++ "." ++ [head b] ++ "." 

-- Zad. 5.
-- =======
-- Zdefiniować funkcję o nazwie unitaryN, która zbuduje macierz jednostkową 
-- podanego stopnia. Przykładowo, jeśli zastosujemy
-- unitaryN 5
-- uzyskamy na ekranie
-- [[1,0,0,0,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1]]
unitaryN :: Int -> [[Int]]
unitaryN n = [[if x == y then 1 else 0 | x <- [1..n]] | y <- [1..n]]

-- Zad. 6.
-- =======
-- Zdefiniować listę liczb trzycyfrowych podzielnych przez 3 o 
-- różnych cyfrach (są to m.in. liczby 102, 105, 459, 987).
lista3 = [x | x <- [100..999], x `mod` 3 == 0]

-- Zad. 7.
-- =======
-- Zdefiniować funkcję, która wypisuje z podanego łańcucha znakowego:
-- a) tylko małe litery;
smallLetters :: String -> String
smallLetters s = [x | x <- s, x `elem` ['a'..'z']]

-- b) tylko wielkie litery;
capitalLetters :: String -> String
capitalLetters s = [x | x <- s, x `elem` ['A'..'Z']]

-- c) wszystkie znaki, które nie są cyframi.
digits :: String -> String
digits s = [x | x <- s, x `elem` ['0'..'9']]