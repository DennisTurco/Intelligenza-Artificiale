% list_delete(Element, List, Result).

% Test:
%   list_delete(a, [a,b,d], L).
%   list_delete(e, [a,b,d], L).
%   list_delete(a, [a,b,d,a], L).

list_delete(X, [], []).
list_delete(X, [X|Tail], ResultTail) :-         % caso match
    list_delete(X, Tail, ResultTail).
list_delete(X, [Y|Tail], [Y|ResultTail]) :-     % caso no match
    X \= Y,
    list_delete(X, Tail, ResultTail).