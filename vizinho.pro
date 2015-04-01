vizinho([X|[Y|R]], X, Y).
vizinho([X|[Y|R]], Y, X).
vizinho([_|R],X,Y):- vizinho(R, X, Y).
