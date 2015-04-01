predecessor(joao, jose).
predecessor(joao, lia).
predecessor(maria,jose).
predecessor(jose,ana).
predecessor(jose,patricia).
predecessor(patricia, felipe).
filho(Y,X):- predecessor(X,Y).