% Test
%   sottolista(S, [1,2,3]).
%       S = []
%       S = [1]
%       S = [2]
%       S = [3]
%       S = [1, 2]
%       S = [2, 3]
%       S = [1, 2, 3]

% Matcha solo il caso finale in cui la lista è vuota [considerabile come sottolista vuota]
sottolista([], []).

% Per verificare una sottolista generica verifichiamo la presenza di una sequenza partendo dalla Head
% e poi alternativamente andiamo a riverificare la presenza di una sequenza nel resto della lista.
sottolista(SubList, [Head|Rest]) :-
    sequence(SubList, [Head|Rest]);
    sottolista(SubList, Rest).

% Caso in cui c'è un solo elemento dentro la sottolista
%   La sequenza è accettabile sia come derivato da altre chiamate di predicati che come sottolista singleton
sequence([H], [H|_]).

% Chain predicate per verificare una sequenza più lunga di 1 elemento. [gli item devono essere consecutivi]
sequence([F1,F2|S], [F1,F2|L]) :- 
    %write('sequence2 di check con 2 head: '),
    %write_vars([F1,F2]),
    sequence([F2|S], [F2|L]).