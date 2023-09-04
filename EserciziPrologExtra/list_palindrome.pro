% palindrome(List). -> true if the list "List" is palindrome, otherwise false.

% Test:
%   palindrome([a,b,c,b,a]). -> true
%   palindrome([a,b,b,a,v]). -> false

%* Way 1
palindrome([]).
palindrome([_]).
palindrome(List) :-
    list_reverse(List, List).   % Note: reverse(List, List) (prolog built-in predicate) is also correct 

list_reverse(List1, List2) :-
    list_reverse(List1, List2, []).

list_reverse([], Reversed, Reversed).
list_reverse([X|ListTail], Reversed, Reversed1) :-
    list_reverse(ListTail, Reversed, Reversed2),
    [Y|Reversed1] = Reversed2,
    X = Y.


%* Way 2 - ChatGPT
% Base case: An empty list is a palindrome.
is_palindrome([]).

% Base case: A list with one element is a palindrome.
is_palindrome([_]).

% Recursive rule: A list is a palindrome if the first and last elements are the same,
% and the remaining elements are also a palindrome.
is_palindrome([H | T]) :-
    append(Middle, [H], T),
    is_palindrome(Middle).