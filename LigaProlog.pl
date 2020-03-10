equipo(nombre, ciudad).
partido(local,visitante, golLocal, golVisitante).

partido(equipo(nombre('Millonarios'),ciudad('Bogota')),equipo(nombre('Santa Fe'),ciudad('Bogota')),golLocal(0),golVisitante(0)).
partido(equipo(nombre('Millonarios'),ciudad('Bogota')),equipo(nombre('Nacional'),ciudad('Medellin')),golLocal(0),golVisitante(2)).
partido(equipo(nombre('Millonarios'),ciudad('Bogota')),equipo(nombre('Medellin'),ciudad('Medellin')),golLocal(0),golVisitante(3)).
partido(equipo(nombre('Santa Fe'),ciudad('Bogota')),equipo(nombre('Millonarios'),ciudad('Bogota')),golLocal(10),golVisitante(0)).
partido(equipo(nombre('Santa Fe'),ciudad('Bogota')),equipo(nombre('Nacional'),ciudad('Medellin')),golLocal(4),golVisitante(4)).
partido(equipo(nombre('Santa Fe'),ciudad('Bogota')),equipo(nombre('Medellin'),ciudad('Medellin')),golLocal(0),golVisitante(5)).
partido(equipo(nombre('Nacional'),ciudad('Medellin')),equipo(nombre('Millonarios'),ciudad('Bogota')),golLocal(2),golVisitante(4)).
partido(equipo(nombre('Nacional'),ciudad('Medellin')),equipo(nombre('Santa Fe'),ciudad('Bogota')),golLocal(4),golVisitante(0)).
partido(equipo(nombre('Nacional'),ciudad('Medellin')),equipo(nombre('Medellin'),ciudad('Medellin')),golLocal(4),golVisitante(1)).
partido(equipo(nombre('Medellin'),ciudad('Medellin')),equipo(nombre('Millonarios'),ciudad('Bogota')),golLocal(2),golVisitante(2)).
partido(equipo(nombre('Medellin'),ciudad('Medellin')),equipo(nombre('Santa Fe'),ciudad('Bogota')),golLocal(1),golVisitante(5)).
partido(equipo(nombre('Medellin'),ciudad('Medellin')),equipo(nombre('Nacional'),ciudad('Medellin')),golLocal(5),golVisitante(3)).

ganaPartido(X,Y,Z) :- partido(equipo(nombre(X),_),_,golLocal(Y),golVisitante(A)), Y>A ; partido(_,equipo(nombre(X),_),golLocal(B),golVisitante(Z)), Z>B.
empataPartido(X,Y,Z) :- partido(equipo(nombre(X),_),_,golLocal(Y), golVisitante(A)), Y=A ; partido(_,equipo(nombre(X),_),golLocal(B),golVisitante(Z)), B=Z.
pierdePartido(X,Y,Z) :- partido(equipo(nombre(X),_),_,golLocal(Y), golVisitante(A)), Y<A ; partido(_,equipo(nombre(X),_),golLocal(B),golVisitante(Z)), Z<B.

gana(E,L):- findall([X,E], ganaPartido(E,X,X),L).
empata(E,L):-findall([X,E], empataPartido(E,X,X),L).
pierde(E,L):-findall(X, pierdePartido(E,X,X),L).

longitud([],0).
longitud([_|T],N):-longitud(T,N0), N is N0 + 1.

puntosT(E,T):-gana(E,L),longitud(L,N), M is N*3, empata(E,F),longitud(F,O), T is M+O.

tablaX(E,Tab):-findall([E,T],puntosT(E,T), Tab).







