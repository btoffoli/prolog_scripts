:- dynamic(arvore/2) .

naoPertence(X, []) :- !.
naoPertence(X, [P|R]) :- P \= X, naoPertence(X, R).

% Insere um elemento no início de uma lista
insereInicio(H, L, [H|L]):- !.
 
% Insere um elemento no fim de uma lista
insereFim(T, [H], L):- insereInicio(H,[T],L), !.
insereFim(N, [H|T], L):- insereFim(N,T,X), insereInicio(H, X, L).




%%% Arestas com pesos:
aresta(a, b).
aresta(a, c).
aresta(b, c).
aresta(b, d).
aresta(c, e).
aresta(d, e).
aresta(e, f).

% bidirecional:
%% aresta(b, a, 5).
%% aresta(c, a, 3).
%% aresta(c, b, 4).
%% aresta(d, b, 7).
%% aresta(e, c, 3).
%% aresta(e, d, 3).
%% aresta(f, e, 4).

%% obterArvore(L, [X|R], AR, WAR) :- 
obterArvore(L, [X|R], AR) :- 
naoPertence(X, L),
aresta(Y, X),
insereFim(X, L, NL),
insereFim([Y, X], AR, NAR),
write(NAR),
%% obterArvore(NL, R, NAR, WAR).
obterArvore(NL, R, NAR).

obterArvore(L, [X|R], AR) :- 
%% obterArvore(L, [X|R], AR, WAR) :- 
%% obterArvore(L, R, AR, WAR).
obterArvore(L, R, AR).

obterArvore(L, [], AR).


gerarArvore(L) :-
obterArvore(_, [a,b,c,e,f], L),
write(L).

