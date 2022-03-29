graj(_, K) :- K =< 0.
graj(L, K) :-
    K > 0,
    [X|_] = L, 
    write('Wybierz wartość z '), 
    write(L),
    write(' by zsumować do '),
    write(K),
    write('.'),
    read(A),
    graj_dalej(L, K, A, X).

graj_dalej(L, K, A, X) :- 
    wygrywa(L, K, A), 
    write('0 Computer picks '), 
    write(X),
    writeln('.'),
    K1 is K - A - X,
    graj(L, K1).

graj_dalej(L, K, A, _) :- 
    wygrywa(L, K - A, B), 
    write('1 Computer picks '), 
    write(B),
    writeln('.'),
    K1 is K - A - B,
    graj(L, K1).


wygrywa(L, K, X) :- member(X, L), X >= K.
wygrywa(L, K, X) :-
    member(X, L),
    not(wygrywa(L, K - X, _)).
