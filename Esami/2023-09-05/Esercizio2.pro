not_member(_, []) :- !.

not_member(X, [Head|Tail]) :-
     X \= Head,
    not_member(X, Tail).

plan(_, -1, []).

plan(S, N, [grab(X)|P]) :-
    N >= 0,
    member(on_table(X),S),
    member(free(X), S),
    M is N - 1,
    select(free(X), S, T),
    select(on_table(X),T,U),
    plan(U, M, P).

plan(S, N, [grab(X)|P]) :-
    N >= 0,
    member(on(X,Y), S),
    member(free(X), S),
    M is N - 1,
    select(free(X), S, T),
    select(on(X,Y), T, U),
    plan([free(Y)|U], M, P).

plan(S, N, [put_on_table(X)|P]) :-
    N >= 0,
   	not_member(on_table(X), S),
    M is N - 1,
    plan([on_table(X), free(X)|S], M, P).

plan(S, N, [put(X, Y)|P]) :-
    N >= 0,
    member(free(Y), S),
    M is N - 1,
    select(free(Y), S, C),
    plan([on(X, Y), free(X)| C], M, P).


% provate con plan([on_table(a), on(b, a), free(b)], 3, [grab(b),put_on_table(b),grab(a), put(a,b)]).
