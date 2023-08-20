:- use_module(library(clpfd)).

soluzioni(X, Y) :-
    [X,Y] ins 1..10,
    X*X + Y*Y #=< 36,
    X + Y #=< 20,
    X #\= 2,
    label([X, Y]).