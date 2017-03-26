:- dynamic prueba/1.

pertenece(X, [X|_R]).
pertenece(X,[_Y|R]):-
	pertenece(X,R).

ultimo(X,[X]).
ultimo(X,[_|R]):-
	ultimo(X,R).

concatenar([],[X|R],[X|R]).
concatenar([X|R], [], [X|R]).
concatenar([X1|R1],[X2|R2],[X1|RR]):-
	concatenar(R1, [X2|R2],RR).

longitud([], 0).
longitud([_X|R], Lon):-
	longitud(R, Aux),
	Lon is 1+Aux.


min([X],X).
min([X|R], X):-
	min(R,MR),
	X<MR.%,!.%
min([X|R], MR):-
	min(R,MR),
	MR<X. %delete this%

	%en la primera definicion agregamos ! para quitae la condicion


	%Negacion
not(P):-
	call(P), !, fail.
not(P).

interseccion([],[X|R],[]).
interseccion([X1|R1],[X2|R2],Res):-
	Res=[X1|RR],
	pertenece(X1,[X2|R2]),
	interseccion(R1, [X2|R2], RR).

interseccion([X1|R1],[X2|R2],Res):-
	not(pertenece(X1, [X2|R2])),
	interseccion(R1, [X2|R2],Res).


union1([X|R],[],[X|R]).
union1([X1|R1],[X2|R2],Res):-
	pertenece(X2,[X1|R1]),
	union1([X1|R1], R2, Res).

union1([X1|R1],[X2|R2],[X2|RR]):-
	not(pertenece(X2, [X1|R1])),
	union1([X1|R1], R2,RR).


diferencia([],_,[]).
diferencia([X|R], [X2|R2], R3):-
	pertenece(X,[X2|R2]),
	diferencia(R, [X2|R2], R3).

diferencia([X|R], [X2|R2], [X|R3]):-
	not(pertenece(X,[X2|R2])),
	diferencia(R,[X2|R2],R3).

termino(1, X, X).
termino(N,X,N-X):-
	N>1.

cuentaRep(_,[],0,[]).
cuentaRep(X,[X|R1], N, R2):-
	cuentaRep(X,R1, M,R2),
        N is M+1.
cuentaRep(X,[Y|R], 0, [Y|R]):-
	X\=Y.


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


sumaAux(N,L1, X,L2):-
	longitud(L,N),
	concatenar(L,L2, L1),
	last(L,X).

sumaPosiciones(_, _, 0).
sumaPosiciones(L,N,S):-
	sumaAux(N,L,X, L1),!,
	sumaPosiciones(L1,N, S1),
	S is X+S1.



escribeLista([]):-nl.
escribeLista([X|Resto]):-
	write(X),
	put(32),
	escribeLista(Resto).



acontecimiento(1505, ['euclides', traducido, al, latin]).
acontecimiento(1523, ['Christian', 'II', huye, de, 'Dinamarca']).

consulta:- write('¿que fecha desea consultar?'),
	put(32),
	read(D),
	acontecimiento(D,S),
	escribeLista(S),
	write('Desea continuar?[S/N]'),
	put(32),
	read(X),
	continuar(X).
continuar('S'):-!,salida.


main:-
	open('hola.txt',read, Str),
	read(Str, H1),
	read(Str, H2),
	read(Str, H3),
	read(Str, H4),
	read(Str, H5),
	close(Str),
	write([H1, H2, H3, H4, H5]), nl.

main2:-
	open('hola.txt', write, Stream),
	write(Stream, 'Howarts'),nl(Stream),
	write(Stream, 'hijo de perra'),
	nl(Stream),
	close(Stream).

%%	lectura y escritura de archivos  %
%%tell(x), told Escritura(write)	%%
%%see(x), seen	 Lectura(read)          %%


prueba:-
	tell('salida.txt'),
	escribeLista([1, 2, 3,[4, 5], 6]),
	told.


pruebaLect:-
	see('casas.txt'),
	read(X),
	write(X),nl,
	read(X2),
	write(X2),nl,
	read(X3),
	write(X3),nl,
	read(X4),
	write(X4),nl,
	read(X5),
	write(X5),nl,
	seen.



prueba(a).
prueba(b).

























