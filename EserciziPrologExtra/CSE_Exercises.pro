
% 4. Define a predicate length(L,N) which holds iff N is the length of the list L.
:- redefine_system_predicate(length(_,_)).
length([], 0). 
length([H|T], N) :-
    integer(H),
    length(T, N1),
    N is N1 + 1.


% TODO: fixhere
% 5. Define a predicate occurrences(X,L,N) which holds iff the element X occurs N times in the list L.
occurrences(_, [], 0).
occurrences(X, [X|T], N) :-         % caso in cui fa match
    occurrences(X, T, N1),
    N is N1 + 1.
occurrences(X, [Y|T], N) :-         % caso in cui non fa match
    not(X = Y),
    occurrences(X, T, N).


% 6. Define a predicate occurs(L,N,X) which holds iff X is the element occurring in position N of the list L.
occurs([X|_], 1, X).    % caso base: l'elemento ricercato si trova nella posizione 1
occurs([_|T], N, X) :-  % ricerca in base alla posizione N > 0
    N > 1, 
    N1 is N-1,
    occurs(T, N1, X).


% 7. Define a predicate sumlist(L,N) which, given a list of integers L, returns the sum N of all the elements of L.
sumlist([], 0).
sumlist([H|T], N) :-
    integer(H),
    sumlist(T, N1),
    N is N1 + H.


% 8. Define a predicate add_up_list(L,K) which, given a list of integers L, returns a list of integers in which each element
%   is the sum of all the elements in L up to the same position. Example:
%   add_up_list([1,2,3,4],K).
%       K = [1,3,6,10];
%       no
add_up_list(L, K) :-    % L e K sono 2 liste
    add(L, K, 0).       % N e' il valore salvato fino a quel momento
add([], [], _).       % caso base in cui la lista ha un solo elemnto
add([X|L], [Y|K], N) :-
    integer(X),
    Y is X + N,
    add(L, K, Y).


% 9. Define a predicate quicksort(L,K) which, given a list of integers L, returns an ordered list K obtained from L with
%   the method of quicksort
quicksort([],[]).
quicksort([HeadList|RestList], Result) :-
    split(HeadList, RestList, List1, List2),
    quicksort(List1, Result1),
    quicksort(List2, Result2),
    append(Result1, [HeadList|Result2], Result).

split(_, [], [], []).
split(HeadList, [HeadList2|RestList], List1, [HeadList2|RestList2]) :-
    HeadList < HeadList2,
    split(HeadList, RestList, List1, RestList2).
split(HeadList, [HeadList2|RestList], [HeadList2|RestList1], List2) :-
    HeadList >= HeadList2,
    split(HeadList, RestList, RestList1, List2).


% 10. Define a predicate merge(L,K,M) which, given two ordered lists of integers L and K, returns an ordered list M
%   containing all the elements of L and K

%* MODO 1
:- redefine_system_predicate(merge(_,_)).
merge(L,[],L).
merge([],K,K).
merge([X|L], [Y|K], [Y|M]) :-
    integer(X),
    integer(Y),
    X >= Y,
    merge([X|L], K, M).
merge([X|L], [Y|K], [X|M]) :-
    integer(X),
    integer(Y),
    X < Y,
    merge(L, [Y|K], M).


%* MODO 2
my_merge([], [], _).
my_merge([], Qualcosa, List) :-
    my_append(Qualcosa, List), !.
my_merge(Qualcosa, [], List) :-
    my_append(Qualcosa, List), !.
my_merge([N1|Rest1], [N2|Rest2], [N1|Rest]) :-
    N1 =< N2,
    my_merge(Rest1, [N2|Rest2], Rest).
my_merge([N1|Rest1], [N2|Rest2], [N2|Rest]) :-
    N2 < N1,
    my_merge([N1|Rest1], Rest2, Rest).

my_append([], _).
my_append([N], [N]).
my_append([N|Rest1], [N|Rest2]) :-
    my_append(Rest1, Rest2).


% 11. Consider a representation of binary trees as terms, as follows
%     -> emptybt           the empty binary tree
%     -> consbt(N,T1,T2)   the binary tree with root N and left and right subtrees T1 and T2
%         1. Define a predicate preorder(T,L) which holds iff L is the list of nodes produced by the preorder traversal of the
%             binary tree T.
%         2. Define a predicate search_tree(L,T) which, given a list of integers L, returns a balanced search-tree T
%             containing the elements of L.

% 1 preorder(T, L)
preorder(emptybt, []).
preorder(consbt(R, T1, T2), L) :-
    preorder(T1, L1),
    preorder(T2, L2),
    append([R|L1], L2, L).
