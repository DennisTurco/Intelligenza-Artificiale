
% my_sort([2,1,4,3], R).
% my_sort([2,1,4,3,0], R).
% my_sort([1,2,3,0,4], R). 

my_sort(L1, L2) :-
    length(L1, N),
    my_sort2(L1, L2, N).

my_sort2(L, L, 0).
my_sort2(L1, L3, N) :-
    N > 0,
    N1 is N - 1,
    my_sub_sort(L1, L2),
    my_sort2(L2, L3, N1).

my_sub_sort([N], [N]).
my_sub_sort([N1, N2|Rest], [N1|Rest2]) :-
    N1 =< N2,
    my_sub_sort([N2|Rest], Rest2).
my_sub_sort([N1, N2|Rest], [N2|Rest2]) :-
    N1 > N2,
    my_sub_sort([N1|Rest], Rest2).