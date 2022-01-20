queen(N,Y):-
  makeList(N,X),
  permute(X,P),
  safe(P),
  nice(P,Y,1).

makeList(1,[1]):-!.
makeList(N,[N|T]):-
  sub(N,1,N1),
  makeList(N1,T).

permute([],[]).
permute([H|T],X):-
  permute(T,Y),
  extract(H,X,Y).

extract(H,[H|T],T).
extract(H,[X|Y],[X|Z]):-
  extract(H,Y,Z).

safe([_]).
safe([H|T]):-
  check(1,H,T),
  safe(T).

check(_,_,[]).
check(D,Y,[Y1|T]):-
  add(D,1,D1),
  add(D,Y,Yh),
  add(D,Y1,Y1h),
  ne(Y,Y1h),
  ne(Yh,Y1),
  check(D1,Y,T).

nice([],[],_).
nice([H|T],[coord(X,H)|Y],X):-
  add(X,1,X1),
  nice(T,Y,X1).

nicePrint([]):-
  nl,!.
nicePrint([coord(X,H)|T]):-
  write('('),
  write(X),
  write(','),
  write(H),
  write(') '),
  nicePrint(T).

q(1):-!,
  fail.
q(X):-
  write('The '),
  write(X),
  write(' queens problem.'),
  nl,
  nl,
  queen(X,H),
  write('Solution: '),
  nicePrint(H),
  fail.
q(_):-
  nl,
  write('That''s it!'),
  put(7),
  nl,
  nl,
  fail.

ne(X,X):-!,
  fail.
ne(_,_).
