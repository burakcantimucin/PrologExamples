oldurulmus(X, Y, Gun) :- gudu(X, Y),tabanca_sahibi(X),olay_yerinde_olmak(X, Gun).

olay_yerinde_olmak(X, Gun) :- olay_yerinde_olmamak(X, Y, Gun), guvenilmez(Y).
olay_yerinde_olmak(X, Gun) :- not(olay_yerinde_olmamak(X, _, Gun)).

gudu(X, Y) :- cikarci(X, Y);oc_alma(X, Y).

cikarci(X, Y) :- servetten_faydalanma(X, Y);borclu(X, Y);cinayeti_gorme(X, Y).

olay_yerinde_olmamak(alp, berrin, sali).
olay_yerinde_olmamak(erdem, berrin, sali).
olay_yerinde_olmamak(nur, alp, sali).

guvenilmez(gokhan).

oc_alma(erdem, ozan).
oc_alma(alp, ozan).

servetten_faydalanma(berrin, ozan).
servetten_faydalanma(ozan, nur).

borclu(nur, ozan).
borclu(alp, ozan).

cinayeti_gorme(gokhan, ozan).

tabanca_sahibi(alp).
tabanca_sahibi(nur).
tabanca_sahibi(gokhan).

katil(X) :- oldurulmus(X, ozan, sali).