:- use_module(library(clpfd)).
:- debug.

alberi(N, N) :-
	N in 1..10,
    label([N]).

% shortcut predicate for node(num, num, num) but really only adds redundant solutions
% alberi(nodo(N, F1, F2), S) :-
%     [N, F1, F2] ins 1..10,
%     label([N, F1, F2]),
%     S #= F1 + F2 + N.

alberi(nodo(N, F1, F2), S) :-
    %[N, S1, S2] ins 1..10,     % Sets S1 and S2 bounds directly and lets Prolog figure out the values automatically
    %   OR
    S1 #> 0,                    % Makes sure the free variables are constrained > 0 [lower bound]
    S2 #> 0,
    N in 1..10,                 % node data num needs to be an integer between 1 and 10

    S1 #=< S - S2 - N,          % Inferred condition on free variables [from the constraint below] [upper bound]
    S2 #=< S - S1 - N,  

    alberi(F1, S1),             % Recursively expand subtrees
    alberi(F2, S2),

    S #= S1 + S2 + N.           % Make sure this sub-tree value is = to the sum of it's 2 children node values + own value