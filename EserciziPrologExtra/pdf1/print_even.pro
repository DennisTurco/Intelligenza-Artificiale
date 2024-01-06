print_even([]).
print_even([Num|Rest]) :-
    is_even(Num),
    write(Num), write(','),
    print_even(Rest), !.
print_even([_|Rest]) :-
    print_even(Rest).

is_even(Num) :-
    0 is Num mod 2.


% Alternativa con controllo dispari invece che pari.
print_even2([]).
print_even2([Num|Rest]) :-
    is_odd(Num),
    print_even2(Rest), !.
print_even2([Num|Rest]) :-
    write(Num), write(','),
    print_even2(Rest).

is_odd(Num) :-
    1 is Num mod 2.


% Alternativa compatta utilizzando l'operatore di disgiunzione.
print_even3([]).
print_even3([Num|Rest]) :-
    (
        (is_odd(Num), !)
        ;
        (write(Num),write(','))
    ),
    print_even3(Rest).