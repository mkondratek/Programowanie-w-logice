replace(O, R, O, R).
replace(O, _, H, H) :- H \= O.

map([], _, _, []).
map([H|L], A, V, [H2|R]) :-
    subst(H, A, V, H2), map(L, A, V, R).

subst(T, A, V, R) :-
  T =.. [F|Args], replace(A, V, F, F2), map(Args, A, V, Args2), R =.. [F2|Args2].

?- subst(siostra(ala, ola), ala, hermenegilda, W), subst(W, siostra, sister, Z).
?- subst((a+1)*(a+5), a, 2, W), subst(W,*,/,Z).
