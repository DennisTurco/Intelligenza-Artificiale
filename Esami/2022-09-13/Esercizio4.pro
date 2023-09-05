:- use_module(library(clpfd)).

solve(X, Y) :-
    [X,Y] ins -10..10,
    17*X*X + 16*X*Y + 18*X + 17*Y*Y + 18*Y #=< 207,
    X*X + 2*X + Y*Y #=< 34,
    X #=< Y,
    label([X, Y]).