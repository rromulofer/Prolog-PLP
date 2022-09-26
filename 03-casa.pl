% Programa casa.pl
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
lugar(sala).
lugar(cozinha).
lugar(escritorio).
lugar(corredor).
lugar('sala de jantar').
lugar(celeiro).
lugar(jardim).

lugar(banheiro).
lugar(quarto).
lugar(varanda).

porta(escritorio, corredor).
porta(cozinha, escritorio).
porta(corredor, 'sala de jantar').
porta(cozinha, celeiro).
porta('sala de jantar', cozinha).

porta(banheiro, quarto).
porta(quarto, corredor).
porta(cozinha, varanda).

localizacao(escrivaninha, escritorio).
localizacao(laranja, cozinha).
localizacao(lanterna, escrivaninha).
localizacao('maq de lavar', celeiro).
localizacao(sabao, 'maq de lavar').
localizacao(verdura, cozinha).
localizacao(faca, cozinha).
localizacao(panela, cozinha).
localizacao(arroz, cozinha).
localizacao(uva, cozinha).
localizacao(biscoitos, cozinha).
localizacao(computador, escritorio).
localizacao(mesa,'sala de jantar').

localizacao(escova,banheiro).
localizacao(shampoo,banheiro).
localizacao(espelho,banheiro).
localizacao(toalha,banheiro).

localizacao(cama,quarto).
localizacao(camisa,quarto).
localizacao(calca,quarto).
localizacao(perfume,quarto).

localizacao(cadeira,varanda).
localizacao(churrasqueira,varanda).
localizacao(rede,varanda).
localizacao(mesa,varanda).

comestivel(laranja).
comestivel(biscoitos).
comestivel(arroz).
comestivel(uva).
comestivel(lasanha).
comestivel(frango).

gosto_amargo(verdura).

estamos_em(cozinha).
estamos_em(sala).
estamos_em(escritorio).
estamos_em(corredor).
estamos_em('sala de jantar').
estamos_em(celeiro).
estamos_em(jardim).

%%---------------  REGRAS --------------------
conectar(X,Y) :- porta(X,Y).
conectar(X,Y) :- porta(Y,X).

lista_coisas(Lugar) :-
           localizacao(X, Lugar),
           tab(2),
           write(X),
           nl,
           fail.
           lista_coisas(Nestelugar).

lista_portas(Lugar) :-
           conectar(Lugar, X),
           tab(2),
           write(X),
           nl,
           fail.
           lista_portas(_).

observar :- estamos_em(Lugar),
            write('Voce esta na '), write(Lugar), nl,
            write('Voce pode ver:'), nl,
            lista_coisas(Lugar),
            write('Voce pode ir para:'), nl,
            lista_portas(Lugar).


mover(Lugar):- retract(estamos_em(X)), asserta(estamos_em(Lugar)).

posso_ir(Lugar):- estamos_em(X), conectar(X, Lugar).
posso_ir(Lugar):- write('Voce nao pode ir de aqui para '), write(Lugar), nl, fail.

goto(Lugar):- posso_ir(Lugar), mover(Lugar), observar.

estou(Lugar):-
estamos_em(Lugar),
write('Voce esta na '), write(Lugar), nl,
write('Voce pode ver:'), nl,
lista_coisas(Lugar),
write('Voce pode ir para:'), nl,
lista_portas(Lugar).
alimentos(X):- comestivel(X),localizacao(X,cozinha).
encontrar_objeto(X):-porta(K,cozinha),localizacao(X,K).
