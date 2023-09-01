% * Questo esercizio è scritto in modo teorico senza test né esempio [come all'esame su carta],
% * quindi potrebbero esserci errori logici o dettagli dimenticati.

% action(N, P, A, D).

plan(S0, SG, [Action]) :- 
    action(Action, P, A, D),
    check_states(S0, SG, P, A, D).

plan(S0, SG, [Action|RestPlan]) :- 
    action(Action, P, A, D),
    check_states(S0, SIG, P, A, D),
    plan(SIG, SG, RestPlan).


check_states([], [], Preconditions, AddList, DeleteList).

check_states([], [SG|GoalState], Preconditions, AddList, DeleteList) :-
    member(SG, AddList),
    nonmember(SG, DeleteList),
    check_states([], GoalState, Preconditions, AddList, DeleteList).

check_states([S0|InitialState], GoalState, Preconditions, AddList, DeleteList) :-
    member(S0, Preconditions),
    check_states(InitialState, GoalState, Preconditions, AddList, DeleteList).


%% Predicato nonmember tramite cut e fail
nonmember(_, []).
nonmember(X, [X | _]) :-
	!,
	fail.
nonmember(X, [_ | R]) :-
	nonmember(X, R).