det(il).
det(i).

cn(cane).
cn(cani).
cn(topo).
cn(topi).

tv(rincorre).
tv(rincorrono).

sing(il).
sing(cane).
sing(topo).
sing(rincorre).

plur(i).
plur(cani).
plur(topi).
plur(rincorrono).

parse_cn(T, PS, [W1, W2 | P], P) :-
    (
        (plur(W1), plur(W2));
        (sing(W1), sing(W2))
    ),
    PS = W1,
    T = np(det(W1), cn(W2)).

parse_vp(T, PS, [W|P]) :-
    (
        (plur(PS), plur(W));
        (sing(PS), sing(W))
    ),
    parse_cn(T1, _, P, _),
    T = vp(tv(W), T1).
    
parse(T, P) :-
    parse_cn(T1, PS, P, P1),
    parse_vp(T2, PS, P1),
    T = a(T1, T2).
