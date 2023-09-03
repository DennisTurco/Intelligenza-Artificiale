node(a).
node(b).
node(c).
node(d).

arc(a, b).
arc(a, c).
arc(b, c).
arc(c, d).


%%%%%%%%%%%%%%%%%%%%%%%%%%%% MODO 1
% percorso diretto
path(X, Y, w(X, Y)) :-
    arc(X, Y).

% percorso indiretto
path(X, Y, w(X, P)) :-
    arc(X, Z),
    path(Z, Y, P).

%%%%%%%%%%%%%%%%%%%%%%%%%%%% MODO 2
% percorso diretto
path2(X, Y, [X, Y]) :-
    arc(X, Y).

% percorso indiretto
path2(X, Y, [X | P]) :-
    arc(X, Z),
    path2(Z, Y, P).