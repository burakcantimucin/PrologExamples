ogrenci(isim(burak, ozozan), [hfttf101, yzm108, yzm148, yzm270]).
ogrenci(isim(bilge, aric), []).
ogrenci(isim(eser, kuter), [hfttf101, yzm108]).
ogrenci(isim(can, alptekin), [hfttf101, yzm108, hfttf246]).
ogrenci(isim(emine, ozozan), [hfttf101, yzm108, yzm148, hfttf246]).

onkosul(yzm108, []).
onkosul(yzm148, [yzm108, hfttf101]).
onkosul(yzm238, [yzm148]).
onkosul(yzm260, [yzm108]).
onkosul(yzm270, [yzm148]).
onkosul(yzm310, [[yzm260, yzm270], [cs107, cs205, cs255]]).
onkosul(yzm324, [[yzm148], [yzm238, hfttf246]]).

%YUKLEMLER

%1. YUKLEM
ders_almak(X,C):- ogrenci(isim(X,_),L), member(C,L).

%2. YUKLEM
onkosul_mu(X,Y):- onkosul(X, L), yardimci_onkosul(Y,L).
yardimci_onkosul(H,[H|_]). 
yardimci_onkosul(X,[Y|_]):- is_list(Y),member(X,Y). 
yardimci_onkosul(X,[Y|T]):- X\=Y, yardimci_onkosul(X,T). 

%3. YUKLEM
ders_alabilirmi(X,Y):- not(ders_almak(X,Y)), butun_onkosula_sahip_mi(X,Y).
butun_onkosula_sahip_mi(X,Y):-onkosul(Y,L), yardimci_onkosul(X,L).
yardimci_onkosul(_,[]).
yardimci_onkosul(X,[H|T]):- alinan_bir_ders(X,H), yardimci_onkosul(X,T).
alinan_bir_ders(X,C):- not(is_list(C)), ders_almak(X,C).
alinan_bir_ders(X,[H|T]):- ders_almak(X,H); alinan_bir_ders(X,T).

%4. YUKLEM
ders_alma_listesi(_,[]).
ders_alma_listesi(X,[H|T]):- ders_alabilirmi(X,H), ders_alma_listesi(X,T).

%5. YUKLEM
alinan_tum_dersler(L):- findall(X, ogrenci(isim(X,_),_),L).

%6. YUKLEM
alinan_tum_dersler(Result):- findall(L, ogrenci(isim(_,_),L), [H|T]), 
                            elemanlari_al(T,H,Result).
elemanlari_al([],A,A).
elemanlari_al([H|T],Acc, R):- elemanlari_al1(H,Acc,R1), elemanlari_al(T,R1,R).
elemanlari_al1([],A,A).
elemanlari_al1([H|T], Acc, R):- member(H,Acc), elemanlari_al1(T, Acc, R).
elemanlari_al1([H|T], Acc, R):- not(member(H,Acc)),elemanlari_al1(T,[H|Acc],R).