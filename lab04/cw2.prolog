lacz_listy([], X, X).
lacz_listy([H|T], X, [H|Z]) :- lacz_listy(T, X, Z).

?-lacz_listy([1,2,3], [4,5,6], C).
  C = [1,2,3,4,5,6].
?-lacz_listy([1,2,3], C, [1,2,3,4,5]).
  C = [4,5].


ostatni_element([_|T], X) :- ostatni_element(T, X).
ostatni_element([X|[]], X).

?- ostatni_element([a,b,c], B).
  B = c.
?- ostatni_element([], B).
    false.
?- ostatni_element([a,b,X], c).
    X=c.


prefiks([], _).
prefiks([H|T], [H|T1]) :- prefiks(T, T1).

?- prefiks([a,b], [a,b,c]).
  true.
?- prefiks([a,c], [a,b,c]).
  false.
?- prefiks(X, [a,b]).
   X=[];
   X=[a];
   X=[a,b].


podlista(X, Y) :- prefiks(X, Y).
podlista(X, [_|T]) :- prefiks(X, T).

?- podlista([b, c], [a,b,c,d]).
   true.
?- podlista([a, c], [a,b,c,d]).
   false.
?- podlista([X,Y], [a,b,c]).
   X=a, Y=b;
   X=b, Y=c.


sortuj([X], [X]).
sortuj([H|T], [H,H1|T1]) :- sortuj(T, [H1|T1]), H @=< H1.
sortuj([H|T], [H1,H|T1]) :- sortuj(T, [H1|T1]), H @> H1.

?- sortuj([2, 3, 1], [1, 2, 3]).
   true.

?- sortuj([2, 3, 1], A).
   A = [1,2,3]


podlista2([], _).
podlista2([H|A], [H|B]) :- podlista2(A, B).
podlista2([H|A], [_|B]) :- podlista2([H|A], B).

?- podlista2([1,2,3,2], [1,a,b,2,c,c,3,c,c,2]).
   true.

?- podlista2([1,2,3,2], [1,a,b,2,2,c,c,3,c,c]).
   false.

?- podlista2([1,2,2,3], [a,b,2,2,c,c,3,c,c,1]).
   false.


permutacja([], []).
permutacja(A,[H|B]) :- usun(H, A, C), permutacja(C, B).

usun(X, [X|T], T).
usun(X, [H|T], [H|T1]) :- usun(X, T, T1).

permutacja([1,2,3], B).


usun_element(X, [X|T], T). % usun pierwsze wystapienie elementu
usun_element(X, [H|T], [H|T1]) :- X \= H, usun_element(X, T, T1).


usun_duplikaty([X], [X]).
usun_duplikaty(L1, L2) :- sortuj(L1, [H,H|S]), usun_duplikaty([H|S], L2).
usun_duplikaty(L1, L2) :- sortuj(L1, [H,H1|S]), H \= H1, usun_duplikaty([H1|S], L3), L2 = [H|L3].

?- usun_duplikaty([a,b,c,a,a,b,c], L).
   L=[a,b,c].   % Kolejność nie jest istotna
