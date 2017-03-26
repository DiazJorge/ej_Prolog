mujer(alma).
mujer(ana).
mujer(carmen).
mujer(juana).
mujer(marisol).
mujer(rosa).
mujer(alexa).
mujer(maria).
mujer(itzel).
mujer(lupita).
hombre(juan).
hombre(pedro).
hombre(mario).
hombre(alberto).
hombre(carlos).
hombre(oscar).
hombre(luis).
hombre(antonio).
hombre(alex).
hombre(axel).
numero(0).
numero(1).
numero(2).
numero(3).
numero(4).
numero(5).
numero(6).
numero(7).
numero(8).
numero(9).
vocales(a).
vocales(e).
vocales(i).
vocales(o).
vocales(u).




alguienMujer([X|_R]):-
	mujer(X).

alguienMujer([_X|R]):-
	alguienMujer(R).

alguienHombre([X|_R]):-
	hombre(X).
alguienHombre([_X|R]):-
	alguienHombre([R]).


todosMujer([]).
todosMujer([X|R]):-
	mujer(X), todosMujer(R).

todosHombre([]).
todosHombre([X|R]):-
	hombre(X), todosHombre(R).



todosIguales([]).
todosIguales([X,X]).
todosIguales([X,X|RR]):-
	todosIguales([X|RR]).


eliminaE([], _E, []).
eliminaE([X|R], X,R).
eliminaE([X|R],E,Resul):-
	X\=E,
	eliminaE(R,E,RR),
	Resul=[X|RR].


eliminaRepC([],[]).
eliminaRepC([X],[X]).
eliminaRepC([X,Y|R],Res):-
	X=Y,
	eliminaRepC([Y|R],Res).
eliminaRepC([X,Y|R], [X|Res]):-
	X\=Y,
	eliminaRepC([Y|R],Res).

concatenar([],[X|R],[X|R]).
concatenar([X|R], [], [X|R]).
concatenar([X1|R1],[X2|R2],[X1|RR]):-
	concatenar(R1, [X2|R2],RR).


inserta(E,[X|R], [E|[X|R]]).
inserta(E,[],[E]).
inserta(E,[X|R], [X|RR]):-
	inserta(E,R, RR).



selecciona([X|_R],X).
selecciona([_X|R],E):-
	selecciona(R, E).

%
%permutaciones([X|R], L).
%permutaciones([X|R], L):-
%

longitud([], 0).
longitud([_X|R], Lon):-
	longitud(R, Aux),
	Lon is 1+Aux.


maxList([X], X).
maxList([X|R], M):-
	M=X,
	maxList(R, Aux),
	M>Aux.

max([X],X).
max([X|R],X):-max(R,MaxR),
	X>MaxR.
max([X|R],MaxR):-
	max(R,MaxR),
	MaxR>X.


sumalista([X], X).

sumaLista([X|R],S):-
	sumaLista(R,Aux),
	S is X+Aux.

ordenada([_X]).
ordenada([X,Y|R]):-
	X<Y,
	ordenada([Y|R]).

cuentaRep([_X],NR):-
	 NR is 1.

cuentaRep([X,X|R],NR):-
	cuentaRep([X|R],Num),
	NR is Num+1.

cuentaRep([X,Y|R],N):-
	X\=Y,
	cuentaRep([Y|R],N).

cuentaVocales([_X],C):-
	C is 1.

cuentaVocales([X|R],C):-
	vocales(X),
	cuentaVocales(R,AUX),
	C is AUX+1.

cuentaVocales([X|R],C):-
	not(vocales(X)),
	cuentaVocales(R,C).

enckesimo([X|_R],1,X).

enckesimo([_X|R],Num,E):-
	Aux is Num-1,
	enckesimo(R,Aux,E).

desde([X|R],1,[X|R]).

desde([_X|R],Num,L):-
	Aux is Num-1,
	desde(R,Aux,L).

hasta([X|R],1,[X|R]).

hasta([X|R],Num,[X|L]):-

	Aux is Num-1,
	hasta(R,Aux,L).

