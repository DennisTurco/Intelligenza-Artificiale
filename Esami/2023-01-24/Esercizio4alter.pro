% Parametri in ordine di posizione:
    % G         Grafo diretto (rappresentato come lista di coppie [Nodo1, Nodo2])
    % Node      Nodo di partenza del percorso
    % Length    Lunghezza del percorso
    % Path      Percorso come lista di nodi

% Test:
%   percorso([[a,b], [a,c], [b,c], [c,a]], a, 1, P).
%   percorso([[a,b], [a,c], [b,c], [c,a]], a, 3, P).

%* Versione Alternativa
percorso(_, Node, 1, [Node]) :-
    member(Node, [_,_]), !.
percorso(Graph, Node, Length, [Node|Rest]) :-
    integer(Length),
    Length > 0,
    Length1 is Length - 1,
    member([Node, Next], Graph),
    percorso(Graph, Next, Length1, Rest).