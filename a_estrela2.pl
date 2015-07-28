%% Estrutura de dados que vai armazenar a iteração (NO, PAI, G, H)
%% NO é um vertice (nó) do grafo
%% PAI é vertice (nó) pai, indicando que o caminho foi alterado
%% CUSTO (F) é custo atual acumulado até aquela distancia, este custo diminui quando um caminho menor é encontrado, dado por F

%% NO A* o custo de um caminho utiliza a funcao F = G + H, que baseia-se na euristica do custo da origem, acumulado de seu PAI 

aresta(a, b, 2).
aresta(a, c, 4).
aresta(b, c, 1).
aresta(b, d, 6).
aresta(c, e, 12).
aresta(d, e, 13).
aresta(e, f, 5).
 
custoMaximo(999).



%% LA -> Lista de vértices Abertos
%% LF -> Lista de vertices fechados
%%melhorCaminho(X, Y, LA, LF):- 

%%quicksort aplicado a minha estrutura de dados de navegação no A*
%%Funcao que compara estrutura de dados utilizado no A*, para ser usado no quick_sort
noMaiorIgual((NOX, PAIX, GX, HX), (NOY, PAIY, GY, HY)):-
FX = GX + HX,
FY = GY + HY,
FX >= FY.

noMenor((NOX, PAIX, GX, HX), (NOY, PAIY, GY, HY)):-
FX = GX + HX,
FY = GY + HY,
FX < FY.

pivo(H,[],[],[]).
pivo(H,[X|T],[X|L],G):-
noMaiorIgual(H, X), pivo(H,T,L,G).
pivo(H,[X|T],L,[X|G]):-
noMenor(H, X),pivo(H,T,L,G).

quick_sort(List,Sorted):-
q_sort(List,[],Sorted).

q_sort([],Acc,Acc).
q_sort([H|T],Acc,Sorted):-
	pivo(H,T,L2,L1),
	q_sort(L1,Acc,Sorted1),q_sort(L2,[H|Sorted1],Sorted).

%% Fim do quicksort


%% Remove um item da lista
remover(X, [X|R], R).
remover(X, [Y|R], [Y|NL]):-
remover(X, R, NL).

%%Verifica se um registro não pertence
naoPertence(X, []) :- !.
naoPertence(X, [P|R]) :- P \= X, naoPertence(X, R).

pertence(X, [X|_]).
pertence(X, [_, Y]):- pertence(X,Y).

%%Encontra os vizinhos de um vértoce
encontrarVizinhos(NO, L):- findall(X,  aresta(NO, X, _), L).

%%Calculo da estimativa do nó vizinho até o Fim (H), por enquanto é zero
estimarFim(NO, H) :- H = 0.

%%Preposicao responsavel por encontrar vertices vizinhos de um dado NO e adiciona-los ou atualiza-los se já existirem na lista, NLA deve ser ordenado de pelo custo
%% Ao invés de garantir a ordem na inserção, talvez seja melhor toda vez quando for desempilhar um nó, buscar o de menor custo, desta forma evito inconveniente de garantir a ordem na inserção
%% de cada nó vizinho
%%caso base 
adicionarEOuAtualizarListaAbertos(NO, FNO, [], LF, LA, LA).

%%adicionarEOuAtualizarListaAbertos(LV, LA, NLA):-

%%preposicao apenas p/ continuar o loop dos adjacentes p/ o caso de já estar na lista fechada
%% adicionarEOuAtualizarListaAbertos(NO, FNO, [DVIZIN|RVIZIN], LF, LA, NLA):- 
%% pertence((DVIZIN, _), LF),
%% adicionarEOuAtualizarListaAbertos(NO, FNO, RVIZIN, LF, LA1, NLA).

%% Caso já esteja no vetor de abertos
adicionarEOuAtualizarListaAbertos(NO, FNO, [DVIZIN|RVIZIN], LF, LA, NLA):-
%%Garante que o no já esta nos fechados
naoPertence((DVIZIN, _), LF),
%%Descobrir o custo atual
aresta(NO, DVIZIN, CUSTO),
%%Sempre removo, se o custo novo for maior, o registro com o mesmo registro e reinserido na lista
remover((DVIZIN, PAIANT, GANT, HANT), LA, LA1),
FANT = GANT + HANT,
%% novo G é dado por G + CUSTO
G1 = FNO + CUSTO,
%% Verificar como calcula-se H para cada vertice
estimarFim(DVIZIN, H),
F = G1 + H,
%% REG = (_, _, _, _),
(FANT < F -> REG = (DVIZIN, PAIANT, GANT, HANT) ; REG = (DVIZIN, NO, G1, H)),
%% TODO tentar fazer a ordenação no caso base
%% quick_sort([REG|LA1], LA2),
adicionarEOuAtualizarListaAbertos(NO, FNO, RVIZIN, LF, [REG|LA1], NLA).


%%Caso não esteja na lista de abertos
adicionarEOuAtualizarListaAbertos(NO, FNO, [DVIZIN|RVIZIN], LF, LA, NLA):-
%%Garante que o no já esta nos fechados
naoPertence((DVIZIN, _), LF),
%%Descobrir o custo atual
aresta(NO, DVIZIN, CUSTO),
%%Sempre removo, se o custo novo for maior, o registro com o mesmo registro e reinserido na lista
naoPertence((DVIZIN, _, _, _), LA),
%% novo G é dado por G + CUSTO
G1 = FNO + CUSTO,
%% Verificar como calcula-se H para cada vertice
estimarFim(DVIZIN, H),
F = G1 + H,
REG = (DVIZIN, NO, G1, H),
%% TODO tentar fazer a ordenação no caso base
%% quick_sort([REG|LA], LA1),
adicionarEOuAtualizarListaAbertos(NO, FNO, RVIZIN, LF, [REG|LA], NLA).






%%Caso Base
melhorCaminho(_, [], LF, LF):-
write(LF), write('\n').

melhorCaminho(DESTINO, [(DESTINO, PAI, _, _)|R], LF, NLF):-
melhorCaminho(DESTINO, R, [(DESTINO, PAI)|LF], NLF),
write(LF), write('\n').

%% melhorCaminho(DESTINO, [(DESTINO, PAI, _, _)| R], [(PAI, AVO)|RF], LF).

melhorCaminho(DESTINO, [(NO, PAI, G, H)|R], LF, L):-
FNO is G + H,
encontrarVizinhos(NO, LV),
adicionarEOuAtualizarListaAbertos(NO, FNO, LV, LF, R, RO),
quick_sort(RO, RO1),
write(RO1), write('\n'),
melhorCaminho(DESTINO, RO1, [(NO, PAI)|LF], L).

a_estrela(X, Y, L) :-
melhorCaminho(Y, [(X, 0, 0, 0)], [], L).

printCaminho(_, []).
printCaminho(NO, [(NO, PAI)|R]) :- write(NO), write('<-'), printCaminho(PAI, R).
printCaminho(NO, [EL|R]) :- printCaminho(NO, R).


printCaminhoCompleto(X, Y):-
a_estrela(X, Y, L),
%% write(Y), write('<-'),
printCaminho(PAI, L),!.




