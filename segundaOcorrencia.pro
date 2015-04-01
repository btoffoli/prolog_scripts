%Encontrar a enésima ocorrencia de uma letra

letra(a).
letra(b).
%base
ocorreLetra(1, [C|R], C) :- letra(C).

%passos
ocorreLetra(N, [C|R], L) :- letra(C), N is N - 1, ocorreLetra(N, R, L).
ocorreLetra(N, [_|R], L) :- ocorreLetra(N, R, L).
