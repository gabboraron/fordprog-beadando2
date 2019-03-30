# Feladat: szintaktikus elemző elkészítése

- a programnak parancssori paraméterben lehessen megadni az elemzendő fájl nevét
- a program minden alkalmazott szabályhoz egy sort írjon a képernyőre, például
````lex
        ertekadas -> azonosito ERTEKADAS kifejezes PONTOSVESSZO
        utasitas -> ertekadas
        ...
````
- szintaktikus hiba észlelése esetén hibajelzést kell adni, és a fordítóprogram visszatérési értéke `1` legyen (azaz `exit(1)` utasítást kell végrehajtani a hibajelzés után)
- ha a forrásfájl szintaktikusan helyes, akkor a fordítóprogram visszatérési értéke legyen `0` (azaz `return 0` utasítással fejeződjön be)
- a tesztfájlok közül a `lexikalis_hibas` és `szintaktikus_hibas` kiterjesztésű fájlokra kell hibát jelezni, a többit el kell fogadni.

## A program felépítése

A program szignatúrából, deklarációs részből, törzsből és befejezésből áll. A szignatúra tartalma: `program `*`név`*, ahol a *név* tetszőleges azonosító. A szignatúrát a deklarációs rész követi, majd `begin` kulcsszó vezeti be a törzset. A deklarációs rész lehet üres is. A törzs legalább egy utasítást tartalmaz. A befejezést az `end` kulcsszó jelzi.

### Változódeklarációk

Minden változót *`típus név ;`* alakban kell deklarálni, több azonos típusú változó esetén mindegyiket külön-külön.

### Kifejezések
- `natural` típusú kifejezések: számkonstansok, natural típusú változók és az ezekből a `+` (összedás), `-` (kivonás), `*` (szorzás), `div` (egészosztás), `mod` (maradékképzés) infix operátorokkal és zárójelekkel felépített kifejezések.
- `boolean` típusú kifejezések: `true` és `false`, `boolean` típusú változók, és két `natural` típusú kifejezésből az `=` (egyenlőség), `<` (kisebb), `>` (nagyobb) infix operátorral, valamint a boolean típusú kifejezésekből az `and` (konjunkció), `or` (diszjunkció), `=` (egyenlőség) *infix* és a `not` (negáció) *prefix* operátorral és zárójelekkel felépített kifejezések.
- Az infix operátorok mind balasszociatívak és a precedenciájuk növevő sorrendben a következő:
-        `and` `or`
-        `=`
-        `<` `>`
-        `+` `-`
-        `*` `div` `mod`

bővebben: https://deva.web.elte.hu/pubwiki/doku.php?id=fordprog:while2019
vagy: https://deva.web.elte.hu/pubwiki/doku.php?id=fordprog:bead2
