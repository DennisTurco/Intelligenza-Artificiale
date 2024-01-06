no_common_elements([], _).
no_common_elements([Head|Rest1], List2) :-
    not_in(Head, List2),
    no_common_elements(Rest1, List2).

not_in(_, []).
not_in(Elem, [Head|Rest]) :-
    Elem \= Head,
    not_in(Elem, Rest).
