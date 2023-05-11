
--     Zad. 1. 
-- =======
-- Zdefiniować funkcję o nazwie znak, która dla liczby naturalnej n i łańcucha znakowego s poda n-ty znak łańcucha s.
znak :: Int -> [a] -> a
znak n s = s !! (n-1)
-- Zad. 2. 
-- =======
-- Zdefiniować dwie listy o nazwach listaA, listaB; 
-- listaA ma być listą 6 uporządkowanych par łańcuchów znakowych - imion i nazwisk pewnych osób;
listaA = [("Jan", "Kowalski"), ("Adam", "Nowak"), ("Anna", "Kowalska"), ("Maria", "Nowak"), ("Jan", "Nowak"), ("Adam", "Kowalski")]
-- listaB ma składać się z liczb dwucyfrowych o cyfrach dziesiątek 3, 5 lub 7 i cyfrach jedności 3 lub 4.
listaB = [x | x <- [30..79], x `mod` 10 == 3 || x `mod` 10 == 4]
-- a) Zdefiniować listę o nazwie listaA1 składającą się tylko z imion z listy listaA.
listaA1 = [fst x | x <- listaA]
-- b) Zdefiniować listę o nazwie listaA2 składającą się tylko z nazwisk z listy listaA.
listaA2 = [snd x | x <- listaA]
-- c) Zdefiniować listę o nazwie osoby uporządkowanych trójek wszystkich możliwych układów (imie, nazwisko, wiek), gdzie wiek jest z listy listaB.
osoby = [(x, y, z) | x <- listaA1, y <- listaA2, z <- listaB]

-- Zad. 3. 
-- =======
-- Zdefiniować funkcję

-- isPrime :: Int -> Bool		  
-- która daje wartość True, gdy liczba podana jako argument jest liczbą pierwszą, a False w przeciwnym razie.
isPrime :: Int -> Bool
isPrime n = n > 1 && null [x | x <- [2..n-1], n `mod` x == 0]

-- Następnie zdefiniować funkcję 

-- nPrimes :: Int -> [Int]		  
-- która dla argumentu n wyświetla listę n początkowych liczb pierwszych.
-- Na przykład:
-- nPrimes 8
-- daje nam [2,3,5,7,11,13,17,19].
nPrimes :: Int -> [Int]
nPrimes n = take n [x | x <- [2..], isPrime x]

-- Zad. 4.
-- ======
-- Zdefiniować funkcję o nazwie para, która dla dwóch list złożonych 
-- z liczb utworzy parę uprządkowaną, której pierwszy element jest 
-- pierwszym elementem pierwszej listy, zaś drugi - ostatnim elementem drugiej listy. 
-- W przypadku, gdy któraś z list jest pusta w wyniku mamy uzyskać parę (0,0).
para :: [Int] -> [Int] -> (Int, Int)
para [] [] = (0, 0)
para [_] [] = (0, 0)
para [] [_] = (0, 0)
para xs ys = (head xs, last ys)

-- Zad. 5.
-- =======
-- Zdefiniować funkcję o nazwie sign, która dla  liczby  dodatniej ma wartość 1, 
-- dla liczby ujemnej ma wartość -1, a dla liczby 0 ma wartość 0. 
-- a) Zastosować instrukcję if ... else ...
sign :: Int -> Int
sign a = if a > 0 then 1 else if a == 0 then 0 else -1
-- b) Zastosować strażników (guards).
signG :: Int -> Int
signG a | a > 0 = 1
        | a == 0 = 0
        | otherwise = -1

-- Zad. 6.
-- =======
-- Zdefiniować funkcję, która oblicza pole powierzchni siatki prostopadłościanu o 
-- krawędziach o długościach, x, y, z, obliczjąc w pośrednich krokach pole podstawy i pola ścian bocznych.
-- a) Zastosować konstrukcję  where.
prostoW :: Int -> Int -> Int -> Int
prostoW x y z = 2 * pp + 2 * pb1 + 2 * pb2
    where pp = x * y
          pb1 = x * z
          pb2 = y * z
-- b) Zastosować konstrukcję let ... in ...
prostoL :: Int -> Int -> Int -> Int 
prostoL x y z =
        let pp = x * y
            pb1 = x * z
            pb2 = y * z
        in 2 * pp + 2 * pb1 + 2 * pb2



