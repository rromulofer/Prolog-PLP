% programa  02-familia-B.pl
%
% Prof. Ausberto S. Castro Vera
% Disciplina : Paradigmas de Ling. de Programacao
% UENF-CCT-LCMAT-CC
% Date: 25 setembro 2022
% Aluno: Rômulo Souza Fernandes
%-------------------------------------------------
 % FATOS

    mulher(luisa).  % significa luisa é uma mulher
    mulher(eva).
    mulher(martha).
    homem(adam).
    homem(pedro).
    homem(paulo).
    pai(adam,pedro). % significa adam é pai de pedro
    pai(adam,paulo).
    marido(adam,eva).
    esposa(eva,adam).
    mae(eva,luisa).
    mae(eva,pedro).
    filha(maria,eva).
    filha(luisa,adam).
    filha(suzana,martha).
    irma(eva,martha).



 % REGRAS

    filho(F,P):-homem(F),pai(P,F).
    filho(F,M):-homem(F),mae(M,F).
    
    filha(F,P):-mulher(F),pai(P,F).
    filha(F,M):-mulher(F),mae(M,F).

% Completar as regras:
    irma(X,Y) :- progenitor(A,X), progenitor(A,Y),not(X=Y),mulher(X).
    irmao(X,Y) :-progenitor(A,X), progenitor(A,Y),not(X=Y),homem(X).

    prima(A,B) :- progenitor(T,X),progenitor(T,Y),progenitor(X,A),progenitor(Y,B),mulher(A).
    tia(A,B) :- progenitor(K,T),progenitor(K,A),progenitor(T,B),mulher(A).
    
