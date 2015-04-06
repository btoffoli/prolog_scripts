%% :- [pertence, naoPertence].

% A idéia aqui é fazer com que a função polinomial que avaliará 
% o estado do jogo siga a seguinte função 
% X1 -> probabilidade do jogador adversário ganhar
% X2 -> probabilidade 
% faval(X1, X2, X3) = -p1X1 + p2X2 + p3X3 


% Estado inicial do tabuleiro
:- dynamic tabAux/3
tab([1,0,1], [0,0,0], [0,0,0]) :- !.

%O estado do tabuleiro deve ser trocado de usando a remoção de fatos


% Calculo da probabilidade de quase fechar o jogo (faltando uma peça)
pv(P, [P, P, 0], 1) :- !.
pv(P, [P, 0, P], 1) :- !.
pv(P, [0, P, P], 1) :- !.
pv(P, [_, _, _], 0).

pvx(P, QPV) :- 
tab([X1, X2, X3], [X4, X5, X6], [X7, X8, X9]),
pv(P, [X1, X2, X3], P1), % Linha 1
pv(P, [X4, X5, X6], P2), % Linha 2
pv(P, [X7, X8, X9], P3), % Linha 3
pv(P, [X1, X4, X7], P4), % Coluna 1
pv(P, [X2, X5, X8], P5), % Coluna 2
pv(P, [X3, X6, X9], P6), % Coluna 3
pv(P, [X1, X5, X9], P7), % Diagonal Principal
pv(P, [X3, X5, X7], P8), % Diagonal Secundaria
QPV is P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8.




% Calculo da probabilidade de ter ganho o jogo
vv(P, [P, P, P], 1) :- !.
vv(P, [_, _, _], 0).

vvx(P, QVV) :- 
tab([X1, X2, X3], [X4, X5, X6], [X7, X8, X9]),
vv(P, [X1, X2, X3], P1), % Linha 1
vv(P, [X4, X5, X6], P2), % Linha 2
vv(P, [X7, X8, X9], P3), % Linha 3
vv(P, [X1, X4, X7], P4), % Coluna 1
vv(P, [X2, X5, X8], P5), % Coluna 2
vv(P, [X3, X6, X9], P6), % Coluna 3
vv(P, [X1, X5, X9], P7), % Diagonal Principal
vv(P, [X3, X5, X7], P8), % Diagonal Secundaria
QVV is P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8.


%player adversário
pa(1, 2).
pa(2, 1).


favl(P, VAL) :- 
pvx(P, QPV),
vvx(P, QV),
pa(P, Pa),
pa(Pa, V2),
VAL is 200 * QPV + 10000 * QV - 2000 * V2.


%% Precisa da melhor posição, esta é obtida percorrendo todas as possíbilidades de jogadas em aberto e ver qual é melhor ou menos pior
%% Para tal é necessário uma função que retorne a lista de posições a serem jogadas, e uma outra que experimente e todas e traga a de melhor valor
listaLivres




print(P, QPV) :- pvx(P, QPV), format('Resultado é ~d', QPV).






















