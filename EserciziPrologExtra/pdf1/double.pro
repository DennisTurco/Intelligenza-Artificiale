double_length([], []).
double_length([_,_|Rest1], [_|Rest2]) :-
    double_length(Rest1, Rest2).