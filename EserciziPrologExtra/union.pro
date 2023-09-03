% predicate union/3 which the result R is the append between L1 and L2 without any duplicates
% my_union(L1, L2, R).

%* Modo 1 - FUNZIONANTE
my_union([], [], []).

my_union([X|RestL1], L2, Result) :-
    member(X, RestL1); member(X, L2), !,
    my_union(RestL1, L2, Result).
my_union([X|RestL1], L2, [X|Result]) :-
    my_union(RestL1, L2, Result).

my_union([], [X|RestL2], Result) :-
    member(X, RestL2), !,
    my_union([], RestL2, Result).
my_union([], L2, L2).
    my_union([], RestL2, Result).

%* Modo 2 - ChatGPT
concatenate_unique([], List, List).
concatenate_unique([X | Rest], List2, Result) :-
    member(X, List2),       % Verifica se X è già presente in List2
    !,                      % Taglia la scelta per evitare duplicati
    concatenate_unique(Rest, List2, Result).
concatenate_unique([X | Rest], List2, [X | Result]) :-
    concatenate_unique(Rest, List2, Result).

%* Modo 3 - Non potrà mai andare per come è pensato
union2([], [], []).
union2(L1, L2, Result) :-
    sub_union2(L1, L2),
    sub_union2(L2, Result).

sub_union2([], []).
sub_union2([X|RestList], [X|Result]) :-
    sub_union2(RestList, Result).