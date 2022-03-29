:- use_module(library(clpfd)).	

star([A, B, C, D, E, F, G, H, I, J, K, L]) :-
    Vars = [A, B, C, D, E, F, G, H, I, J, K, L],
    all_different(Vars),
    Vars ins 1..12,
    C #< D,
    A #=1,
    A + B + E + H + K + L #= 26,
    A + C + F + H #= 26,
    A + D + G + K #= 26,
    B + C + D + E #= 26,
    B + F + I + L #= 26,
    H + I + J + K #= 26,
    E + G + J + L #= 26,
    labeling([], Vars).
