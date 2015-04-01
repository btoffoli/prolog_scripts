%:- dynamic ama/2.
sent([Substantivo1, ama, Substantivo2]) :- assert(ama(Substantivo1, Substantivo2)).
sent([Substantivo1, ama, _, Substantivo2]) :- sent([Substantivo1, ama, Substantivo2]).
sent([_, Substantivo1, ama, Substantivo2]) :- sent([Substantivo1, ama, Substantivo2]).
sent([_, Substantivo1, ama, _, Substantivo2]) :- sent([Substantivo1, ama, Substantivo2]).

