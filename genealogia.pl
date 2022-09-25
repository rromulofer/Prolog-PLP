% Programa genealogia.pl
%
% Prof. Ausberto S. Castro Vera
% Disciplina : Paradigmas de Ling. de Programacao
% UENF-CCT-LCMAT-CC
% Date: 25 setembro de 2022
% Aluno: Rômulo Souza Fernandes
%-------------------------------------------------
%    Ver mapa da casa
%
%------------- FATOS  -----------------------

homem(jose).
homem(joao).
homem(carlos).
homem(mario).
homem(yuri).

mulher(ana).
mulher(maria).
mulher(helena).
mulher(joana).

progenitor(jose,joao).
progenitor(jose,ana).
progenitor(maria,joao).
progenitor(maria,ana).
progenitor(ana,helena).
progenitor(ana,joana).
progenitor(joao,mario).
progenitor(helena,carlos).
progenitor(mario,carlos).
progenitor(carlos,yuri).

sexo(jose,masculino).
sexo(joao,masculino).
sexo(carlos,masculino).
sexo(mario,masculino).
sexo(yuri,masculino).

sexo(ana,feminino).
sexo(maria,feminino).
sexo(helena,feminino).
sexo(joana,feminino).



%------------- REGRAS  ---------------------

pai(X,Y) :- sexo(X,masculino), progenitor(X,Y).
mae(X,Y) :- sexo(X,feminino), progenitor(X,Y).

filho(X,Y) :- sexo(X,masculino) , progenitor(Y,X).
filha(X,Y) :- sexo(X,feminino), progenitor(Y,X).

irmao(X,Y) :- sexo(X,masculino), progenitor(Z,Y), progenitor(Z,X) , X \== Y.
irma(X,Y) :- sexo(X,feminino), progenitor(Z,Y),progenitor(Z,X), X \== Y.

primo(X,Y) :- sexo(X,masculino), progenitor(Z,X), irmao(Z,P), progenitor(P,Y).
prima(X,Y) :- sexo(X, feminino), progenitor(Z,X), irma(Z,P), progenitor(P,Y).

tio(X,Y)   :- sexo(X,masculino) ,  progenitor(P,Y),  irmao(P,X).
tia(X,Y)   :- sexo(X,feminino), progenitor(P,Y),  irma(P,X).

primo(X,Y):-progenitor(Z,X),progenitor(K,Y),irmao(Z,K),sexo(X,masculino), X\==Y.
prima(X,Y):-progenitor(Z,X),progenitor(K,Y),irmao(Z,K),sexo(X,feminino), X\==Y.

avô(X,Y)   :- sexo(X,masculino), progenitor(X,P), progenitor(P,Y).
avó(X,Y)   :- sexo(X,feminino), progenitor(X,P), progenitor(P,Y).

descendente(X,Y):- progenitor(X,Y).

descendente(X,Y) :- progenitor(X,P) , descendente(P,Y).
