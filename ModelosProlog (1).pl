materia(nombre,cantClases).
materia('Modelos 1',32).
materia('Modelos 2',32).
materia('Gestion Tecnologica',32).

estudiante(nombre,materia,notaPrimero,notaSegundo,notaTercer).
estudiante('Maria','Modelos 1',40,35,50).
estudiante('Nelly','Modelos 2',30,50,40).
estudiante('Maren','Gestion tecnologica',30,45,20).
estudiante('Elizabeth','Modelos 1',35,45,30).
estudiante('Samantha','Modelos 2',20,40,35).
estudiante('Jorge','Gestion tecnologica',25,45,35).
estudiante('Omar','Modelos 1',20,35,30).
estudiante('Daniel','Modelos 2',15,40,45).
estudiante('Andrea','Gestion tecnologica',0,45,50).
estudiante('Juan','Modelos 1',10,40,50).
estudiante('Valeria','Modelos 2',25,35,30).
estudiante('Youssef','Gestion tecnologica',37,40,50).

fecha(dia,mes,año).
fallas(nombre,materia,fecha).
fallas('Maria','Modelos 1',[fecha(2,8,19),fecha(5,8,19),fecha(1,8,19),fecha(15,8,19),fecha(20,8,19),fecha(25,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19),fecha(15,8,19)]).
fallas('Nelly','Modelos 2',[fecha(4,8,19),fecha(9,8,19)]).
fallas('Maren','Gestion tecnologica',[fecha(9,8,19),fecha(13,8,19)]).
fallas('Elizabeth','Modelos 1',[]).
fallas('Samantha','Modelos 2',[fecha(2,8,19),fecha(5,8,19)]).
fallas('Jorge','Gestion tecnologica',[fecha(2,8,19),fecha(5,8,19)]).
fallas('Omar','Modelos 1',[fecha(3,8,19),fecha(4,8,19),fecha(7,8,19),fecha(8,8,19),fecha(10,8,19),fecha(13,8,19),fecha(18,8,19),fecha(22,8,19),fecha(24,8,19),fecha(30,8,19)]).
fallas('Daniel','Modelos 2',[fecha(5,8,19),fecha(20,8,19)]).
fallas('Andrea','Gestion tecnologica',[fecha(17,8,19),fecha(25,8,19)]).
fallas('Juan','Modelos 1',[fecha(12,8,19),fecha(30,8,19)]).
fallas('Valeria','Modelos 2',[fecha(10,8,19),fecha(27,8,19)]).
fallas('Youssef','Gestion tecnologica',[]).

longitud([],0).
longitud([_|T],N):-longitud(T,N0),N is N0 + 1.

%numFallas(F):-findall(FA,fallas(),F).

aprueba(X,Y,N):-estudiante(X,Y,Z,W,T),R is Z*0.35, P is W*0.35, Q is T*0.30, N is(R+P+Q), N>30, regla(X,Y,_).

regla(X,Y,N) :- fallas(X,Y,L),  longitud(L,N), materia(Y,A), N<(A*0.3).





