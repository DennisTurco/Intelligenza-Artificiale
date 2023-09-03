% attraversamento grafo non necessariamente aciclico

node(a).
node(b).
node(c).

arc(a, a).
arc(a, b).
arc(b, c).
arc(c, a).

path(X, Y, P) :-
    path1(X, Y, [], P).

path1(_, X, V, _) :-
    member(X, V),       % se il nodo appartiene gia' al percorso ci fermiamo, altrimenti ciclo
    !,
    fail.

% caso base
path1(X, X, V, [X|V]) :-
    node(X).
% passo induttivo
path1(X, Y, V, R) :-
    arc(X, Z),
    path1(Z, Y, [Y|V], R).