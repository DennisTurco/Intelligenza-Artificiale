% Filters the first list doing the following:
% 1) ints in range [0..10] are removed from the output list
% 2) ints in range [11..20] are duplicated in the final list
% 3) ints in range [21..30] are increased by 1 in the final list
% 4) ints in range [31..50] are copied as is to the final list

:- use_module(library(clpfd)).

% caso base
filter([], []).

% tra 0 e 10
filter([X|L1], L2) :- 
    X in 0..10,
    filter(L1, L2).

% tra 11 e 20
filter([X|L1], [X, X|L2]) :-
    X in 11..20,
    filter(L1, L2).

% tra 21 e 30
filter([X|L1], [N|L2]) :-
    X in 21..30,
    N is X + 1,
    filter(L1, L2).

% tra 21 e 30
filter([X|L1], [N|L2]) :-
    X in 21..30,
    N is X + 1,
    filter(L1, L2).

% tra 31 e 50
filter([X|L1], [X|L2]) :-
    X in 31..50,
    filter(L1, L2).