'/* INTEGER.PRO */'.

'/* Arithmetik mit natuerlichen Zahlen */'.

'/* testet natuerliche Zahlen */'.

int(null).
int(suc(X)):-
  int(X).

'/* minus(X,Y,Z) <==> X-Y=Z */'.

minus(X,X,null).
minus(suc(X),Y,suc(Z)):-
  minus(X,Y,Z).

'/* plus(X,Y,Z) <==> X+Y=Z */'.

plus(null,X,X).
plus(suc(X),Y,suc(Z)):-
  plus(X,Y,Z).

'/* times(X,Y,Z) <==> X*Y=Z */'.

times(suc(null),X,X).
times(suc(X),Y,Z):-
  times(X,Y,H),
  plus(Y,H,Z).

'/* power(X,Y,Z) <==> X^Y=Z */'.

power(X,null,suc(null)).
power(X,suc(Y),Z):-
  power(X,Y,H),
  times(X,H,Z).

'/* fac(X,Y) <==> X!=Y */'.

fac(suc(null),suc(null)).
fac(suc(X),Y):-
  fac(X,H),
  times(suc(X),H,Y).

'/* acker(X,Y,Z) <==> ackermann_funktion(X,Y)=Z */'.

acker(null,Y,suc(Y)).
acker(suc(X),null,Z):-
  acker(X,suc(null),Z).
acker(suc(X),suc(Y),Z):-
  acker(suc(X),Y,H),
  acker(X,H,Z).
