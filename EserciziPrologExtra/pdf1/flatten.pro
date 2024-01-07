
flatten(Nested, Flat) :-
    flatten(Nested, [], Flat).

flatten([X|NestedRest], Flat1, Flat) :-
    flatten(NestedRest, Flat1, Flat2),
    flatten(X, Flat2, Flat).
flatten(X, FlatRest, [X|FlatRest]) :-
    atomic(X),
    X \= [].
flatten([], Flat, Flat).