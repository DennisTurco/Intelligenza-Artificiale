% Entrypoint: Calls re/3 with an uninitialized variable and uses it to compare with the length of the list.
re(X, L) :-
    re(X, N, L),       % Main Job is to find how many 'n's exist in the patterns
    length(L, N).

% s(P) is built upon re/2 instead of re/3
%   Job is to replicate work of re/3 for 0..n times
re(s(_), []).
% TODO: iNCOMPLETE
re(s(P), L) :-
    re(s(P), L)


%* Base Case
%  Match 'n' atom with a value of 1
re(n, 1, _).

%* Matches X1..X2 [concatenation]
    % N is derived from the sum of the values computed in the 2 subpatterns
re(c(X1, X2), N, L) :-
    re(X1, N1, L),          % Evaluates sub-pattern X1
    re(X2, N2, L),          % Evaluates sub-pattern X2
    N is N1 + N2.           % 

%* Matches X1 or X2 via prolog disjunction 
%  N is passed without changes
%? Might want a ',!' after the first match to avoid looking for more.
re(o(X1, X2), N, L) :-
    re(X1, N, L);
    re(X2, N, L).
