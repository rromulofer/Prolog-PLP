%  Arquivo:  05-geografia.pl
%
% Prof. Ausberto S. Castro Vera
% Disciplina : Paradigmas de Ling. de Programacao
% UENF-CCT-LCMAT-CC
% Date: 25 setembro 2022
% Aluno: R�mulo Souza Fernandes
%-------------------------------------------------
% Geografia
%
%--------------  FATOS ---------------------------
capital(brasilia, brasil).
capital(brasilia, america_do_sul).
capital(lima, peru).
capital(lima, america_do_sul).
capital(santiago, chile).
capital(quito, equador).
capital(montevideo, uruguai).
capital(bogota, colombia).
capilat(lapaz, bolivia).
capital(buenosaires, argentina).
capital(caracas, venezuela).

esta_em(lima, peru).
esta_em(saopaulo,brasil).
esta_em(medellin,colombia).
esta_em(portoalegre,brasil).
esta_em(campos,brasil).
esta_em(riodejaneiro,brasil).
esta_em(niteroi,brasil).
esta_em(macae,brasil).
esta_em(petropolis,brasil).
esta_em(volta_redonda,brasil).
esta_em(brasilia,brasil).
esta_em(recife,brasil).
esta_em(fortaleza,brasil).
esta_em(campinas,brasil).
esta_em(curitiba,brasil).
esta_em(arica,chile).
esta_em(guayaquil,equador).


limita_com(peru,brasil).
limita_com(bolivia,brasil).
limita_com(chile,peru).
limita_com(peru,chile).
limita_com(equador,peru).
limita_com(peru,equador)

%-------------- REGRAS ---------------------------

viagem_nacional(X,Y):- esta_em(X,K),esta_em(Y,K).
viagem_internacional(X,Y) :- esta_em(X,K),esta_em(Y,Z),not(K=Z).
