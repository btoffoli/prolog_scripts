:- dynamic t/2.
t(x, y).

print(X) :- write('....'+     X).

tab([1,0,1], [0,0,0], [0,0,0]) :- !.

livres(_, [], L) :- write('imprimindo Lista caso base ' + L + '\n').
livres(C, [X|R], L) :- X == 0, N is C + 1, write('INSERINDO ' + [N|L] + '\n'), livres(N, R, [N|L]).

livres(C, [X|R], L) :- X =\= 0,  N is C + 1, write('NAO INSERINDO ' + L + '\n'), livres(N, R, L).

listaLivres(L, L1) :- livres(1, L, L1).

% Insere um elemento no início de uma lista
insereInicio(H, L, [H|L]):- !.
 
% Insere um elemento no fim de uma lista
insereFim(T, [H], L):- insereInicio(H,[T],L), !.
insereFim(N, [H|T], L):- insereFim(N,T,X), insereInicio(H, X, L).


