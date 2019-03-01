maior([X],X).
maior([P|R],Maior) :- maior(R,M2), (   P>=M2, Maior = P
                                   	 ; M2 > P, Maior = M2
                                   ).
ultimo([X],X).
ultimo([_|R],ULT) :- ultimo(R,ULT).

semUltimo([_],[]).
semUltimo([P|R],[P|RESTO]) :- semUltimo(R,RESTO).

intercalando([],[],_).
intercalando(L1,L2) :- intercalando(L1,L2,1).
intercalando([_|R],R2,ACC) :- ACCX is ACC+1, mod(ACC,2) =\=1, intercalando(R,R2,ACCX).
intercalando([P|R],[P|R2],ACC) :- ACCX is ACC+1, mod(ACC,2) =:=1, intercalando(R,R2,ACCX).


soPositivos([],_).
soPositivos([P|R],R2) :- P < 0, soPositivos(R,R2).
soPositivos([P|R],[P|R2]) :- P >= 0, soPositivos(R,R2).


ordemCrescente([]).
ordemCrescente([_]).
ordemCrescente([P,S|R]) :- P =< S, ordemCrescente([S|R]).

insere(E,[],[E]).
insere(E,[P1|R1],[P1|R2]):- insere(E,R1,R2).

shiftRight([],[]).
shiftRight([_],[_]).
shiftRight(L,[ULT|REST]):- ultimo(L,ULT),semUltimo(L,REST).


inversa([],Z,Z).
inversa([H|T],Z,ACC):- inversa(T,Z,[H|ACC]).
inversa(L1,RES) :- inversa(L1,RES,[]).

quantasVezes([],_,0).
quantasVezes([P|R],E,VEZES):- P == E, quantasVezes(R,E,VEZESX), VEZES is VEZESX+1.
quantasVezes([P|R],E,VEZES):- P =\= E, quantasVezes(R,E,VEZES).


fatorial(1,1).
fatorial(0,1).
fatorial(X,R):- X2 is X-1, fatorial(X2,P), R is X*P.

posicoesItem(_,[],_,_).
posicoesItem(E,[P|R],[ACC|RES],ACC):- P =:= E, ACCX is ACC+1, posicoesItem(E,R,RES,ACCX).
posicoesItem(E,[P|R],RES,ACC):- P =\= E, ACCX is ACC+1, posicoesItem(E,R,RES,ACCX).
posicoesItem(E,L,Resposta):- posicoesItem(E,L,Resposta,0).


posicaoItem([],_,_,-1).
posicaoItem([P|R],E,ACC,RES) :- P=\=E, ACCX is ACC+1, posicaoItem(R,E,ACCX,RES).
posicaoItem([P|_],E,ACC,ACC) :- P=:=E.
posicaoItem(L,E,RES):- posicaoItem(L,E,0,RES).


remove([],_,_).
remove([P|R],E,RES):- P=:= E, remove(R,E,RES).
remove([P|R],E,[P|RES]) :- P=\=E, remove(R,E,RES).


replace([],_,_,_).
replace([P|R],E,N,[N|RES]):- P=:=E, replace(R,E,N,RES).
replace([P|R],E,N,[P|RES]):- P=\=E,replace(R,E,N,RES).
