node(a).
node(b).
node(c).
node(d).

arc(a, b).
arc(a, c).
arc(b, c).
arc(c, d).

% percorso diretto
path(X, Y) :-
    arc(X, Y).

% percorso indiretto
path(X, Y) :-
    arc(X, Z),
    path(Z, Y).