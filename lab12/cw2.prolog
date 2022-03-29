expr(N) :- integer(N).
expr(X) :- variable(X).
expr(X+Y) :- expr(X), expr(Y).
expr(X-Y) :- expr(X), expr(Y).
expr(X*Y) :- expr(X), expr(Y).
expr(X/Y) :- expr(X), expr(Y).
expr(X^Y) :- expr(X), expr(Y).
expr(exp(X)) :- expr(X).
expr(sin(X)) :- expr(X).
expr(cos(X)) :- expr(X).
expr(tan(X)) :- expr(X).
expr(ln(X)) :- expr(X).

variable(x).
variable(y).

d(X,X,1).
d(Y,X,0) :- variable(Y), X\=Y.
d(N,_X,0) :- integer(N).
d(-W, X, -DW) :- d(W,X,DW).
d(W+U,X,DW+DU) :- d(W,X,DW), d(U,X,DU).
d(W-U,X,DW-DU) :- d(W,X,DW), d(U,X,DU).
d(W*U,X,DW*U+W*DU) :- d(W,X,DW), d(U,X,DU).
d(W/U,X,(DW*U-W*DU)/(U*U)) :- d(W,X,DW), d(U,X,DU).
d(W^U,X,(W*DU*ln(W)+DW*U)*W^(U-1)) :- d(W,X,DW), d(U,X,DU).
d(exp(W),X,DW*exp(W)) :- d(W,X,DW).
d(sin(W),X,DW*cos(W)) :- d(W,X,DW).
d(cos(W),X,-DW*sin(W)) :- d(W,X,DW).
d(tan(W),X,R) :- d(sin(W)/cos(W),X,R).
d(ln(W),X,DW/W) :- d(W,X,DW).

simp(-(-A), R) :-
    writeln('-(-A)'),
    simp(A, R).
simp(-(A), 0) :-
    writeln('-0'),
    simp(A, 0).
simp(-A, R) :-
    writeln('-A_0'),
    \+ simp(A, 0), \+ simp(A, A), simp(A, A2), simp(-(A2), R).
simp(-A, -A) :-
    writeln('-A_1'),
    \+ simp(A, 0), simp(A, A).

simp(A+B, R) :-
    writeln('A+0'),
    simp(B, 0), \+ simp(A, 0), simp(A, R).
simp(A+B, 0) :-
    writeln('0+0'),
    simp(A, 0), simp(B, 0).
simp(A+B, R) :-
    writeln('0+B'),
    simp(A, 0), \+ simp(B, 0), simp(B, R).
simp(A+B, 0) :-
    writeln('A+(-A)'),
    \+ simp(A, 0), \+ simp(B, 0), simp(-(A), X), simp(B, X).
simp(A+B, R) :-
    writeln('A+B_0'),
    \+ simp(A, 0), \+ simp(B, 0), \+ (simp(A, 0); simp(B, 0)), \+ (simp(-(A), X), simp(B, X)), \+ (simp(A, A), simp(B, B)), simp(A, A2), simp(B, B2), simp(A2+B2, R).
simp(A+B, A+B) :-
    writeln('A+B_1'),
    \+ (number(A), number(B)),
    \+ simp(A, 0), \+ simp(B, 0), \+ (simp(A, 0); simp(B, 0)), \+ (simp(-(A), X), simp(B, X)), (simp(A, A), simp(B, B)).
simp(A+B, R) :-
    writeln('a+b'),
    \+ (simp(A, 0); simp(B, 0); simp(-(A), X), simp(B, X)),
    number(A), number(B),
    R is A+B.

simp(A-B, 0) :-
    writeln('0-0'),
    simp(A, 0), simp(B, 0).
simp(A-B, R) :-
    writeln('A-0'),
    \+ simp(A, 0), simp(B, 0), simp(A, R).
simp(A-B, -R) :-
    writeln('0-B'),
    simp(A, 0), \+ simp(B, 0), simp(B, R).
simp(A-B, 0) :-
    writeln('A-A'),
    \+ simp(A, 0), \+ simp(B, 0), simp(A, X), simp(B, X).
simp(A-B, R) :-
    writeln('A-B_0'),
    \+ simp(A, 0), \+ simp(B, 0), \+ (simp(A, X), simp(B, X)), \+ (simp(A, A), simp(B, B)), simp(A, A2), simp(B, B2), simp(A2-B2, R).
simp(A-B, A-B) :-
    writeln('A-B_1'),
    \+ (number(A), number(B)),
    \+ simp(A, 0), \+ simp(B, 0), \+ (simp(A, X), simp(B, X)), simp(A, A), simp(B, B).
simp(A-B, R) :-
    writeln('a-b'),
    \+ (simp(A, 0); simp(B, 0); simp(A, X), simp(B, X)),
    number(A), number(B),
    R is A-B.

simp(A*B, 0) :-
    writeln('0*0'),
    simp(A, 0), simp(B, 0).
simp(A*B, 0) :-
    writeln('A*0'),
    \+ simp(A, 0), simp(B, 0).
simp(A*B, 0) :-
    writeln('0*B'),
    simp(A, 0), \+ simp(B, 0).
simp(A*B, 1) :-
    writeln('1*1'),
    simp(B, 1), simp(A, 1).
simp(A*B, R) :-
    writeln('1*B'),
    \+ simp(B, 0), \+ simp(B, 1), simp(A, 1), simp(B, R).
simp(A*B, R) :-
    writeln('A*1'),
    \+ simp(A, 0), \+ simp(A, 1), simp(B, 1), simp(A, R).
simp(A*B, R) :-
    writeln('A*B_0'),
    \+ simp(A, 0), \+ simp(B, 0), \+ (simp(A, 1); simp(B, 1)), \+ (simp(A, A), simp(B, B)), simp(A, A2), simp(B, B2), simp(A2*B2, R).
simp(A*B, A*B) :-
    writeln('A*B_1'),
    \+ (number(A), number(B)),
    \+ simp(A, 0), \+ simp(B, 0), \+ (simp(A, 1); simp(B, 1)), (simp(A, A), simp(B, B)).
simp(A*B, R) :-
    writeln('a*b'),
    \+ (simp(A, 0); simp(B, 0); simp(B, 1); simp(A, 1); simp(A, X), simp(B, X)),
    number(A), number(B),
    R is A*B.

simp(A/B, 0) :-
    writeln('0/B'),
    simp(A, 0), \+ simp(B, 0).
simp(A/B, R) :-
    writeln('A/1'),
    \+ simp(A, 0), simp(B, 1), simp(A, R).
simp(A/B, R) :-
    writeln('A/B_0'),
    \+ simp(A, 0), \+ simp(B, 1), \+ (simp(A, A), simp(B, B)), simp(A, A2), simp(B, B2), simp(A2/B2, R).
simp(A/B, A/B) :-
    writeln('A/B_1'),
    \+ (number(A), number(B)),
    \+ simp(A, 0), \+ simp(B, 1), (simp(A, A), simp(B, B)).
simp(A/B, R) :-
    writeln('a/b'),
    \+ (simp(A, 0); simp(B, 1)),
    number(A), number(B),
    R is A/B.

simp(A^B, 0^0) :-
    writeln('0^0'),
    simp(A, 0), simp(B, 0).
simp(A^B, 0) :-
    writeln('0^B'),
    simp(A, 0), \+ simp(B, 0).
simp(A^B, 1) :-
    writeln('A^0'),
    \+ simp(A, 0), \+ simp(A, 1), simp(B, 0).
simp(A^B, 1) :-
    writeln('1^B'),
    simp(A, 1), \+ simp(B, 0).
simp(A^B, R) :-
    writeln('A^1'),
    \+ simp(A, 0), simp(B, 1), simp(A, R).
simp(A^B, R) :-
    writeln('A^B_0'),
    \+ simp(A, 0), \+ simp(B, 0), \+ simp(A, 1), \+ simp(B, 1), \+ (simp(A, A), simp(B, B)), simp(A, A1), simp(B, B1), simp(A1^B1, R).
simp(A^B, A^B) :-
    writeln('A^B_1'),
    \+ (number(A), number(B)),
    \+ simp(A, 0), \+ simp(B, 0), \+ simp(A, 1), \+ simp(B, 1), simp(A, A), simp(B, B).
simp(A^B, R) :-
    writeln('a^b'),
    \+ (simp(A, 0); simp(B, 0); simp(A, 1); simp(B, 1)),
    number(A), number(B),
    R is A^B.

simp(exp(A), exp(A1)) :- 
    writeln('exp'), 
    simp(A, A1).
simp(sin(A), sin(A1)) :- 
    writeln('sin'), 
    simp(A, A1).
simp(cos(A), cos(A1)) :- 
    writeln('cos'), 
    simp(A, A1).
simp(tan(A), tan(A1)) :- 
    writeln('tan'), 
    simp(A, A1).
simp(ln(A), ln(A1)) :- 
    writeln('ln'), 
    simp(A, A1).

simp(A, A) :-
    writeln('A'),
    (integer(A); variable(A)).
