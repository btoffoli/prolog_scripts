:- use_module(library(simplex)).

aresta(a, b, 2).
aresta(a, c, 4).
aresta(b, c, 1).
aresta(b, d, 6).
aresta(c, e, 12).
aresta(d, e, 13).
aresta(e, f, 5).
 

caminho(X, Y, C):-
  aresta(X, Y, C).

caminho(X, Y, C):-
  aresta(X, Z, C1),
  caminho(Z, Y, C2),
  C is C1 + C2.

todosCaminhos(X, Y, L):-
  findall(C, caminho(X, Y, C), L).


guardaCaminho(X, Y, L, (C, L)):-
	aresta(X, Y, C).

guardaCaminho(X, Y, R,(C, L)):-
	aresta(X, Z, C1),
	guardaCaminho(Z, Y, [Z | R], (C2, L)),
	C is C1 +C2.

