wiekszy(X, Y, X) :- X > Y.
wiekszy(X, Y, Y) :- X < Y.

?- wiekszy(2, 3, X).
?- wiekszy(5, 3, X).
?- wiekszy(5,5, X).

modul(X, Y) :- X < 0, Y is -X.
modul(X, Y) :- X > 0, Y is X.

?- modul(-2,X).

suma(0, 0).
suma(N, X) :- N > 0, N1 is N - 1, suma(N1, Y), X is Y + N.

?- suma(3, S).
