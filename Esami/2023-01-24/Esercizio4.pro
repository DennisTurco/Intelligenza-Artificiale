%:- use_module(library(clpfd)).

percorso(G, Node, 1, [Node]) :-
    member([Node,_], G);
    member([_,Node], G).

percorso(G, Node, Length, [Node|RestOfPath]) :-
    integer(Length),
    Length > 0,
    Length1 is Length - 1,
    member([Node, Next], G),
    percorso(G, Next, Length1, RestOfPath).
    
