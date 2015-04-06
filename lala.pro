:- dynamic t/2.
t(x, y).

print(X) :- write('....'+     X).

tab([1,0,1], [0,0,0], [0,0,0]) :- !.

listaLivres(_, [], L), !.
listaLivres(C, [X, R], L) :- N is C + 1, write(N), listaLivres(N, R, L), !.
listaLivres(C, [X|R], L) :- X == 0, N is C + 1, write(N), insereFim(N, L, NL), listaLivres(N, R, NL]).


% Insere um elemento no início de uma lista
insereInicio(H, L, [H|L]):- !.
 
% Insere um elemento no fim de uma lista
insereFim(T, [H], L):- insereInicio(H,[T],L), !.
insereFim(N, [H|T], L):- insereFim(N,T,X), insereInicio(H, X, L).


