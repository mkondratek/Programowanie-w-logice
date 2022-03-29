concat(A1-B1, B1-C1, A1-C1).
rotate([A|A1]-B1, X-Y) :- concat(A1-B1, [A|Y]-Y, X-Y).

createQueue(Z-Z).
addQueue(E, Q1-W1, Q1-W2) :- concat(Q1-W1, [E|W2]-W2, Q1-W2). 
delQueue(E, Q1-W1, Q2-W1) :- concat([E|WE]-WE, Q2-W1, Q1-W1). 
isEmptyQueue(X-Y) :- unify_with_occurs_check(X, Y).

?- createQueue(Q),
   addQueue(a,Q,Q1),
   addQueue(b,Q1,Q2), 
   delQueue(X,Q2,Q3),
   delQueue(Y,Q3,Q4),
   isEmptyQueue(Q4).
