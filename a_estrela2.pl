%% Estrutura de dados que vai armazenar a iteração (NO, PAI, G, H)
%% NO é um vertice (nó) do grafo
%% PAI é vertice (nó) pai, indicando que o caminho foi alterado
%% CUSTO (F) é custo atual acumulado até aquela distancia, este custo diminui quando um caminho menor é encontrado, dado por F

%% NO A* o custo de um caminho utiliza a funcao F = G + H, que baseia-se na euristica do custo da origem, acumulado de seu PAI 

aresta(a, b, 3).
aresta(a, c, 4).
aresta(b, c, 8).
aresta(b, d, 6).
aresta(c, e, 12).
aresta(d, e, 15).
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

%%Encontra os vizinhos de um vértoce
encontrarVizinhos(NO, L):- findall(X,  aresta(NO, X, _), L).

%%Calculo da estimativa do nó vizinho até o Fim (H), por enquanto é zero
estimarFim(NO, H) :- H is 0.

%%Preposicao responsavel por encontrar vertices vizinhos de um dado NO e adiciona-los ou atualiza-los se já existirem na lista, NLA deve ser ordenado de pelo custo
%% Ao invés de garantir a ordem na inserção, talvez seja melhor toda vez quando for desempilhar um nó, buscar o de menor custo, desta forma evito inconveniente de garantir a ordem na inserção
%% de cada nó vizinho
%%caso base 
adicionarEOuAtualizarListaAbertos(NO, FNO, [], LA, LA) :- 
.
%%adicionarEOuAtualizarListaAbertos(LV, LA, NLA):-
adicionarEOuAtualizarListaAbertos(NO, FNO, [DVIZIN|RVIZIN], LF, LA, NLA):-
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
(FANT > F -> REG is (DEST, PAIANT, GANT, HANT) ; REG is (DEST, NO, G1, H)),
%% TODO tentar fazer a ordenação no caso base
quick_sort([REG|LA], LA1),
adicionarEOuAtualizarListaAbertos(NO, FNO, RVIZIN, LA1, NLA),
write('NLA='), write(LA1), write('\n').







printCaminho(L) :- write(L).

%%Caso Base
melhorCaminho(DESTINO, [(DESTINO, _, _, _)| R], [DESTINO|LF]):- 
printCaminho(LF).

melhorCaminho(DESTINO, [(NO, PAI, G, H)|R], [NO|LF]):-
FNO is G + H,
encontrarVizinhos(NO, LV),
adicionarEOuAtualizarListaAbertos(NO, FNO, LV, R)





