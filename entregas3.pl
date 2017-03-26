pertenece(X, [X|_R]).
pertenece(X,[_Y|R]):-
	pertenece(X,R).

termino(1, X, X).
termino(N,X,N-X):-
	N>1.

cuentaRep(_,[],0,[]).
cuentaRep(X,[X|R1], N, R2):-
	cuentaRep(X,R1, M,R2),
        N is M+1.
cuentaRep(X,[Y|R], 0, [Y|R]):-
	X\=Y.

concatenar([],[X|R],[X|R]).
concatenar([X|R], [], [X|R]).
concatenar([X1|R1],[X2|R2],[X1|RR]):-
	concatenar(R1, [X2|R2],RR).

sumaAux(N,L1, X,L2):-
	length(L,N),
	concatenar(L,L2, L1),
	last(L,X).


longitud([], 0).
longitud([_X|R], Lon):-
	longitud(R, Aux),
	Lon is 1+Aux.


union1([X|R],[],[X|R]).
union1([X1|R1],[X2|R2],Res):-
	pertenece(X2,[X1|R1]),
	union([X1|R1], R2, Res).

union1([X1|R1],[X2|R2],[X2|RR]):-
	not(pertenece(X2, [X1|R1])),
	union([X1|R1], R2,RR).


interseccion([],[X|R],[]).
interseccion([X1|R1],[X2|R2],Res):-
	Res=[X1|RR],
	pertenece(X1,[X2|R2]),
	interseccion(R1, [X2|R2], RR).

interseccion([X1|R1],[X2|R2],Res):-
	not(pertenece(X1, [X2|R2])),
	interseccion(R1, [X2|R2],Res).


diferencia([],_,[]).
diferencia([X|R], [X2|R2], R3):-
	pertenece(X,[X2|R2]),
	diferencia(R, [X2|R2], R3).

diferencia([X|R], [X2|R2], [X|R3]):-
	not(pertenece(X,[X2|R2])),
	diferencia(R,[X2|R2],R3).


clasificaRep([],[]).
clasificaRep([X|L1], [T|L2]):-
	cuentaRep(X, [X|L1], N, L3),
	termino(N,X,T),
	clasificaRep(L3,L2).


decodifica([],[]).
decodifica([1-X|R1], [X|R2]):-
	!,
	decodifica(R1,R2).

decodifica([N-X|R1], [X|R2]):-
	!,
	N1 is N-1,
	decodifica([N1-X|R1], R2).

decodifica([X|R1],[X|R2]):-
	decodifica(R1,R2).


sumaPosiciones(_, _, 0).
sumaPosiciones(L,N,S):-
	sumaAux(N,L,X, L1),!,
	sumaPosiciones(L1,N, S1),
	S is X+S1.


crecimiento([X1,X2],[X1,+,X2]):-
	X2 < X1.
crecimiento([X1,X2],[X1,-,X2]):-
	X2 >= X1.
crecimiento([X1,X2|R],[X1,-|Res]):-
	X2 >= X1,
	crecimiento([X2|R],Res).
crecimiento([X1,X2|R],[X1,+|Res]):-
	X2 < X1,
	crecimiento([X2|R], Res).
