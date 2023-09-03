% find_max(List, Max).

% Test:
%   find_max([2,3,2,6,1], Max).
%   find_max([6,1], Max).
%   find_max([2,4], Max).
%   find_min([2,3,2,6,1], Min).
%   find_min([6,1], Min).
%   find_min([2,4], Min).

find_max([N], N).
find_max([N1, N2|Rest], Max) :-
    N1 >= N2,
    find_max([N1|Rest], Max).
find_max([N1, N2|Rest], Max) :-
    N1 < N2,
    find_max([N2|Rest], Max).

find_min([N], N).
find_min([N1, N2|Rest], Min) :-
    N1 =< N2,
    find_min([N1|Rest], Min).
find_min([N1, N2|Rest], Min) :-
    N1 > N2,
    find_min([N2|Rest], Min).