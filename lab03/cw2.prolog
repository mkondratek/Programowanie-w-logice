collatz1(A) :- A =\= 1, (A mod 2) =:= 0, writeln(A), X is A // 2, collatz1(X).
collatz1(A) :- A =\= 1, (A mod 2) =:= 1, writeln(A), X is 3 * A + 1, collatz1(X).

collatz1(A, N) :- A =:= 1, N is 1.
collatz1(A, N) :- A > 1, (A mod 2) =:= 0, X is A // 2, collatz1(X, N1), N is N1 + 1.
collatz1(A, N) :- A > 1, (A mod 2) =:= 1, X is 3 * A + 1, collatz1(X, N1), N is N1 + 1.

binom(K, K, 1) :- K > 0.
binom(K, 0, 1) :- K > 0.
binom(K, L, X) :- K1 is K - 1, L1 is L - 1, binom(K1, L1, A), binom(K1, L, B), X is A + B.
