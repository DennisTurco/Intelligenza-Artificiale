% Test:
    % String = [v,v,x]          -> true
    % String = [w,v,x,y]        -> true
    % String = [v,v]            -> false
    % String = [w,w,v,v,x,y,y]  -> true
    % String = [w,w,v,v,x,y]    -> false


% Grammatica:
    % S -> Ax | By
    % A -> vA | v
    % B -> wS
grammar([
    [s, a, x], [s, b, y],
    [a, v, a], [a, v],
    [b, w, s]
]).

parse(_, []).

% parsa il primo simbolo [sempre s]
    % member è utilizzata per trovare tutte le produzioni che partono da S
parse(G, String) :-
    member([s|Out], G),
    parse_sub(Out, G, String, _).

% parse_sub
% - Il primo parametro è la lista di atomi e variabili ottenuta dalla grammatica su cui la chiamata corrente sta lavorando
% - Il secondo parametro è la Grammatica [costante e passata in tutte le chiamate]
% - La stringa nel terzo parametro viene modificata dalle chiamate ricorsive
    % Al caso base la uguagliamo al quarto parametro, che permetterà di risalire lo stack senza far tornare indietro la stringa ad uno stato precendente
% - Quindi il quarto parametro nelle altre chiamate ricorsive non viene modificato [è una variabile unassigned, il cui unico scopo è quello di essere assegnata nel caso base]
parse_sub([], _, Snapshot, Snapshot).

% Predicato chiamato quando si deve scomporre E secondo una delle produzioni della grammatica.
parse_sub([E|T], G, String, Snapshot) :-
    member([E|Out], G),                             % Testa se E è un simbolo di variabile [se può essere scomposto di nuovo]
    parse_sub(Out, G, String, InternalSnapshot),    % Chiamata ricorsiva interna che parsa l'output della produzione di E [variabile corrente]
    parse_sub(T, G, InternalSnapshot, Snapshot).    % Chiamata ricorsiva che prova a parsare la roba [atomo o variabile] che c'è dopo E, nella lista del primo parametro

% Predicato verificato nel caso in cui E sia un atomo e quindi non deve essere scomposto tramite una produzione di G
parse_sub([E|T], G, [C|String], Snapshot) :-
    E = C,  % Test che E = C | Ridondante perché si potrebbero chiamare gli elementi C direttamente nella testa del predicato, però in questo modo rende più l'idea e rende il trace più semplice.
    parse_sub(T, G, String, Snapshot).              % Continua l'analisi della lista al primo parametro.