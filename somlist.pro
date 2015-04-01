somlist([], 0).
somlist([X|R], S) :- somlist(R, Z), S is X + Z.