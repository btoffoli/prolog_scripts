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

remover(X, [X|R], R).

remover(X, [Y|R], [Y|NL]):-
remover(X, R, NL).


%%Preposicao responsavel por encontrar vertices vizinhos de um dado NO e adiciona-los ou atualiza-los se já existirem na lista, NLA deve ser ordenado de pelo custo
%% Ao invés de garantir a ordem na inserção, talvez seja melhor toda vez quando for desempilhar um nó, buscar o de menor custo, desta forma evito inconveniente de garantir a ordem na inserção
%% de cada nó vizinho
%% adicionarEOuAtualizarListaAbertos((NO, PAI, G, H), LA, NLA):-
adicionarEOuAtualizarListaAbertos(NO, DESTFINAL, LA, NLA):-
%% procura por destinos que partem do NO atual
aresta(NO, DEST, CUSTO),
%% Remove o nó atual
remover((NO, _, _, _), LA, LA1)
%%Sempre removo, se o custo novo for maior, o registro com o mesmo registro e reinserido na lista
remover((DEST, PAIANT, GANT, HANT), LA1, NLA1),
FANT = GANT + HANT,
%% novo G é dado por G + CUSTO
G1 = G + CUSTO,
%% Verificar como calcula-se H para cada vertice
F = G1 + H,
%% REG = (_, _, _, _),
(FANT > F -> REG is (DEST, PAIANT, GANT, HANT) ; REG is (DEST, NO, G1, H)),
NLA is [REG|NLA1],
write('NLA='), write(NLA), write('\n').









%%Caso Base
melhorCaminho(X, Y, [], LF):- 
printCaminho(LF).

melhorCaminho(X, Y, [(NO, PAI, G, H)|R], LF):-
adicionarEOuAtualizarListaAbertos(NO, )





