% Esercizio: https://www.tutorialspoint.com/prolog/prolog_linked_lists.htm

% add_front(L,E,NList).
% add_back(null, E, NList).

% Test:
%   add_front(null, 6, L1), add_front(L1, 5, L2), add_front(L2, 2, L3).
%   add_back(null, 6, L1), add_back(L1, 5, L2), add_back(L2, 2, L3).
%   add_front(null, 6, L1), add_front(L1, 5, L2), add_back(L2, 2, L3).

add_front(Next, Key, NList) :-
    NList = node(Key, Next).

add_back(null, Key, NList) :-
    NList = node(Key, null).
add_back(node(Head,Tail), Key, NList) :-
    add_back(Tail, Key, NewList),
    NList = node(Head, NewList).