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
  - `and` `or`
  - `=`
  - `<` `>`
  - `+` `-`
  - `*` `div` `mod`

### Utasítások

- `skip` utasítás: a változók értékeinek megváltoztatása nélküli továbblépés.
- Értékadás: az `:=` operátorral. *Bal*oldalán egy változó, *jobb*oldalán egy - a változóéval megegyező típusú - kifejezés állhat.
- Olvasás: A `read( `*`változó`*` );` utasítás a megadott változóba olvas be egy megfelelő típusú értéket a konzolról. (Megvalósítása: meg kell hívni a `be_egesz` (vagy a `be_logikai`) eljárást, amit a *4. beadandó leírásához mellékelt C fájl tartalmaz.* A beolvasott érték `natural` típus esetén az `eax`, `logikai` típus esetén az `al` regiszterben lesz.)
- Írás: A `write( `*`kifejezés`*` );` utasítás a megadott kifejezés értékét a képernyőre írja (és egy sortöréssel fejezi be). (Megvalósítása: meg kell hívni a `ki_egesz` (vagy a `ki_logikai`) eljárást, amit a *4. beadandó* leírásához mellékelt C fájl tartalmaz. Paraméterként a kiírandó értéket (mindkét esetben 4 bájtot) kell a verembe tenni.)
- While ciklus: `while `*`feltétel`*` do `*`utasítások`*` done` A *feltétel* logikai kifejezés, a *ciklusmag* legalább egy utasítást tartalmaz. A megszokott módon, elöltesztelős ciklusként működik.
- Elágazás: `if `*`feltétel`*` then `*`utasítások`*` elseif `*`feltétel`*` then `*`utasítások`*` … else `*`utasítások`*` endif` alakú. A *feltételek* logikai kifejezések, az ágak legalább egy *utasítást* tartalmaznak. Elseif ágból akárhány lehet (akár nulla is), az else ágból legfeljebb egy lehet, de el is hagyható. Az elágazások a megszokott módon működnek.


bővebben: https://deva.web.elte.hu/pubwiki/doku.php?id=fordprog:while2019
vagy: https://deva.web.elte.hu/pubwiki/doku.php?id=fordprog:bead2

# Saját megoldás
futtatás:
`lex calculate.l`
`bisonc++ calculate2.y`
`g++ -o beadando calculate.cc lex.yy.cc parse.cc `
