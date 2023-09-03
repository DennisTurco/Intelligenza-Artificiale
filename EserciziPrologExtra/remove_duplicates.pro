remove_duplicates([], []).
remove_duplicates([X|TailList], TailResult) :-      % if the element X is duplicated in the List -> we don't add it into the result list
    member(X, TailList),
    remove_duplicates(TailList, TailResult).
remove_duplicates([X|TailList], [X|TailResult]) :-  % else -> we add the element X
    not(member(X, TailList)),
    remove_duplicates(TailList, TailResult), !.