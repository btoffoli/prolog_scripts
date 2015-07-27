:- dynamic t/2.
t(x, y).

print(X) :- write('....'+     X).

tab([1,0,1], [0,0,0], [0,0,0]) :- !.

livres(C, [], [X|L], L) :- 
write('imprimindo Lista caso base ' + L + '\n'), 
!.

livres(C, [X|R], L, LF) :- 
X == 0, N is C + 1, insereFim(N, L, L1), 
write('INSERIDO ' + N + ' em ' + L1 + '\n'), 
livres(N, R, L1, LF), !.

livres(C, [X|R], L, LF) :- 
N is C + 1, write('NAO INSERINDO ' + N + ' em ' + L + '\n'), 
livres(N, R, L, LF), !.

listaLivres(L, L1) :- livres(0, L, _, L1).

% Insere um elemento no início de uma lista
insereInicio(H, L, [H|L]):- !.
 
% Insere um elemento no fim de uma lista
insereFim(T, [H], L):- insereInicio(H,[T],L), !.
insereFim(N, [H|T], L):- insereFim(N,T,X), insereInicio(H, X, L).

animal(cao).
animal(gato).

readAniaml :- read(X), animal(X).



quick_sort([],[]).
quick_sort([H|T],Sorted):-
	pivoting(H,T,L1,L2),quick_sort(L1,Sorted1),quick_sort(L2,Sorted2),
	append(Sorted1,[H|Sorted2]).
   
pivoting(H,[],[],[]).
pivoting(H,[X|T],[X|L],G):-
X=<H,pivoting(H,T,L,G).
pivoting(H,[X|T],L,[X|G]):-
X>H,pivoting(H,T,L,G).

quick_sort2(List,Sorted):-
q_sort(List,[],Sorted).

q_sort([],Acc,Acc).
q_sort([H|T],Acc,Sorted):-
	pivoting(H,T,L2,L1),
	q_sort(L1,Acc,Sorted1),q_sort(L2,[H|Sorted1],Sorted).



%%Funcao que compara estrutura de dados utilizado no A*
noMaiorIgual((NOX, PAIX, GX, HX), (NOY, PAIY, GY, HY)):-
FX = GX + HX,
FY = GY + HY,
FX >= FY.

noMenor((NOX, PAIX, GX, HX), (NOY, PAIY, GY, HY)):-
FX = GX + HX,
FY = GY + HY,
FX < FY.

pivotingX(H,[],[],[]).
pivotingX(H,[X|T],[X|L],G):-
noMaiorIgual(H, X), pivotingX(H,T,L,G).
pivotingX(H,[X|T],L,[X|G]):-
noMenor(H, X),pivotingX(H,T,L,G).

quick_sortX(List,Sorted):-
q_sortX(List,[],Sorted).

q_sortX([],Acc,Acc).
q_sortX([H|T],Acc,Sorted):-
	pivotingX(H,T,L2,L1),
	q_sortX(L1,Acc,Sorted1),q_sortX(L2,[H|Sorted1],Sorted).



%% [(a, 0, 0, 10), (b, a, 1, 11), (c, a, 5, 10)]
%%  [(b, a, 1, 11), (c, a, 5, 10), (a, 0, 0, 10)]
%% [(c, a, 5, 10), (a, 0, 0, 10), (b, a, 1, 11)]


aresta(a, b, 3).
aresta(a, c, 4).
aresta(b, c, 8).
aresta(b, d, 6).
aresta(c, e, 12).
aresta(d, e, 15).
aresta(e, f, 5).

encontrarVizinhos(NO, L):- findall(X,  aresta(NO, X, _), L).
