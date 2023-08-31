% Entrypoint: Calls re/3 with an uninitialized variable and uses it to compare with the length of the list.
re(X, L) :-
    re(X, N, L),       % Main Job is to find how many 'n's exist in the patterns
    length(L, N).

% Job is to replicate work of re/3 on P for 0..n times
re(s(_), 0, []).

re(s(P), N, L) :-
    re(P, N1, L),                   % Evaluate sub-pattern with empty counter N1
    remove_n(L, N1, ShorterList),   % try to remove N1 elements from List | If it fails the whole s(P) pattern parsing fails
    re(s(P), N2, ShorterList),      % Re-Evaluate s(P) on the shorter list
    N is N1 + N2.


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
    re(X1, N, L),!;
    re(X2, N, L).


% Removes N elements from List -> Result is in ShorterList
remove_n(List, N, ShorterList) :-
    length(Prefix, N),                      % Builds a List Prefix with N elems
    append(Prefix, ShorterList, List).      % Splits List in Prefix [of length N] and ShorterList [length unknown]

% Test:
%   re(o(c(n,n), c(n,c(n,n))), [1,2]).
%   re(o(c(n,n), c(n,c(n,n))), [1,2,3]).
%   re(s(o(c(n,n), c(n, c(n,c(n,n))))), [1,2,3,4,5,6,7]).