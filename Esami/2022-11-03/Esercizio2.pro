card(_, [], 0).

card(X, [X|L], N) :-
    card(X, L, N1),
    N is N1 + 1.

card(X, [C|L], N) :-
    card(X, L, N),
    X \= C.