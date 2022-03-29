liczba(0).
liczba(s(X)) :- liczba(X).

mniejszy(X, X) :- false.
mniejszy(0, s(_)) :- true.
mniejszy(s(X), s(Y)) :- mniejszy(X, Y).

dodaj(0, Y, Y).
dodaj(s(X), Y, s(Z)) :- dodaj(X, Y, Z).

mnoz(0, _, 0).
mnoz(s(0), Y, Y).
mnoz(s(X), Y, Z) :- mnoz(X, Y, Z1), dodaj(Y, Z1, Z).
