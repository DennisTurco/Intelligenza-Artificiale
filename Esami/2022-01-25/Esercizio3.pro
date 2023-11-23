:- use_module(library(clpfd)).

soluzioni(X, Y) :-
    [X,Y] ins 1..10,    % Assegnamento diretto del dominio [1..10] alle variabili X,Y
    X*X + Y*Y #=< 36,   % Vincolo 1
    X + Y #=< 20,       % Vincolo 2
    X #\= 2,            % Vincolo 3
    label([X, Y]).      % Enumerazione di tutte le possibili assegnazioni di X e Y