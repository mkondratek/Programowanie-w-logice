
lubi(janek, lody).
lubi(janek, kino).
lubi(ania, muzyka).
lubi(ania, kino).
lubi(ania, koty).
student(janek).
student_lubi(X) :- student(S), lubi(S,X).
lubia_oboje(X) :- lubi(janek, X), lubi(ania, X).

% ?- lubi(janek, koty)
% ?- lubi(janek, lody)

% ?- student(X)
% ?- lubi(ania, X), lubi(janek, X).
% ?- student_lubi(X)
% ?- lubia_oboje(X)
