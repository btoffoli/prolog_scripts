:- dynamic t/2.
t(x, y).

print(X) :- write('....'+     X).

tab([1,0,1], [0,0,0], [0,0,0]) :- !.

livres(C, [], L) :- 
write('imprimindo Lista caso base ' + L + '\n'), 
!.

livres(C, [X|R], L) :- 
X == 0, N is C + 1, insereFim(N, L, L1), 
write('INSERIDO ' + N + ' em ' + L1 + '\n'), 
livres(N, R, L1), !.

livres(C, [X|R], L) :- 
N is C + 1, write('NAO INSERINDO ' + N + ' em ' + L + '\n'), 
livres(N, R, L), !.

listaLivres(L, L1) :- livres(0, L, L1).

% Insere um elemento no início de uma lista
insereInicio(H, L, [H|L]):- !.
 
% Insere um elemento no fim de uma lista
insereFim(T, [H], L):- insereInicio(H,[T],L), !.
insereFim(N, [H|T], L):- insereFim(N,T,X), insereInicio(H, X, L).


