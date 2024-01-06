% card (X, L, N).
% X -> elemento da ricercare
% L -> lista
% N -> numero di occorrenze di X in L

% Test:
% card(c, [a, b, c, b, d], N).
%   N = 1
% card(b, [a, b, c, b, d], N).
%   N = 2
% card(z, [a, b, c, b, d], N).
%   N = 0

card(_, [], 0).
card(X, [X|L], N) :-    % caso in cui c'è match : X è la testa della lista da esplorare
    card(X, L, N1),     % Chiamata ricorsiva sul resto della lista; con un nuovo N
    N is N1 + 1.        % Costante contatore N per il ciclo corrente aumentata di 1 [siccome questo ciclo ha trovato un match nella lista]

card(X, [Y|L], N) :-    % caso in cui non c'è match
    X \= Y,             % dovrebbe non essere necessario siccome i casi in cui X = Y sono già coperti dalla prima regola, ma da più chiarezza, e funziona come assert
    card(X, L, N).      % Chiamata ricorsiva sul resto della lista; N rimane uguale

%/ tecnical notes: X \= Y equivale a not(X = Y) in teoria; 
%  possibile anche dif(X, Y) [solo con la libreria apposita per risolvere CLP]