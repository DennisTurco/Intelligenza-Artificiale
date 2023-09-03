factorial(0, 1).

factorial(N, F) :-
    N > 0,
    M is N - 1,
    factorial(M, G),
    F is G * N. % attenzione a non mettere M al posto di N poiche' M ad un certo punto e' = a 0