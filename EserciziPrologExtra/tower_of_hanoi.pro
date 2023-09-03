% Towers of Hanoi Problem https://www.tutorialspoint.com/prolog/prolog_towers_of_hanoi_problem.htm

% Test:
%   move(3, source, target, auxiliary).

move(1, Source, Target, _) :-
    write('Move top disk from '), write(Source), write(' to '), write(Target), nl.
move(N, Source, Target, Auxiliary) :-
    N > 1,
    N1 is N - 1,
    move(N1, Source, Auxiliary, Target),
    move(1, Source, Target, Auxiliary),
    move(N1, Auxiliary, Target, Source).