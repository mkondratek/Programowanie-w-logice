mezczyzna(jacek).
mezczyzna(michal).
mezczyzna(karol).
mezczyzna(czarek).
mezczyzna(roman).
mezczyzna(witold).
mezczyzna(franek).
mezczyzna(mariusz).
mezczyzna(onufry).

kobieta(ala).
kobieta(ola).
kobieta(magda).
kobieta(wanda).
kobieta(kunegunda).
kobieta(zuzanna).
kobieta(aneta).
kobieta(ewa).
kobieta(nina).

dziecko(ola, ala).
dziecko(magda, ala).
dziecko(michal, ala).
dziecko(ola, jacek).
dziecko(magda, jacek).
dziecko(michal, jacek).

dziecko(czarek, wanda).
dziecko(roman, wanda).
dziecko(czarek, karol).
dziecko(roman, karol).

dziecko(franek, witold).
dziecko(kunegnuda, witold).
dziecko(franek, zuzanna).
dziecko(kunegnuda, zuzanna).

dziecko(onufry, magda).
dziecko(aneta, magda).
dziecko(onufry, mariusz).
dziecko(aneta, mariusz).

dziecko(ewa, ola).
dziecko(nina, ola).
dziecko(ewa, onufry).
dziecko(nina, onufry).

syn(X, Y) :- mezczyzna(X), dziecko(X, Y).
corka(X, Y) :- kobieta(X), dziecko(X, Y).
wnuk_lub_wnuczka(X, Y) :- dziecko(X, Z), dziecko(Z, Y).
wnuk(X, Y) :- mezczyzna(X), wnuk_lub_wnuczka(X, Y).
dziadek(X, Y) :- mezczyzna(X), wnuk_lub_wnuczka(Y, X).
dziadek(X) :- dziadek(X, _).
potomek(X, Y) :- dziecko(X, Y); (dziecko(Z, Y), potomek(X, Z)).

% Czy Karol jest mężczyzną?
?- mezczyzna(karol).
% Czy Zuzanna jest kobietą?
?- kobieta(zuzanna).
% Czyim dzieckiem jest Onufry?
?- dziecko(onufry, X).
% Jakie córki ma Jacek?
?- dziecko(X, jacek), kobieta(X).
% Wypisz wszystkie pary Dziadek-Wnuk
?- dziadek(X, Y), mezczyzna(Y).
% Wypisz wszystkich potomków Magdy.
?- potomek(X, magda).
% Uwaga: W trzech ostatnich przykładach nie trzeba definiować predykatu,
% który zwraca wszystkie np. wszystkie córki Jacka na raz.
% Wystarczy zdefiniować predykat zwracający jedną córkę i uzyskać wszystkie wyniki dla tego predykatu (naciskając średnik)
