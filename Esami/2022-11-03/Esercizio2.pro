% card (X, L, N).
% X -> elemento da ricercare
% L -> lista
% N -> numero di occorrenze di X in L

% card(c, [a, b, c, b, d], N).
%   N = 1
% card(b, [a, b, c, b, d], N).
%   N = 2
% card(z, [a, b, c, b, d], N).
%   N = 0

card(_, [], 0).
card(X, [X|L], N) :-    % caso in cui fa match
    card(X, L, N1),
    N is N1 + 1.
card(X, [Y|L], N) :-    % caso in cui non fa match
    X \= Y,             % equivale a not(X = Y), possibile anche dif(X, Y)
    card(X, L, N).