% Programa ex015.pl
%
% Prof. Ausberto S. Castro Vera
% Disciplina : Paradigmas de Ling. de Programacao
% UENF-CCT-LCMAT-CC
% Date: 25 setembro de 2022
% Aluno: Rômulo Souza Fernandes
%------------- FATOS  -----------------------
genitor(lola,rick).
genitor(miro,rick).
genitor(miro,mari).
genitor(rick,lia).
genitor(rick,joy).
genitor(joy,tomas).
mulher(lola).
mulher(mari).
mulher(lia).
mulher(joy).
homem(miro).
homem(rick).
homem(tomas).

%------------- REGRAS -----------------------

prole(X,Y):-genitor(X,Y).
mae(X,Y):-genitor(X,Y),mulher(X).
pai(X,Y):-genitor(X,Y),homem(X).
avos(X,Z):-genitor(X,Y),genitor(Y,Z).
irma(X,Y):-genitor(Z,X),genitor(Z,Y),mulher(X),not(X=Y).
descendente(X,Z):-genitor(X,Z).
descendente(X,Z):-genitor(X,Y),descendente(Y,Z).
