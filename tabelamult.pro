tabMult :-
L = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
membro(X, L), membro(Y, L),
Z is X*Y, assert(produto(X, Y, Z)), fail.
tabMult.