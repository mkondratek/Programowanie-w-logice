silnia(N, X) :- silnia3(N, 1, X).
silnia3(0, X, X).
silnia3(N, Acc, X) :- N1 is N - 1, Acc1 is Acc * N, silnia3(N1, Acc1, X).


fib(N, X) :- fib4(N, X, 0, 1).
fib4(0, X, X, _).
fib4(N, X, A, B) :-
    X1 is A + B,
    N1 is N - 1,
	fib4(N1, X, B, X1).


get_nth([A|_], 0, A).
get_nth([_|L], I, X) :- I1 is I - 1, get_nth(L, I1, X).

przekatna(M, P) :- przekatna3(M, 0, [], P1), reverse(P1, P).
przekatna3([], _, P, P).
przekatna3([A|M], N, Acc, P) :- get_nth(A, N, X), N1 is N + 1, przekatna3(M, N1, [X|Acc], P).


sumy(L, X, Y) :- sumy4(L, 0, 0, X, Y).
sumy4([], M, N, M, N).
sumy4([A|L], M, N, X, Y) :- A < 0, M1 is M + A, sumy4(L, M1, N, X, Y).
sumy4([A|L], M, N, X, Y) :- A >= 0, N1 is N + A, sumy4(L, M, N1, X, Y).

splaszcz(X, P) :- splaszcz3(X, [], P1), reverse(P1, P).
splaszcz3([], L, L).
splaszcz3([A|X], L, R) :- not(is_list(A)), L1 = [A|L], splaszcz3(X, L1, R).
splaszcz3([A|X], L, R) :- is_list(A), splaszcz3(A, L, Y), splaszcz3(X, Y, R).
