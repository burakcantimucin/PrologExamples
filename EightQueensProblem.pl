cozum(_, []).
cozum(N, [X/Y|Others]) :-
    cozum(N, Others),
    between(1, N, Y),
    saldirisiz(X/Y, Others).

saldirisiz(_,[]).
saldirisiz(X/Y, [X1/Y1 | Others]) :-
    Y =\= Y1,
    Y1-Y =\= X1-X,
    Y1-Y =\= X-X1,
    saldirisiz( X/Y, Others).

template(N, L) :-
    findall(I/_, between(1,N,I), L).