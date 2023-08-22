% WORK IN PROGRESS

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

parse([[s|Out]|Rest], String) :-
    parse_sub(Out, [[s|Out]|Rest], String).


parse_sub([], _, []).

parse_sub([E|T], G, String) :-
    member([E|Out], G),
    parse_sub(Out, G, String),
    parse_sub(T, G, String). 
    % TODO ^ Problema di ricorsione: String contiene valori che dovrebbero essere già stati esclusi dal predicato che fa la sottoricorsione
    
parse_sub([E|T], G, [C|String]) :-
    E = C,
    parse_sub(T, G, String).