%naoPertenceAux([L, Y): 
naoPertence(X, []) :- !.
naoPertence(X, [P|R]) :- P \= X, naoPertence(X, R).