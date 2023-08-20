:- use_module(library(clpfd)).
:- debug.

alberi(N, N) :-
	N in 1..10,
    label([N]).
	

alberi(nodo(N, F1, F2), S) :- 
    alberi(F1, S1),
    alberi(F2, S2),
    
    N in 1..10,
    label([N]),
    
    S #= S1 + S2 + N.
    %label([S1, S2, N]).
