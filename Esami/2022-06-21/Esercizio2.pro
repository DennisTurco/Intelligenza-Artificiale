% Test
%   sottolista(S, [1,2,3]).
%       S = []
%       S = [1]
%       S = [2]
%       S = [3]
%       S = [1, 2]
%       S = [2, 3]
%       S = [1, 2, 3]

sottolista([], _).

sottolista([SubHead|SubTail], Main) :-
    sequence([SubHead|SubTail], Main),
    sottolista(SubTail, Main).

sequence([], _).

% Caso in cui c'è un solo elemento dentro la sottolista
% Matches if [H] & [H|[...]] -> sequence will fail
% Matches if [H] & [H|[]]    -> sequence will pass
sequence([H], [H|L]) :-
    write('sequence1 di check con 1 elem: '),
    write(H), nl,
    sequence([], L).

sequence([H1,H2|S], [F1,F2|L]) :- 
    write('sequence2 di check con 2 head: '),
    write(H1), write(H2), write(F1), write(F2), nl,
    H1 = F1,
    H2 = F2,
    sequence([H2|S], [F2|L]).

sequence([H|S], [F|L]) :-
    write('sequence3 di con != con 1 head: '),
    write(H), write(F), nl,
    H \= F,
    sequence([H|S], L).