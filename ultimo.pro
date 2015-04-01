ultimo([X], X) :- !.
ultimo([_|R],X) :- ultimo(R, X).