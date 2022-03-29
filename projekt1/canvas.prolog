row(1, [' ']).
row(W, R) :-
    W > 1,
    W2 is W - 1,
    row(W2, R2),
    R = [' '|R2].

canvas(W, 1, S) :-
    row(W, R),
    S = [R].
canvas(W, H, S) :-
    H > 1,
    H2 is H - 1,
    canvas(W, H2, S2),
    row(W, R),
    S = [R|S2].

point1d([_|R], 0, Z, R2) :- R2 = [Z|R].
point1d([H|R], Y, Z, R2) :- Y > 0, Y2 is Y - 1, point1d(R, Y2, Z, R3), R2 = [H|R3].

point([H1|S1], 0, Y, Z, S2) :- point1d(H1, Y, Z, H2), S2 = [H2|S1].
point([H1|S1], X, Y, Z, S2) :-
    X > 0,
    X1 is X - 1,
    point(S1, X1, Y, Z, S3),
    S2 = [H1|S3].

line(S1, X1, Y1, X1, Y1, Z, S2) :- point(S1, X1, Y1, Z, S2).
line(S1, X1, Y1, X1, Y2, Z, S2) :-
    Y1 < Y2,
    Y is Y1 + 1,
    point(S1, X1, Y1, Z, S),
    line(S, X1, Y, X1, Y2, Z, S2).
line(S1, X1, Y1, X1, Y2, Z, S2) :-
    Y2 < Y1,
    line(S1, X1, Y2, X1, Y1, Z, S2).
line(S1, X1, Y1, X2, Y1, Z, S2) :-
    X1 < X2,
    X is X1 + 1,
    point(S1, X1, Y1, Z, S),
    line(S, X, Y1, X2, Y1, Z, S2).
line(S1, X1, Y1, X2, Y1, Z, S2) :-
    X2 < X1,
    line(S1, X2, Y1, X1, Y1, Z, S2).

rect(S1, X1, Y1, X1, Y2, Z, S2) :-
    line(S1, X1, Y1, X1, Y2, Z, S2).
rect(S1, X1, Y1, X2, Y2, Z, S2) :-
    X2 < X1,
    rect(S1, X2, Y1, X1, Y2, Z, S2).
rect(S1, X1, Y1, X2, Y2, Z, S2) :-
    Y2 < Y1,
    rect(S1, X1, Y2, X2, Y1, Z, S2).
rect(S1, X1, Y1, X2, Y2, Z, S2) :-
    X1 < X2,
    X is X1 + 1,
    line(S1, X1, Y1, X1, Y2, Z, S),
    rect(S, X, Y1, X2, Y2, Z, S2).

merge1d([], [], []).
merge1d([_|R1], [H2|R2], R3) :-
    H2 \= ' ',
    merge1d(R1, R2, R),
    R3 = [H2|R].
merge1d([H1|R1], [' '|R2], R3) :-
    merge1d(R1, R2, R),
    R3 = [H1|R].

merge([], [], []).
merge([H1|S1], [H2|S2], S3) :-
    merge1d(H1, H2, H3),
    merge(S1, S2, S),
    S3 = [H3|S].
