split(A, L) :- split(A, [], [[]], L).
split([], [], AllAcc, AllAcc).
split([], [A|PartAcc], AllAcc, R) :- split([], [], [[A|PartAcc]|AllAcc], R).
split([0|T], PartAcc, AllAcc, R) :- split(T, [], [PartAcc|AllAcc], R).
split([A|T], PartAcc, AllAcc, R) :- A =\= 0, split(T, [A|PartAcc], AllAcc, R).
