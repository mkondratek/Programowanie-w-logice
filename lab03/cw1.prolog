krawedz(a,b).
krawedz(b,c).
krawedz(b,d).
krawedz(c,e).
krawedz(c,f).
krawedz(f,e).

sciezka(A, B) :- krawedz(A, B); krawedz(A, C), sciezka(C, B).

?- sciezka(b, f).
?- sciezka(b, Z).
?- sciezka(X, d).

?- sciezka(a, d),sciezka(d, f).
?- krawedz(A, B), krawedz(B ,C), krawedz(C, f).
?- sciezka(A, B), krawedz(B, A).

sciezka_dl(X,Y,N) :- N=1, krawedz(X,Y).
sciezka_dl(X,Y,N) :- N>1, N1 is N - 1, krawedz(X,Z), sciezka_dl(Z,Y,N1).

dl_sciezka(X,Y,N) :- krawedz(X,Y), N is 1.
dl_sciezka(X,Y,N) :- krawedz(X,Z), A is dl_sciezka(Z,Y,N1), N is A + 1.
