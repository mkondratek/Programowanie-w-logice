split_at([], _, [], []).
split_at([H|T], 0, [], [H|T]).
split_at([H|T], N, R, Rest) :-
    N > 0,
    N2 is N - 1,
    split_at(T, N2, R2, Rest),
    R = [H|R2].

group([], _, []).
group([H|T], N, Result) :-
    split_at([H|T], N, R, Rest),
    group(Rest, N, Result2),
    Result = [R|Result2].

apply(_, [], []).
apply(F, [H|T], R) :-
    X =.. [F|H],
    apply(F, T, R2),
    R = [X|R2].

apply(F, N, S, W) :-
    S =.. [F2|Args], group(Args, N, Args2), apply(F, Args2, Args3), W =.. [F2|Args3].
