delta(A,B,C,D) :- D is B * B - 4 * A * C.
pierw(A,B,C,X) :- delta(A, B, C, R), R >= 0, X is (-B - sqrt(R)) / (2 * A).
pierw(A,B,C,X) :- delta(A, B, C, R), R > 0, X is (-B + sqrt(R)) / (2 * A).

?- pierw(2, 0, 1, X).
?- pierw(1, 1, -2, X).
?- pierw(1, 4, 4, X).
