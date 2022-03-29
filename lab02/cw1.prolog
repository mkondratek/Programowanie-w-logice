% suma(wektor(X, Y, Z), wektor(A, B, C), W) :- W = wektor(K, L, M), K is X + A, L is Y + B, M is Z + C.
suma(wektor(X, Y, Z), wektor(A, B, C), wektor(K, L, M)) :- K is X + A, L is Y + B, M is Z + C.

?- suma(wektor(1,2,3), wektor(1,3,5), W).

iloczyn_sk(wektor(X, Y, Z), wektor(A, B, C), W) :- W is X * A + B * Y + Z * C.

?- iloczyn_sk(wektor(1,2,3), wektor(1,3,5), W).
