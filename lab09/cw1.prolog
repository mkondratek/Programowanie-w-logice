
mm([S,E,N,D,M,O,R,Y]) :-
Vars = [S,E,N,D,M,O,R,Y], 
Vars ins 0..9,
S#\=0, M#\=0,
all_different(Vars),
S*1000+E*100+N*10+D+
M*1000+O*100+R*10+E#=
M*10000+O*1000+N*100+E*10+Y,
labeling([], Vars).


mm([S,E,N,D] + [M,O,R,Y]) = [M,O,N,E,Y] :-
Vars = [S,E,N,D,M,O,R,Y],
Vars ins 0..9,
S#\=0, M#\=0,
all_different(Vars),
S*1000+E*100+N*10+D+
M*1000+O*100+R*10+E#=
M*10000+O*1000+N*100+E*10+Y.
mm(As+Bs=Cs), label(As).

f([A, L ,A, M, K, T]) :-
Vars = [ALAMKT],

alldifferent(Vars),
