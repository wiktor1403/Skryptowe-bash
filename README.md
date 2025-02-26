# Skryptowe-bash
Zadanie z bash

W celu rozegrania gry należy uruchomić komendę w folderze ze znajdującymi się w nim skryptami:
bash TicTakToe.sh

Na ekranie pojawią się pytania dotyczące ustawień rozgrywki należy wybrać jedną z dwóch dostępnych opcji
We wszystkich opcjach ustawień wyboru należy dokonać z pośród opcji wpisanych w nawias

W celu wybrania gry człowiek kontra człowiek należy wybrać tryb PVP w stosownym momencie
W celu wybrania gry człowiek kontra maszyna należy wybrać tryb PVE

W przypadku gry PVE konieczny bęzie wybór kto zaczyna grę oraz jakim symbolem będzie grał gracz.

W grze PVP pierwszy gracz wybiera swój symbol.

Do gry wprowadzamy współrzędne pola w które chcemy zagrać podając najpierw wiersz (A/B/C) a następnie kolumnę (1/2/3)
Wielkość liter nie ma znaczenia.

W grze dostępna jest opcja quick save i load game.
Zapis dokona się kiedy gracz wprowadzi komendę QS/qs.
W folderze w któym włączona została gra utworzy się plik z zapisem aktuialnego stanu gry.
Grę można wczytać wpisując lf/LF. Z wcześniej utworzonego pliku wczytany zostanie zapis gry.
Wczytania zapisu gry można dokonać dopiero po włączeniu rozgrywki, nie można tego dokonać na etapie menu.
