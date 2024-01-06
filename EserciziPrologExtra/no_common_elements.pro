no_common_elements([], _).
no_common_elements([Head|Rest1], List2) :-
    not_in(Head, List2),
    no_common_elements(Rest1, List2).

not_in(_, []) :- !.
not_in(Elem, [Head|Rest]) :-
    Elem \= Head,
    not_in(Elem, Rest).


% Alternativa utilizzando member/2 per ottenere l'elemento da testare nella List2
no_common_elements(List1, List2) :- 
    member(Element, List1), 
    member(Element, List2), 
    !, fail. 
    
no_common_elements(_,_).