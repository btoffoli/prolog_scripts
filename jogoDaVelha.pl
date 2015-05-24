%% :- [pertence, naoPertence].

% A idéia aqui é fazer com que a função polinomial que avaliará 
% o estado do jogo siga a seguinte função 
% X1 -> probabilidade do jogador adversário ganhar
% X2 -> probabilidade 
% faval(X1, X2, X3) = -p1X1 + p2X2 + p3X3 

:- [listaLivres, pertence].

% Estado inicial do tabuleiro
%:- dynamic tab/9
%% tab(1,1,1, 2,2,0, 0,0,0) :- !.

%O estado do tabuleiro deve ser trocado de usando a remoção de fatos

pesoPosicao(1, 800) :- !.
pesoPosicao(2, 600) :- !.
pesoPosicao(3, 800) :- !.
pesoPosicao(4, 600) :- !.
pesoPosicao(5, 700) :- !.
pesoPosicao(6, 600) :- !.
pesoPosicao(7, 800) :- !.
pesoPosicao(8, 600) :- !.
pesoPosicao(9, 800) :- !.
pesoPosicao(_, 0) :- !.


% Calculo da probabilidade de quase fechar o jogo (faltando uma peça, P-> player)
pv(P, P, P, _, 1) :- !.
pv(P, P, _, P, 1) :- !.
pv(P, _, P, P, 1) :- !.
pv(P, _, _, _, 0).


pvx(P, [X1, X2, X3, X4, X5, X6, X7, X8, X9], QPV) :- 
%% tab(X1, X2, X3, X4, X5, X6, X7, X8, X9),
pv(P, X1, X2, X3, P1), % Linha 1
pv(P, X4, X5, X6, P2), % Linha 2
pv(P, X7, X8, X9, P3), % Linha 3
pv(P, X1, X4, X7, P4), % Coluna 1
pv(P, X2, X5, X8, P5), % Coluna 2
pv(P, X3, X6, X9, P6), % Coluna 3
pv(P, X1, X5, X9, P7), % Diagonal Principal
pv(P, X3, X5, X7, P8), % Diagonal Secundaria
QPV is P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8.




% Calculo da probabilidade de ter ganho o jogo
vv(P, P, P, P, 1) :- !.
vv(P, _, _, _, 0).

vvx(P, [X1, X2, X3, X4, X5, X6, X7, X8, X9], QVV) :- 
%% tab(X1, X2, X3, X4, X5, X6, X7, X8, X9),
vv(P, X1, X2, X3, P1), % Linha 1
vv(P, X4, X5, X6, P2), % Linha 2
vv(P, X7, X8, X9, P3), % Linha 3
vv(P, X1, X4, X7, P4), % Coluna 1
vv(P, X2, X5, X8, P5), % Coluna 2
vv(P, X3, X6, X9, P6), % Coluna 3
vv(P, X1, X5, X9, P7), % Diagonal Principal
vv(P, X3, X5, X7, P8), % Diagonal Secundaria
QVV is P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8.




%player adversário
pa(1, 2).
pa(2, 1).


favl(P, TAB, VAL) :- 
pvx(P, TAB, QPV),
vvx(P, TAB, QV),
%%posicalPreferencial(P, PONTOS, TAB),
%% %%write("PONTOS="+PONTOS),
pa(P, P2),
pvx(P2, TAB, QPV2),
%vvx(P2, TAB, QV2),
%pa(Pa, P2),
%% favl(P2, VAL2),
%%VAL is PONTOS + 1000 * QPV + 10000 * QV,
VAL is (1000 * QPV + 10000 * QV - 1000 * QPV2)
%%, write(VAL).
.


%% Precisa da melhor posição, esta é obtida percorrendo todas as possíbilidades de jogadas em aberto e ver qual é melhor ou menos pior
%% Para tal é necessário uma função que retorne a lista de posições a serem jogadas, e uma outra que experimente e todas e traga a de melhor valor
marcarTabuleiro([X1, X2, X3, X4, X5, X6, X7, X8, X9], P, 1, [P, X2, X3, X4, X5, X6, X7, X8, X9]) :- !.
marcarTabuleiro([X1, X2, X3, X4, X5, X6, X7, X8, X9], P, 2, [X1, P, X3, X4, X5, X6, X7, X8, X9]) :- !.
marcarTabuleiro([X1, X2, X3, X4, X5, X6, X7, X8, X9], P, 3, [X1, X2, P, X4, X5, X6, X7, X8, X9]) :- !.
marcarTabuleiro([X1, X2, X3, X4, X5, X6, X7, X8, X9], P, 4, [X1, X2, X3, P, X5, X6, X7, X8, X9]) :- !.
marcarTabuleiro([X1, X2, X3, X4, X5, X6, X7, X8, X9], P, 5, [X1, X2, X3, X4, P, X6, X7, X8, X9]) :- !.
marcarTabuleiro([X1, X2, X3, X4, X5, X6, X7, X8, X9], P, 6, [X1, X2, X3, X4, X5, P, X7, X8, X9]) :- !.
marcarTabuleiro([X1, X2, X3, X4, X5, X6, X7, X8, X9], P, 7, [X1, X2, X3, X4, X5, X6, P, X8, X9]) :- !.
marcarTabuleiro([X1, X2, X3, X4, X5, X6, X7, X8, X9], P, 8, [X1, X2, X3, X4, X5, X6, X7, P, X9]) :- !.
marcarTabuleiro([X1, X2, X3, X4, X5, X6, X7, X8, X9], P, 9, [X1, X2, X3, X4, X5, X6, X7, X8, P]) :- !.
%% marcarTabuleiro(TAB, _, _, TAB_AUX) :- !.


avaliarPosicao(_, _, [], _, _, POS, POS) :- 
%%write('CASO BASE POSAUX' + POS + '\n'), 
!.

avaliarPosicao(P, TAB, [X|R], VAL, N, POSAUX, POS) :- 
X == 0, 
%%write('chamada1' + X + '; ' + N + '\n'), 
marcarTabuleiro(TAB, P, N, TAB_AUX), 
%% %%write(1 + TAB_AUX + '\n'),
favl(P, TAB_AUX, VAL_AUX), 
%% pa(P, P2),
%% favl(P2, TAB_AUX, VAL_AUX2),
VAL_AUX2 is 0,
pesoPosicao(N, PP),
VAL_AUX3 is VAL_AUX - VAL_AUX2 + PP,
%%VAL_AUX3 is VAL_AUX - VAL_AUX2,
%% write('N=' + N +	' VAL_AUX='+ VAL_AUX + ' VAL_AUX2='+ VAL_AUX2 + ' VAL_AUX3=' + VAL_AUX3 + ' PP=' + PP +'\n'),
VAL_AUX3 > VAL, 
POS1 is N,
NAUX is N+1, 
%%write('terminou chamada1' + P + TAB + R + VAL_AUX + VAL_AUX3 + NAUX + POSAUX + '\n'),
avaliarPosicao(P, TAB, R, VAL_AUX3, NAUX, POS1, POS) %%,!
%% %%write('chamada1' + X + '\n'), 
%%%%write('\n' + POSAUX + '\n'),
%%%%write('\n' + VAL_AUX + '-' + VAL_AUX2 +' '+ VAL_AUX3 + '\n'),

.

avaliarPosicao(P, TAB, [X|R], VAL, N, POSAUX, POS) :- 
X == 0, 
%%write('chamada2' + X + '; ' + N + '\n'), 
marcarTabuleiro(TAB, P, N, TAB_AUX), 
%% %%write(2 + TAB_AUX + '\n'),
favl(P, TAB_AUX, VAL_AUX), 
pa(P, P2),
favl(P2, TAB_AUX, VAL_AUX2),
pesoPosicao(N, PP),
VAL_AUX3 is VAL_AUX - VAL_AUX2 + PP,
%%VAL_AUX3 is VAL_AUX - VAL_AUX2,
%%write('chamada2' + P + TAB + R + VAL_AUX + VAL_AUX3  + POSAUX + '\n'),
VAL_AUX3 =< VAL,
NAUX is N+1, 
%%write('terminou chamada2' + P + TAB + R + VAL_AUX + VAL_AUX3 + NAUX + POSAUX + '\n'),
avaliarPosicao(P, TAB, R, VAL, NAUX, POSAUX, POS),
!.

avaliarPosicao(P, TAB, [X|R], VAL, N, POSAUX, POS) :- 
%%write('chamada3' + X + '; ' + N + '\n'), 
X=\=0, 
%%write('chamada3' + X + '\n'), 
NAUX is N+1, 
%%write('terminou chamada3' + P + TAB + R + VAL + NAUX + POSAUX + '\n'),
avaliarPosicao(P, TAB, R, VAL, NAUX, POSAUX, POS), 

!.

melhorPosicao(P, TAB, X) :- 
avaliarPosicao(P, TAB, TAB, -11000, 1, _, X), 
%%write('X=' + X + '\n'), 
!.


verificarPosicaoLivre(X, TAB) :-
X =\= 0,
write('Posicao Invalida. Tente novamente.'),
rodarTurnoJogo(TAB).

verificarPosicaoLivre(X, TAB) :-
X == 0.

%% tentarJogar(_, _, [], _, TAB_AUX) :-  !.
% Não precisa ir até o final do tabuleiro
tentarJogar(P, POS, TAB, [X|R], POS, TAB_AUX) :- 
%% POS == N, 
verificarPosicaoLivre(X, TAB), 
%% %%write('tentarJogar1 ' + POS + N + X + '\n'),
marcarTabuleiro(TAB, P, POS, TAB_AUX), !.

tentarJogar(P, POS, TAB, [X|R], N, TAB_AUX) :- 
POS > N, 
%% %%write('tentarJogar2 ' + POS + N + X + '\n'),
N1 is N +1,
tentarJogar(P, POS, TAB, R, N1, TAB_AUX), !.

jogar(P, POS, TAB, TAB_AUX) :- tentarJogar(P, POS, TAB, TAB, 1, TAB_AUX).

jogarJogador(P, TAB, TAB_AUX) :- 
%%write('Entre com a posicao:'), 
read(X), jogar(P, X, TAB, TAB_AUX)
 , write('TAB =>' + TAB_AUX + '\n')
.

verificarVitoria(P, TAB) :- 
vvx(P,TAB, QV), 
QV < 1, !.

verificarVitoria(P, TAB) :- 
vvx(P,TAB, QV), 
QV > 0, 
write('Jogo acabou com jogador ' +  P + ' Campeao'), %%!,
fail.

%% melhorPosicao já avalia posicao válida, não foi necessário utilizar a regra jogar
jogarMaquina(P, TAB, TAB_AUX) :- melhorPosicao(P, TAB, POS), marcarTabuleiro(TAB, P, POS, TAB_AUX)
,write('TAB =>' + TAB_AUX + '\n')
.


rodarTurnoJogo(TAB) :- jogarJogador(1, TAB, TAB_AUX), verificarVitoria(1, TAB_AUX), jogarMaquina(2, TAB_AUX, TAB_AUX2), verificarVitoria(2, TAB_AUX2), rodarTurnoJogo(TAB_AUX2).

iniciar :- TAB = [0,0,0, 0,0,0, 0,0,0], 
write('TAB =>' + TAB + '\n'), 
rodarTurnoJogo(TAB).




print(P, QPV) :- pvx(P, QPV), format('Resultado é ~d', QPV).

