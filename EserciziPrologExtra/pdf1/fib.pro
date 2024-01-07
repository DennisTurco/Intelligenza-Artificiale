fib(0, 1).
fib(1, 1).
fib(X, Y) :-
    integer(X),
    X > 1,
    X1 is X - 1,
    X2 is X - 2,
    fib(X1, N1),
    fib(X2, N2),
    Y is N1 + N2.

% Bottom up version of FIBO
fibo_bu(N,F) :- 
    fibo_bu1(0,0,1,N,F).

fibo_bu1(N,F,_,N,F).
fibo_bu1(N1,F1,F2,N,F) :-
    N1<N, N2 is N1+1, F3 is F1+F2,
fibo_bu1(N2,F2,F3,N,F).