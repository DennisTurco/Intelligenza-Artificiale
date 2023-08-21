
/*
    ESERCIZIO INCOMPLETO
*/


comp(_, []).

% 3 + (3 + 4 * 4) + (4 + 2)

% TODO: 3 * (1 + 2 * 3) + 4

% parenthesis
comp(R, [open|T]) :-
    comp(R, T).
comp(R, [N,close|T]) :- 
    comp(R, [N|T]). 

comp(R, [N,prod,open|T]) :-
    comp(R1, [open|T]),
    comp(R, [N,prod,R1]).

% sum
comp(R, [N1,sum,N2]) :-
    check(N1, N2),
    R is N1 + N2.
comp(R, [N1,sum,N2|T]) :-
    member(prod, T),
    comp(R1, [N2|T]),
    comp(R, [N1,sum,R1]),
    !.      % e' necessario in quanto a causa della ricorsione si ritorna indietro provando altre strade, ma non deve, altrimenti dopo la prima soluzione corretta da altre soluzioni errate  
comp(R, [N1,sum,N2|T]) :-
    check(N1, N2),
    R1 is N1 + N2,
    comp(R, [R1|T]).

% prod
comp(R, [N1,prod,N2]) :-
    check(N1, N2),
    R is N1 * N2.
comp(R, [N1,prod,N2|T]) :-
    check(N1, N2),
    R1 is N1 * N2,
    comp(R, [R1|T]).

% check values
check(N1, N2) :- integer(N1), integer(N2).


% comp(Result, [open,3,sum,4,prod,4,close]).

% comp(Result, [1,sum,2]).
% comp(Result, [1,prod,2,prod,4]).
% comp(Result, [1,sum,2,prod,4]).
% comp(Result, [open,1,sum,2,close,prod,4]).
% TODO: comp(R, [open,1,sum,2,close,prod,open,3,prod,4,close]). 