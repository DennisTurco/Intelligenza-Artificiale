% Average Guessing game:
% - R is a random value between L and H
% - the user is prompt to guess the number
% - if the guess was wrong depending on the value of the guessed number the game gives a hint that the number to guess is higher or lower
% - if the number is guessed the game terminates.

guess(L,H) :-
    random_between(L,H,R),
    guess(L,H,R,_).

guess_output(_,_,G,G) :-
    write('pog, you got it correct!').

guess_output(L,H,R,G) :-
    R > G,
    write('wrong, too low, try again...'),
    guess(L, H, R, _).

guess_output(L,H,R,G) :-
    R < G,
    write('wrong, too high, try again...'),
    guess(L, H, R, _).


guess(L, H, R, G) :-
    read(G),
    guess_output(L, H, R, G).