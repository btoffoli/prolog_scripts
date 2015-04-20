livres(C, [], [X|L], L) :- 
write('imprimindo Lista caso base ' + L + '\n'), 
!.

livres(C, [X|R], L, LF) :- 
X == 0, N is C + 1, insereFim(N, L, L1), 
write('INSERIDO ' + N + ' em ' + L1 + '\n'), 
livres(N, R, L1, LF), !.

livres(C, [X|R], L, LF) :- 
N is C + 1, write('NAO INSERINDO ' + N + ' em ' + L + '\n'), 
livres(N, R, L, LF), !.

listaLivres(L, L1) :- livres(0, L, _, L1).

% Insere um elemento no início de uma lista
insereInicio(H, L, [H|L]):- !.
 
% Insere um elemento no fim de uma lista
insereFim(T, [H], L):- insereInicio(H,[T],L), !.
insereFim(N, [H|T], L):- insereFim(N,T,X), insereInicio(H, X, L).