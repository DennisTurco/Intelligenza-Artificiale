% Parametri in ordine di posizione:
    % G         Grafo diretto (rappresentato come lista di coppie [Nodo1, Nodo2])
    % Node      Nodo di partenza del percorso
    % Length    Lunghezza del percorso
    % Path      Percorso come lista di nodi

% Caso Base:
    % La lunghezza del percorso è 1, quindi il nodo potrebbe trovarsi nel primo elemento o nel secondo della coppia dell'arco. (doppia member disgiunta)
    % Il cut serve per dire a Prolog di fermarsi nel caso la prima member dia una soluzione, oppure di  continuare con la seconda nel caso non l'abbia trovata
percorso(G, Node, 1, [Node]) :-
    member([Node,_], G), !;
    member([_,Node], G).

% member svolge 2 compiti
    % Controllare se c'è una coppia con Node come primo elemento,
    % Ottenere il secondo elemento corrispondente nella coppia
percorso(G, Node, Length, [Node|RestOfPath]) :-
    integer(Length),
    Length > 0,
    Length1 is Length - 1,
    member([Node, Next], G),
    percorso(G, Next, Length1, RestOfPath).
    
