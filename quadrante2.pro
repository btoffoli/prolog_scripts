quad(0, 0, 7). %origem retorna 7
quad(0, X, 6) :- X =\= 0. %eixo y retorna 6
quad(X, 0, 5) :- X =\= 0. %eixo x retorna 5
quad(X, Y, 1) :- X > 0, Y > 0.
quad(X, Y, 2) :- X < 0, Y > 0.
quad(X, Y, 3) :- X < 0, Y < 0.
quad(X, Y, 4) :- X > 0, Y < 0.


