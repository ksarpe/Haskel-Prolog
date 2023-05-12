firma(abc).
firma(klm).
firma(mno).

kobieta(anna).
kobieta(maria).
kobieta(julia).
kobieta(ewa).
kobieta(joanna).
kobieta(lena).
kobieta(teresa).

mezczyzna(jan).
mezczyzna(karol).
mezczyzna(piotr).
mezczyzna(tomasz).
mezczyzna(lukasz).
mezczyzna(marek).
mezczyzna(jozef).

% pracownik(imie, nazwisko, firma, staz_pracy).

pracownik(anna, klimczak, firma(abc), 10).
pracownik(anna, maj, firma(abc), 1).
pracownik(maria, jankowska, firma(abc), 12).
pracownik(julia, klimczak,  firma(abc), 4).
pracownik(jan, kowal, firma(abc), 21).
pracownik(karol, lis, firma(abc), 5).
pracownik(anna, lis, firma(klm), 12).
pracownik(piotr, bednarek, firma(klm), 8).
pracownik(tomasz, bednarek, firma(klm), 2).
pracownik(ewa, wilk, firma(klm), 3).
pracownik(ewa, lipiec,firma(klm), 7).
pracownik(lukasz, polak,  firma(klm), 11).
pracownik(marek, doba, firma(klm), 8).
pracownik(anna, just, firma(mno), 22).
pracownik(joanna, wilk, firma(mno), 16).
pracownik(piotr, czekaj, firma(mno), 4).
pracownik(maria, wilczak, firma(mno), 16).
pracownik(piotr, kawa, firma(mno), 14).
pracownik(marek, czubak, firma(mno), 5).
pracownik(marek, lis, firma(mno), 4).


% 3) Stosując odpowiednie reguły zdefiniować:

% a) predykat pracownik_abc(X,Y), który jest spełniony, 
% gdy osoba o imieniu X i nazwisku Y jest pracownikiem firmy abc;
pracownik_abc(X,Y) :- pracownik(X,Y,firma(abc), _).

% b) predykat pracInne(X,Y), który jest spełniony, 
% gdy osoba o imieniu X i nazwisku Y jest pracownikiem firmy innej niż abc;
pracInne(X,Y) :- pracownik(X,Y,firma(Z), _), Z \= abc.

% c) predykat pracKobieta(X,Y), który jest spełniony, 
% gdy osoba o imieniu X i nazwisku Y jest pracownikiem - kobietą.
pracKobieta(X,Y) :- pracownik(X,Y,_,_), kobieta(X).

% d) predykat dlugoletniPrac(X,Y,Z), który jest spełniony, 
% gdy osoba o imieniu X i nazwisku Y pracuje w firmie Z i ma staż pracy co najmniej 10 lat;
dlugoletniPrac(X,Y,Z) :- pracownik(X,Y,firma(Z), A), A >= 10.

% e) predykat premia(X,Y,B), który jest spełniony, 
% gdy pracownikowi o imieniu X i nazwisku Y przysługuje premia o wartości B; premia dla pracownika wynosi 150 PLN za każdy rok pracy.
premia(X,Y,B) :- pracownik(X,Y,_,A), B is A * 150.

% 1) Zdefiniować predykat max2(X,Y,Z), który jest spełniony, gdy liczba Z jest równa maksimum liczb X, Y.
max2(X, Y, Z) :- X > Y, Z is X.
max2(X, Y, Z) :- X =< Y, Z is Y.
% 2) Zdefiniować predykat isList(X), który jest spełniony, gdy X jest listą.
isList([]).
isList([_|X]) :- isList(X).

% 3) Zdefiniować predykat isMember(X,L), który jest spełniony, gdy X jest elementem listy L.
isMember(X,[X|_]) :- !.
isMember(X,[_|Xs]) :- isMember(X,Xs).

% 4) Zdefiniować predykat myLast(X,L), który jest spełniony, gdy X jest ostatnim elementem listy L.
myLast(X,[X]) :- !.
myLast(X,[_|T]) :- myLast(X,T).

% 5) Zdefiniować predykat multiply(L1,L2,L), który jest spełniony, 
% gdy lista L składa się z iloczynów odpowiednich (na tych samych pozycjach) elementów list L1, L2.
multiply([],[],[]).
multiply([X|Xs], [Y|Ys], [W|Ws]) :- W is X*Y, multiply(Xs, Ys, Ws). 

% 6) Zdefiniować predykat suma(L,S), który jest spełniony, gdy S jest sumą liczb z listy L.
suma([],0).
suma([X|Xs], S) :- suma(Xs, S1), S is X + S1.

% 7) Zdefiniować predykat myLength(L,N), który jest spełniony, gdy N jest długością listy L.
myLength([],0).
myLength([_|Xs],N) :- myLength(Xs, N1), N is 1 + N1.

% 1) Zdefiniować predykat element_at (X, L, K), który jest prawdziwy, gdy X jest K-tym elementem listy L.

element_at(X,[X|_],1) :- !.
element_at(X,[_|Xs],K) :- K>1, K1 is K - 1, element_at(X,Xs,K1).


% 2) Zdefiniować predykat dupli(L1, L2), który jest spełniony, %
% gdy lista L2 jest uzyskana z L1 przez zduplikowanie wszystkich elementów, np. L1 = [1,4,5,1], L2 = [1,1,4,4,5,5,1,1].
dupli([],[]) :- !.
dupli([X|Xs],[X,X|Ys]) :- dupli(Xs,Ys).

% 3) Zdefiniować predykat my_reverse (L1, L2), który jest prawdziwy, 
% gdy L2 jest listą otrzymaną z L1 przez odwrócenie kolejności elementów.
my_reverse2([],[]).
my_reverse2([X|Xs],Ys) :- my_reverse2(Xs, Ys1), append(Ys1, [X], Ys).

my_reverse(L1,L2) :- reverse(L1,L2).

% 4) Zdefiniować predykatu end(X, L1, L2), który jest prawdziwy, 
% gdy L2 jest listą otrzymaną z listy L1 przez dodanie elementu X na końcu L1.
end(X,[],[X]).
end(X,[L1|L],L2) :- end(X,L,L3), append([L1],L3,L2).


% 5) Zdefiniować predykat remove_at(X, L, K, R),  który jest spełniony, 
% gdy X jest K-tym elementem listy L, a R jest listą, która pozostaje, gdy  K-ty element zostanie usunięty z L.
remove_at(X, [X|Xs], 1, Xs) :- !.
remove_at(X,[L|Ls],K,[L|Rs]) :- K>1, K1 is K-1, remove_at(X,Ls,K1,Rs).


% 6) Zdefiniować predykat take(L1, N, L2),  który jest spełniony, 
% gdy lista L2 składa się z N początkowych elementów listy L1.
take(_,0,[]) :- !.
take([X|Xs],N,[X|Ys]) :- N>0, N1 is N-1, take(Xs,N1,Ys).


% 7) Zdefiniować predykat my_flatten(L1, L2), który jest prawdziwy, 
% gdy lista L2 jest uzyskiwana z listy L1 przez spłaszczenie, 
% tzn. jeśli element listy L1 jest podlistą, to jest rekursywnie zastępowany przez jego elementy. Przykład: L1 = [a, b, [c, d, [e, f]]], L2 = [a, b, c, d, e, f].
my_flatten([],[]) :- !.
my_flatten([X|Xs],Ys) :- isList(X), my_flatten(X,Ys1), my_flatten(Xs,Ys2), append(Ys1,Ys2,Ys), !.
my_flatten([X|Xs],[X|Ys]) :- my_flatten(Xs,Ys).