oyna(1,X,Y,_) :-
    write(X),
    write(" çubugunun en üstteki diskini "),
    write(Y),
    write(" diskine koy."),
    nl.

oyna(N,X,Y,Z) :-
    N>1,
    M is N-1,
    oyna(M,X,Z,Y),
    oyna(1,X,Y,_),
    oyna(M,Z,Y,X).