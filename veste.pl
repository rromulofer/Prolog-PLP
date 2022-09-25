%     Arquivo: veste.pl
%
% Prof. Ausberto S. Castro Vera
% Disciplina : Paradigmas de Ling. de Programacao
% UENF-CCT-LCMAT-CC
% Date: 25 setembro 2022
% Aluno: Rômulo Souza Fernandes
%-------------------------------------------------

%  Fonte:  http://www.facom.ufu.br/~marcelo/PL/tutorial%20de%20prolog.pdf

% Aqui começa o programa     ...
pessoa(ale).       %           Alexandra
pessoa(babe).      %           Barbara
pessoa(rosa).
pessoa(tati).
pessoa(luisa).

cor(azul).
cor(amarelo).
cor(verde).
cor(vermelho).
cor(lilaz).
cor(laranja).
cor(preto).
cor(roxo).

% este pedaço é importante...pois....está
% dito no problema  e define uma cor paracada  menina


tem_uma_cor(babe,amarelo).
tem_uma_cor(rosa,verde).
tem_uma_cor(ale,azul).

%% aqui  pode-se ampliar as restrições
nao_pode_vestir(babe,azul).
nao_pode_vestir(babe,vermelho).
nao_pode_vestir(babe,lilaz).
nao_pode_vestir(babe,verde).

nao_pode_vestir(rosa,azul).
nao_pode_vestir(rosa,lilaz).
nao_pode_vestir(rosa,amarelo).
nao_pode_vestir(rosa,vermelho).

nao_pode_vestir(ale,amarelo).
nao_pode_vestir(ale,vermelho).
nao_pode_vestir(ale,lilaz).
nao_pode_vestir(ale,verde).

veste(X, Cor1, Cor2):- pessoa(X), cor(Cor1), cor(Cor2), tem_uma_cor(X,Cor1),
      \+(nao_pode_vestir(X,Cor2)),                /* é um fato que deve ser negado */
      Cor1 \== Cor2 ,                             /*C1 diferente de C2 */
      /* não  pode ter amarelo e  vermelho com  C1  e  C2  e  vice-versa           */
      \+(
         ((Cor1  = vermelho), /*C1 tem  que ser diferente de Vermelho           */
         (Cor2   = amarelo))                                                       /* idem para   amarelo....  */
;                                                                                                                                                                                                                                                             /*                      ;           ou           */
         ((Cor1 =  amarelo) ,                      /*,e ... ocontrário  */
         (Cor2  =  vermelho))
).


ache_tudo :-
veste(X,C1,C2),
write(X),
write(' veste as cores '), write(C1),
write('.... e ....'), write(C2),
nl,
fail.



coresVestimentas :- veste(X,C1,C2), write(X), write(' ====> '), write(C1), write('.. e ..'), write(C2), nl,
          fail.
          ache_tudo.

%% Consulta:
 ache_tudo.
