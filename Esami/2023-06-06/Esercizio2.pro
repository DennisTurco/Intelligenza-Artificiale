:- use_module(library(clpfd)).

% Filters the first list doing the following:
% 1) ints in range [0..10] are removed from the output list
% 2) ints in range [11..20] are duplicated in the final list
% 3) ints in range [21..30] are increased by 1 in the final list
% 4) ints in range [31..50] are copied as is to the final list

filter([], []).

filter([O|T1], T2) :-
    O in 0..10,
    filter(T1, T2).

filter([O|T1], [O,O|T2]) :-
    O in 11..20,
    filter(T1, T2).

filter([O|T1], [F|T2]) :-
    O in 21..30,
    F is O + 1,
    filter(T1, T2).

filter([O|T1], [O|T2]) :-
    O in 31..50,
    filter(T1, T2).

