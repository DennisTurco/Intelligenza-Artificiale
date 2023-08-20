:- use_module(library(clpfd)).

ammissibile([[Ra, Ca], [Rb, Cb]]) :-
    Ra - Rb #\= Ca - Cb.
ammissibile([[Ra, Ca]|Rest]) :-
    ammissibile_sub([Ra, Ca], Rest),
    ammissibile(Rest).

ammissibile_sub([Ra, Ca], [[Rb, Cb]]) :-
    Ra - Rb #\= Ca - Cb.
ammissibile_sub([Ra, Ca], [[Rb, Cb]|Rest]) :-
    Ra - Rb #\= Ca - Cb,
    ammissibile_sub([Ra,Ca], Rest).
