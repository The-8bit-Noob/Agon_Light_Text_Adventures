   10 REM "********************************"
   20 REM "*           COLDITZ            *"
   30 REM "*      written in 1983 by      *"
   40 REM "*        Derrick Daines        *"
   50 REM "*   Ported to the Agon Light   *"
   60 REM "*    By Steve Lovejoy 2024     *"
   70 REM "********************************"
   80 REM "         MAIN  PROGRAM          "
   90 :
  100 E%=&0E21
  110 PRINT
  120 CLS
  130 REM *KEY0"HELP|M"
  140 REM *KEY1"CARRY|M"
  150 REM *KEY2"LOOK|M"
  160 REM *KEY3"GO UP|M"
  170 REM *KEY4"GO DOWN|M"
  180 REM *KEY5"SHOW PASS|M"
  190 REM *KEY6"LIFT MANHOLE COVER|M"
  200 MODE 7 : PROChideCursor
  201 PRINTTAB(0,3);CHR$131;STRING$(38,"#")
  202 PROCDBL(12,7,"ESCAPE FROM")
  203 PROCDBL(14,10,"COLDITZ!")
  204 PRINTTAB(0,15);CHR$131;STRING$(38,"#")
  205 PRINTTAB(0,17);CHR$134;"Written by Derrick Daines 1983"
  206 PRINTTAB(0,19);CHR$134;"Agon Light port by Steve Lovejoy 2024"
  207 PRINTTAB(3,23);CHR$131;"Would you like an introduction?"; : A$=GET$
  208 :
  240 DIMCARRY$(6),ITEM%(30),S% 7
  250 G$="" : DAY%=0 : FLAG%=0 : !S%=&08040201 : S%!4=&4010 : IF LEFT$(A$,1)="Y"PROCINST
  260 TIME=0 : REM ON ERROR GOTO 2600
  270 N%=0 : X1%=27 : Y1%=8 : CY%=1 : LVL%=1 : LC%=28 : FOR X%=1 TO 20 : ITEM%(X%)=RND(20) : NEXT : FOR X%=21 TO 29 : ITEM%(X%)=X% : NEXT : ITEM%(30)=15 : X2%=X1% : Y2%=Y1% : R1%=0 : REM *FX4,1
  280 PROCPLAN : PROCLOW
  290 PRINTTAB(X1%,Y1%);"X" : VDU 28,0,24,39,22,12 : X2%=X1% : Y2%=Y1% : PROCLOGIC
  300 IF LC%=32 AND (RND(10)=10 OR X1%=38)PROCLIGHT : GOTO 270
  310 IF N%=0 AND RND(100)=5 AND LC%<>28 PROCAPPEL : N%=TIME : GOTO 350
  320 IF LVL%=0 GOTO 350
  330 IF RND(200)=2PROCCHECK ELSE 350
  340 IF FLAG%=1 GOTO 270
  350 IF N%=0 GOTO 460
  360 IF LC%=28 OR TIME<N%+6000 GOTO 390
  370 CLS : VDU 23,0&A0,1;2 : REM *FX15,1
  380 VDU 26,12 : PROCDBL(4,12,"HANDS UP!") : PRINT"Ve haf vays of making you coom appel!" : PROCWAIT(250) : PROCCOOL : GOTO 270
  390 IF LC%<>28 OR X1%<22 GOTO 460
  400 IF CY%=1 GOTO 440
  410 L%=0 : FOR X%=1 TO 6 : IF CARRY$(X%)<>"PASS" AND CARRY$(X%)<>"" AND CARRY$(X%)<>"FOOD" AND CARRY$(X%)<>"TOBACCO" AND CARRY$(X%)<>"CHOCOLATE" AND CARRY$(X%)<>"CLOTHING"L%=1
  420 NEXT X% : VDU 23,0&A0,1;2 : REM *FX15,1
  430 IF L%<>0PRINT"You bring NUZZING on appel!" : PROCWAIT(250) : PROCCOOL : GOTO 270
  440 CLS : VDU 23,0&A0,1;2 : REM *FX15,1
  450 PRINT"APPEL!" : PROCWAIT(250) : PRINT"All ist in ordnung. Dismiss!" : PROCWAIT(200) : N%=0 : GOTO 350
  460 PROCTRY : IF C%<>0PROCCOOL : GOTO 270
  470 IF E% CLS : E%=FALSE : VDU 15
  480 VDU 28,0,24,39,22 : PRINT;CHR$130;"What do you do?"; : Q$="" : VDU 23,0&A0,1;2 : REM *FX15,1 flush buffer,1
  490 Q%=GET : IF Q%=135 OR Q%=13 THEN 350 ELSE IF Q%=8 OR Q%=21 OR Q%=11 OR Q%=10 GOTO 500 ELSE GOTO 650
  500 SFL%=0 : X2%=X1% : Y2%=Y1%
  510 IF Q%=8 THEN X2%=X1%-1 : REM left.
  520 IF Q%=21 THEN X2%=X1%+1 : REM right.
  530 IF Q%=10 THEN Y2%=Y1%+1 : REM up.
  540 IF Q%=11 THEN Y2%=Y1%-1 : REM down.
  550 VDU 26 : REM restore both viewports.
  560 P%=ASC(FNREAD_CHAR(X2%,Y2%))
  570 IF P%=255 OR P%=79 VDU 28,0,24,39,22 : GOTO 470 : REM 255=filled,79=o
  580 IF LC%=8 AND X1%=38 VDU 28,0,24,39,22 : PROCLIGHT : GOTO 270 : REM 38=&
  590 IF P%<>57 GOTO 610 : REM 57=9
  600 PROCGRILL : IF F%=0 GOTO 290 ELSE 640
  610 IF P%=32 OR P%=147 OR P%=230 GOTO 640 : REM 32=space,147=yellow gfx,230=gfx
  620 FLAG%=0 : IF P%=44 OR P%=53 VDU 28,0,24,39,22 : PROCKEY : REM 44=,53=5
  630 IF FLAG%=0 GOTO 350
  640 VDU 26 : PRINTTAB(X1%,Y1%);CHR$(P%) : X1%=X2% : Y1%=Y2% : GOTO 290
  650 REPEAT : PRINTCHR$(Q%); : Q$=Q$+CHR$(Q%)
  660   Q%=GET : IF Q%<>127 GOTO 670 ELSE IF Q$="" GOTO 660 ELSE Q$=LEFT$(Q$,LEN(Q$)-1) : PRINTCHR$127; : GOTO 660
  670 UNTIL Q%=13 : PRINT : X%=LEN(Q$)
  680 IF MID$(Q$,X%,1)=" "X%=X%-1 : GOTO 680
  690 Q$=LEFT$(Q$,X%) : X%=1
  700 IF MID$(Q$,X%,1)=" "X%=X%+1 : GOTO 700
  710 Q$=RIGHT$(Q$,LEN(Q$)-X%+1) : X%=1
  720 IF MID$(Q$,X%,1)=" " GOTO 820
  730 X%=X%+1 : IF X%<=LEN(Q$) GOTO 720 ELSE V$=Q$
  740 V$=Q$ : PRINT V$ : IF V$="HELP"PROCHELP : GOTO 350
  750 IF V$="CARRY"PROCCARRY : GOTO 350
  760 IF V$="LOOK" PROCLOOK : GOTO 350
  770 SFL%=0 : IF V$="GO" OR V$="WALK" OR V$="RUN" OR V$="CRAWL"PROCGO : GOTO 350
  780 IF V$="DIG"PROCDIG : GOTO 350
  790 IF V$="JUMP" OR V$="LEAP"PROCSILLY : GOTO 350
  800 IF V$="EAT"PROCEAT : GOTO 350
  810 PROCDONT : GOTO 350
  820 V$=LEFT$(Q$,X%-1) : N$=RIGHT$(Q$,LEN(Q$)-X%) : SFL%=0
  830 IF V$="KILL" OR V$="KNIFE"PROCSILLY : PROCCOOL : GOTO 270
  840 IF V$<>"GO" GOTO 980
  850 IF N$<>"UP" GOTO 930
  860 IF LC%=33 AND Y1%=18LC%=15 : LVL%=1 : GOTO 970
  870 IF LC%<>29 GOTO 890
  880 IF Y1%=5Y1%=6 : GOTO 920 ELSE PROCSILLY : GOTO 350
  890 IF (LC%<>18 AND LC%<>19)PROCSILLY : GOTO 350
  900 F%=0 : FOR X%=1 TO 6 : IF CARRY$(X%)="LADDER"F%=1
  910 NEXT : IF F%=1 PRINT"You can't get the ladder up." : GOTO 350
  920 LVL%=LVL%+1 : LC%=LC%+1 : PROCUPDN : PROCLOGIC : GOTO 350
  930 IF N$<>"DOWN"PROCGO : GOTO 350
  940 IF X1%=7 AND Y1%=18LC%=33 : LVL%=0 : GOTO 970
  950 IF (LC%<>19 AND LC%<>20)PROCDIG : GOTO 350
  960 LC%=LC%-1 : LVL%=LVL%-1
  970 PROCUPDN : GOTO 350
  980 IF V$="GET" OR V$="LIFT" OR V$="TAKE" OR V$="STEAL"PROCGET : GOTO 350
  990 IF V$="DROP" OR V$="HIDE"PROCDROP : GOTO 350
 1000 IF V$="WALK" OR V$="RUN" OR V$="CRAWL"PROCGO : GOTO 350
 1010 IF V$<>"HIT" AND V$<>"HAMMER" GOTO 1030
 1020 F%=0 : PROCHIT : IF F%=0 GOTO 350 ELSE 270
 1030 IF V$="EAT"PROCEAT : GOTO 350
 1040 IF V$="MOVE"PROCMOVE : GOTO 350
 1050 IF V$="CLIMB" THEN PROCCLIMB : GOTO 350
 1060 IF V$="UNSCREW"PROCSCREW : GOTO 350
 1070 IF V$="OPEN"PROCOPEN : GOTO 350
 1080 PROCNOTHERE : GOTO 350
 1090 :
 1100 REPORT : PRINT" on line ";ERL
 1110 VDU 26,12 : REM *FX4,0
 1120 END : REM end program.
 1130 :
 1140 DEF PROCLOGIC : IF LVL%<>1 THEN 1430
 1150 IF Y1%>3 THEN 1210
 1160 IF X1%<11LC%=1 : ENDPROC
 1170 IF X1%<17LC%=2 : ENDPROC
 1180 IF X1%<22LC%=3 : ENDPROC
 1190 IF X1%<26LC%=4 ELSE LC%=26
 1200 ENDPROC
 1210 IF Y1%>17 THEN 1380
 1220 IF X1%>7 THEN 1250
 1230 IF Y1%>12LC%=21 ELSE LC%=6
 1240 ENDPROC
 1250 IF Y1%>12 THEN 1320
 1260 IF X1%>31 LC%=13 : ENDPROC
 1270 IF X1%>21 OR Y1%>6LC%=28 : ENDPROC
 1280 IF X1%>11 AND X1%<16LC%=2 : ENDPROC
 1290 IF X1%>16 AND X1%<21LC%=3 : ENDPROC
 1300 IF X1%=10 AND Y1%=5LC%=19 ELSE LC%=28
 1310 ENDPROC
 1320 IF X1%<15 THEN 1410
 1330 IF X1%<23LC%=25 : ENDPROC
 1340 IF X1%<26LC%=27 : ENDPROC
 1350 IF X1%>34LC%=23 : ENDPROC
 1360 IF X1%=27 AND Y1%=16LC%=19 ELSE LC%=11
 1370 ENDPROC
 1380 IF X1%<4LC%=31 : ENDPROC
 1390 IF X1%<9LC%=15 ELSE LC%=14
 1400 ENDPROC
 1410 IF X1%=14 AND Y1%=16 THEN LC%=18 ELSE LC%=24
 1420 ENDPROC
 1430 IF LVL%<>2 THEN 1570
 1440 IF Y1%>12 THEN 1510
 1450 IF X1%=10 AND Y1%=5LC%=20 : ENDPROC
 1460 IF X1%<8 AND Y1%>4LC%=7 : ENDPROC
 1470 IF X1%<12LC%=10 : ENDPROC
 1480 IF X1%<21LC%=12 : ENDPROC
 1490 IF Y1%<4LC%=8 ELSE LC%=32
 1500 ENDPROC
 1510 IF X1%<15 GOTO 1550
 1520 IF X1%<26LC%=9 : ENDPROC
 1530 IF Y1%=16 AND X1%=27LC%=20 : ENDPROC
 1540 LC%=16 : ENDPROC
 1550 IF X1%=14 AND Y1%=16LC%=19 : ENDPROC
 1560 LC%=5 : ENDPROC
 1570 IF LVL%<>3 GOTO 1610
 1580 IF Y1%<13 OR X1%>14LC%=32 : ENDPROC
 1590 IF X1%=14 AND Y1%=16LC%=20 : ENDPROC
 1600 LC%=22 : ENDPROC
 1610 IF Y1%=5 AND (X1%=9 OR X1%=10)LC%=18 : GOTO 1670
 1620 IF X1%=27 AND Y1%=16LC%=18 : ENDPROC
 1630 IF X1%<15 AND Y1%<7LC%=30 : ENDPROC
 1640 IF X1%>25 AND Y1%>12LC%=17 : ENDPROC
 1650 IF X1%>20 AND Y1%<12LC%=29
 1660 IF X1%<25 AND Y1%>6LC%=33
 1670 ENDPROC
 1680 :
 1690 DEF PROCLOOK
 1700 RESTORE 4520 : FOR X%=1 TO LC% : READ P$ : NEXT : PRINTCHR$130;P$
 1710 PRINT"There is "; : FLAG%=0 : RESTORE 4500 : IF LC%=28 AND X1%<>23 AND Y1%<>6 GOTO 1740
 1720 FOR X%=1 TO 30 : READP$ : IF LC%=ITEM%(X%)PRINT;P$;","; : FLAG%=1
 1730 NEXT
 1740 IF FLAG%=0PRINT"nothing here."
 1750 IF LC%<>26 GOTO 1780
 1760 F%=0 : FOR X%=1 TO 6 : IF CARRY$(X%)="SCREWDRIVER"F%=1
 1770 NEXT : IF F%=1G%=INKEY(100) : PRINT"Try unscrewing things."
 1780 SFL%=SFL%+1 : IF (SFL%=2 AND LC%=30) OR (LC%=33 AND X1%=7 AND Y1%=7)LC%=33 : PROCHOLE(7,6) : GOTO 1810
 1790 IF LC%=33 AND X1%=25PROCHOLE(26,14)
 1800 IF LC%=33 AND Y1%=18PROCFLOOR
 1810 ENDPROC
 1820 :
 1830 DEF PROCGO : PRINT"Please use the cursor control keys." : ENDPROC
 1840 :
 1850 DEF PROCGRILL
 1860 VDU 28,0,24,39,22,12 : F%=0 : FOR X%=1 TO 6 : IF CARRY$(X%)="SPANNER"F%=1
 1870 NEXT : IF F%=0PRINT"You need a spanner to shift that grill" : F%=0 : GOTO 1890
 1880 PRINT"You remove the grill with the spanner."
 1890 PROCWAIT(250) : ENDPROC
 1900 :
 1910 DEF PROCGET : X%=1
 1920 RESTORE 4500 : IF CY%<=6 THEN 1930 ELSE PRINT"You can't carry any more!" : ENDPROC
 1930 READP$ : IF ITEM%(X%)=LC% AND P$=N$ THEN 1950 ELSE X%=X%+1 : IF X%<=30 GOTO 1930
 1940 PROCNOTHERE : ENDPROC
 1950 FLAG%=0 : IF N$<>"MANHOLE COVER" GOTO 1980
 1960 IF LC%<>28 OR X1%<22 OR X1%>23 OR Y1%<5 OR Y1%>6 PRINT"You're nowhere near it." : GOTO 2010
 1970 PRINT"There's a hole! Going down (Y-N)?"; : P$=GET$ : IF P$<>"Y" GOTO 2010 ELSE LC%=29 : LVL%=0 : X1%=22 : Y1%=5 : PROCUPDN : GOTO 2010
 1980 ITEM%(X%)=0 : X%=1 : PRINT"OK - you've got it."
 1990 IF CARRY$(X%)=""CARRY$(X%)=P$ ELSE X%=X%+1 : GOTO 1990
 2000 CY%=CY%+1
 2010 ENDPROC
 2020 :
 2030 DEF PROCNOTHERE
 2040 PRINT"There's no ";N$;" here!" : ENDPROC
 2050 :
 2060 DEF PROCDROP : X%=1
 2070 IF CARRY$(X%)=N$ THEN 2100
 2080 X%=X%+1 : IF X%<=6 THEN 2070
 2090 PRINT"You don't have a ";N$;"!" : ENDPROC
 2100 CARRY$(X%)="" : CY%=CY%-1 : PRINT" OK."; : RESTORE 4500 : X%=1
 2110 IF LC%<>32 GOTO 2150
 2120 IF N$<>"ROPE" AND N$<>"WIRE"PRINT;" How clumsy of you!" : GOTO 2240
 2130 IF N$="ROPE"PRINT"It's too short!!" : GOTO 2240
 2140 PRINT"OK - do you have your escape kit (Y-N)?" : G$=GET$ : IF G$<>"Y" ENDPROC ELSE G$="TRY" : GOTO 2240
 2150 READP$ : IF N$<>P$X%=X%+1 : GOTO 2150
 2160 ITEM%(X%)=LC%
 2170 IF LC%<>23 OR N$<>"TOBACCO" GOTO 2190
 2180 PRINT"Hermann mutters at you, 'Why don't you move some coal?'" : ENDPROC
 2190 IF LC%<>2 OR N$<>"RADIO" GOTO 2210
 2200 PRINT"The doctor shows you a tunnel." : VDU 26 : PRINTTAB(6,2);" " : GOTO 2230
 2210 IF LC%<>4 OR N$<>"CHOCOLATE" GOTO 2240
 2220 PRINT"Chaplain shows you a way to the store." : VDU 26 : PRINTTAB(26,2);" "
 2230 PROCWAIT(250) : VDU 28,0,24,39,22,12
 2240 ENDPROC
 2250 :
 2260 DEF PROCCARRY
 2270 PRINT" You have "; : PROCCOUNT
 2280 ENDPROC
 2290 :
 2300 DEF PROCCOUNT
 2310 FLAG%=0 : IF CY%=1PRINT;" nothing."; : ENDPROC
 2320 FOR X%=1 TO 6 : IF CARRY$(X%)<>""PRINT;CARRY$(X%);",";
 2330 NEXTX% : FLAG%=1 : ENDPROC
 2340 :
 2350 DEF PROCEAT
 2360 IF N$<>"FOOD" AND N$<>"CHOCOLATE"PROCSILLY : GOTO 2380
 2370 PRINT"Thanks - I enjoyed that!"
 2380 ENDPROC
 2390 :
 2400 DEF PROCKEY
 2410 CLS : IF Y2%=4 OR X2%=4 OR X2%=9 X%=1 : GOTO 2490
 2420 PRINT"A guard challenges you.'Your pass?'"'"What do you do"; : VDU 23,0&A0,1;2 : REM *FX15,1
 2430 INPUTLINEQ$
 2440 IF Q$="SHOW PASS" GOTO 2460
 2450 PRINT"He prods you. 'Go away!'" : GOTO 2600
 2460 F%=0 : FOR X%=1 TO 6 : IF CARRY$(X%)="PASS"F%=1
 2470 NEXTX% : IF F%=0 GOTO 2450
 2480 PRINT"All ist in ordnung. Pass!" : GOTO 2540
 2490 IF CARRY$(X%)="SMALL KEY" AND Y2%=4 GOTO 2530
 2500 IF CARRY$(X%)="LARGE KEY" AND X2%=4 GOTO 2530
 2510 IF CARRY$(X%)="KEY" AND X2%=9 GOTO 2530
 2520 X%=X%+1 : IF X%<=6 GOTO 2490 ELSE PRINT"You have no key to fit the lock." : GOTO 2600
 2530 PRINT"You use the ";CARRY$(X%)
 2540 VDU 26 : PRINTTAB(X1%,Y1%);" "
 2550 IF Y2%<Y1%Y1%=Y2%-1 : GOTO 2590
 2560 IF X2%<X1%X1%=X2%-1 : GOTO 2590
 2570 IF X2%>X1%X1%=X2%+1 : GOTO 2590
 2580 IF Y2%>Y1%Y1%=Y2%+1
 2590 PRINTTAB(X1%,Y1%);"X"
 2600 PROCWAIT(250) : VDU 28,0,24,39,22,12 : PROCLOGIC : ENDPROC
 2610 :
 2620 DEF PROCPLAN
 2630 VDU 26,12 : PROCDRAW(5,0,26)
 2640 FOR X=1 TO 3 : FOR Y=1 TO 5
 2650     PROCDRAW(5*Y,X,1) : PRINT"    ";CHR$255 : NEXT : NEXT
 2660 PROCDRAW(0,4,11) : PROCDRAW(15,4,1):PROCDRAW(20,4,19)
 2670 FOR X=1 TO 7 : PROCDRAW(0,4+X,1):PROCDRAW(7,4+X,1):PROCDRAW(30,4+X,1):PROCDRAW(38,4+X,1) : NEXT
 2680 PROCDRAW(10,5,1):PROCDRAW(15,5,1):PROCDRAW(20,5,1):PROCDRAW(9,6,12):PROCDRAW(0,12,8):PROCDRAW(14,12,25):PROCDRAW(2,13,1):PROCDRAW(7,13,8):PROCDRAW(21,13,1):PROCDRAW(25,13,1):PROCDRAW(33,13,1):PROCDRAW(38,13,1)
 2690 FOR X=1 TO 3 : PROCDRAW(2,13+X,1):PROCDRAW(7,13+X,1):PROCDRAW(14,13+X,1):PROCDRAW(21,13+X,1):PROCDRAW(25,13+X,1):PROCDRAW(33,13+X,1):PROCDRAW(38,13+X,1) : NEXT
 2700 PROCDRAW(2,17,37):PROCDRAW(25,15,2):PROCDRAW(13,15,2) : ENDPROC
 2710 :
 2720 DEF PROCLOW
 2730 RESTORE 2760
 2740 FOR X=1 TO 4 : PROCDRAW(3,17+X,1) : PROCDRAW(8,17+X,1) : PROCDRAW(35,17+X,1) : NEXT
 2750 FOR X=1 TO 10 : READI%,J% : PRINTTAB(I%,J%);" " : NEXT
 2760 DATA 31,9,11,2,21,2,13,6,18,6,8,9,5,12,15,14,22,15,34,15
 2770 DATA 28,4,18,12,37,12,11,13,12,17,27,12
 2780 DATA 9,20,4,20
 2790 PROCDRAW(3,21,33)
 2800 PRINTTAB(22,5);"O"
 2810 FOR X%=1 TO 6 : READI%,J% : PRINTTAB(I%,J%);CHR$44 : NEXT
 2820 FOR X%=1 TO 2 : READI%,J% : PRINTTAB(I%,J%);CHR$53 : NEXT
 2830 ENDPROC
 2840 :
 2850 DEF PROCDBL(X%,Y%,X$)
 2860 PRINTTAB(X%,Y%);CHR$131;CHR$141;X$ : PRINTTAB(X%,Y%+1);CHR$131;CHR$141;X$ : ENDPROC
 2870 :
 2880 DEF PROCDONT
 2890 PRINT"I don't know how to do that." : ENDPROC
 2900 :
 2901 REM READ CHAR FROM SCREEN.
 2902 DEF FNREAD_CHAR(X%,Y%)
 2903 LOCAL A%,C
 2904 VDU 23,0,&83,X%;Y%;
 2905 *FX 19
 2906 C = FN_GETWORD_VDP(&09) : VDU 31,X2%,Y2% : =CHR$(C)
 2907 REM END FNREAD_CHAR.
 2908 :
 2950 :
 2960 DEF PROCDIG : PRINT'"Colditz is built on solid rock!" : ENDPROC
 2970 :
 2980 DEF PROCSILLY : PRINT'"Don't be silly!" : ENDPROC
 2990 :
 3000 DEF PROCAPPEL : PRINT"APPEL! YOU HAVE ONE MINUTE!" : VDU 23,0&A0,1;2 : REM *FX15,1
 3010 PRINT"You ought to leave everything here." : PROCWAIT(250)
 3020 ENDPROC
 3030 :
 3040 DEF PROCLIGHT
 3050 PRINT"A SEARCHLIGHT BLINDS YOU AND HOLDS YOU" : PROCWAIT(250) : PROCCOOL : ENDPROC
 3060 :
 3070 DEF PROCCHECK : VDU 23,0&A0,0;2 : REM *FX15,0
 3080 CLS : FLAG%=0 : PRINT"A guard stops you for a check!" : VDU 23,0&A0,1;2 : REM *FX15,1
 3090 PRINT"He finds "; : PROCWAIT(250) : IF CY%=1 PRINT "nothing. 'You may go!'" : PROCWAIT(250) : ENDPROC
 3100 FOR X%=1 TO 6 : IF CARRY$(X%)="" GOTO 3120
 3110   P$=CARRY$(X%) : PRINT;" ";P$; : IF P$="KNIFE" OR P$="MAP" OR P$="COMPASS" OR P$="ROPE" OR P$="DOCUMENT" OR P$="SPADE" OR P$="RADIO" OR P$="GUN" OR RIGHT$(P$,3)="KEY" OR P$="SPANNER" THEN FLAG%=1 : VDU 23,0&A0,0;2 : REM *FX15,0
 3120 NEXTX% : IF FLAG%<>0 GOTO 3140 ELSE PRINT"'You may go!'" : PROCWAIT(250) : GOTO 3160
 3130 DEF PROCCOOL
 3140 PROCWAIT(200) : VDU 26,12 : PROCDBL(12,6,"30 DAYS IN") : PROCDBL(12,9,"THE COOLER!") : PROCWAIT(500) : DAY%=DAY%+30 : TIME=0 : CLS
 3150 FOR X%=1 TO 6 : CARRY$(X%)="" : NEXT : FLAG%=1
 3160 E%=TRUE : ENDPROC
 3170 :
 3180 DEF PROCUPDN
 3190 VDU 26 : IF LVL%=0 CLS : PROCUNDER : GOTO 3230
 3200 PROCPLAN : IF LVL%=1PROCLOW
 3210 IF LVL%=2PROCHIGH
 3220 IF LVL%=3PROCROOF
 3230 PRINTTAB(X1%,Y1%);"X" : VDU 28,0,24,39,22 : ENDPROC
 3240 :
 3250 DEF PROCHIGH
 3260 PROCDRAW(7,6,12)
 3270 FORX%=5 TO 6 : PROCRED(29,X%,10) : NEXT : FOR X%=7 TO 11 : PROCRED(30,X%,9) : NEXT
 3280 FOR X%=18 TO 22 : PROCRED(3,X%,6) : NEXT
 3290 RESTORE 3300 : FOR X%=1 TO 22 : READI%,J% : PRINTTAB(I%,J%);" " : NEXT
 3300 DATA 10,5,11,2,16,2,21,1,26,1,30,4,7,4,10,4
 3310 DATA 8,14,8,15,8,16,15,14,22,13,22,14,22,15,22,16,34,12,34,13,34,13,34,14,34,15,34,16
 3320 ENDPROC
 3330 :
 3340 DEF PROCROOF
 3350 PRINTTAB(32,4);CHR$152
 3360 FOR X%=5 TO 11 : PRINTTAB(31,X%);CHR$152 : NEXT
 3370 FOR X%=0 TO 6 : PROCRED(5,X%,26) : NEXT : FOR X%=4 TO 12 : PROCRED(1,X%,8) : NEXT
 3380 PROCDRAW(2,13,6) : PROCDRAW(12,14,2)
 3390 FOR X%=12 TO 17 : PROCRED(15,X%,24) : NEXT
 3400 FOR X%=13 TO 16 : PRINTTAB(8,X%)" " : NEXT
 3410 ENDPROC
 3420 :
 3430 DEF PROCUNDER
 3440 VDU 26 : PROCDRAW(5,1,6) : PROCDRAW(5,6,6) : FOR X%=2 TO 5 : FOR Y%=5 TO 10 STEP 5 : PROCDRAW(Y%,X%,1) : NEXT : NEXT
 3450 PROCDRAW(25,12,13) : PROCDRAW(25,17,13) : FOR X%=13 TO 16 : FOR Y%=25 TO 37 STEP 12 : PROCDRAW(Y%,X%,1) : NEXT : NEXT
 3460 PROCDRAW(25,15,2) : PROCDRAW(8,5,1)
 3470 IF LC%<>29 GOTO 3490
 3480 FOR Y%=0 TO 11 : PROCDRAW(16,Y%,23) : NEXT : FOR Y%=5 TO 6 : PRINTTAB(22,Y%);" "; : NEXT : PRINTSPC(16); : VDU 8,57,32 : FOR Y%=7 TO 11 : PRINTTAB(35,Y%)" "; : NEXT : GOTO 3510
 3490 IF LC%<>33 GOTO 3510
 3500 FOR Y%=7 TO 22 : PROCDRAW(0,Y%,25) : NEXT : FOR Y%=7 TO 18 : PRINTTAB(7,Y%);" " : NEXT : PRINTTAB(7,14);SPC(19)
 3510 ENDPROC
 3520 :
 3530 DEF PROCDRAW(X%,Y%,S%)
 3540 PRINTTAB(X%,Y%);CHR$147;STRING$(S%,CHR$255); : ENDPROC
 3550 :
 3560 DEF PROCRED(X%,Y%,S%)
 3570 PRINTTAB(X%,Y%);CHR$145;STRING$(S%,"f"); : ENDPROC
 3580 :
 3590 DEF PROCHELP
 3600 IF DAY%<30 PRINT"Carry as little as possible. Cache your escape kit." : GOTO 3670
 3610 IF DAY%<60 PRINT"Search the lumber room really well." : GOTO 3670
 3620 IF DAY%<90 PRINT"Hermann in the kitchen likes tobacco." : GOTO 3670
 3630 IF DAY%<120 PRINT"The chaplain has a sweet tooth." : GOTO 3670
 3640 IF DAY%<150 PRINT"The doctor would like a radio."
 3650 IF DAY%<180 PRINT"Try messing about with a ladder." : GOTO 3670
 3660 PRINT"Screwdriver would be handy for parcels"
 3670 ENDPROC
 3680 :
 3690 DEF PROCMOVE
 3700 IF LC%=17 GOTO 3720
 3710 PROCSILLY : ENDPROC
 3720 X%=1 : IF N$<>"COAL" AND N$<>"COKE" GOTO 3710
 3730 IF CARRY$(X%)="SHOVEL"F%=1
 3740 X%=X%+1 : IF X%<=6 GOTO 3730
 3750 IF F%=0PRINT"Not without a shovel, you don't!" : ENDPROC
 3760 IF N$="COAL"LC%=33 : I%=26 : J%=14
 3770 IF N$="COKE"LC%=29 : I%=35 : J%=12
 3780 PROCHOLE(I%,J%) : ENDPROC
 3790 DEF PROCHOLE(I%,J%)
 3800 PRINT"There's a hole in the wall!" : VDU 26 : PROCWAIT(100) : PROCUNDER : PRINTTAB(I%,J%);" ";TAB(X1%,Y1%);"X" : VDU 28,0,24,39,22,12 : ENDPROC
 3810 :
 3820 DEF PROCFLOOR : PRINT"You look up into the gatehouse." : ENDPROC
 3830 :
 3840 DEF PROCCLIMB
 3850 IF N$="STAIRS" OR N$="STEPS"PRINT"Type 'GO UP'" : ENDPROC
 3860 IF N$<>"LADDER"PRINT"HUH?" : ENDPROC
 3870 IF ITEM%(21)<>LC%PRINT"There's no ladder to climb!" : ENDPROC
 3880 IF LC%<>13PRINT"Nice view up here." : ENDPROC
 3890 PRINT"You discover a loose window!" : PROCWAIT(100)
 3900 VDU 26 : PRINTTAB(38,4);" " : VDU 28,0,24,39,22,12 : ENDPROC
 3910 :
 3920 DEF PROCSCREW : IF LC%<>26 OR N$<>"WINDOW"PRINT"It's been welded." : ENDPROC
 3930 PRINT"It's loose!"
 3940 PRINTTAB(31,2);" " : ENDPROC
 3950 :
 3960 DEF PROCTRY : C%=0
 3970 IF G$="TRY" OR LC%=31 GOTO 4020
 3980 IF X1%=38 AND Y1%=3 AND LVL%=1 GOTO 4020
 3990 IF X1%=5 AND Y1%=2 GOTO 4020
 4000 IF LVL%<>0 OR X1%<>39 OR Y1%<>6 ENDPROC
 4010 :
 4020 PROCTEST("MAP") : PROCTEST("CLOTHING") : PROCTEST("FOOD") : PROCTEST("COMPASS") : PROCTEST("DOCUMENT") : IF C%=0 GOTO 4200
 4030 VDU 26,12 : PROCDBL(4,12,"HANDS UP!") : PRINT'''"YOUR ESCAPE KIT WAS INCOMPLETE!" : PROCWAIT(200) : ENDPROC
 4040 :
 4050 DEF PROCOPEN
 4060 IF R1%<>0PRINT"Only one parcel allowed per prisoner" : ENDPROC
 4070 IF N$<>"PARCEL" OR LC%<>26 PROCDONT : ENDPROC
 4080 PRINT" It contains "; : R1%=RND(6) : IF R1%=1P$="FOOD" ELSE IF R1%=2P$="CHOCOLATE" ELSE IF R1%=3P$="TOBACCO" ELSE IF R1%=4P$="CLOTHING" ELSE IF R1%=5P$="MAP" ELSE IF R1%=6P$="COMPASS"
 4090 PRINTP$;" Do you want it (Y-N)?"; : G$=GET$ : IF G$<>"Y" ENDPROC
 4100 IF CY%=6PRINT"You can't carry any more." : ENDPROC
 4110 X%=1 : CY%=CY%+1
 4120 IF CARRY$(X%)=""CARRY$(X%)=P$ : ENDPROC
 4130 X%=X%+1 : IF X%<=6 GOTO 4120 ELSE ENDPROC
 4140 :
 4150 DEF PROCTEST(P$) : X%=1
 4160 IF CARRY$(X%)=P$ GOTO 4180
 4170 X%=X%+1 : IF X%<=6 THEN 4160 ELSE C%=1
 4180 ENDPROC
 4190 :
 4200 VDU 26,12 : FOR X%=1 TO 23 : PRINT" ";STRING$(34,"*") : NEXT : PRINTTAB(1,6)"" : PROCDBL(0,7,"C O N G R A T U L A T I O N S !  ") : PRINT;CHR$129;CHR$136;" "'"  >>>>>> YOU'VE GOT CLEAR AWAY <<<<<" : REM *FX225,0
 4210 FOR X%=1 TO 30 : FOR Y%=50 TO 150 : SOUND 17,-15,Y%,2 : NEXT : NEXT : VDU 23,0&A0,1;2 :REM *FX15,1
 4220 DAY%=DAY%+1 : PRINTTAB(4);">> You had been in for ";DAY%;" days. <<" : REM *FX4,0
 4230 PRINT"Now see if you can find another way out!" : A=GET : RUN
 4240 :
 4250 DEF PROCWAIT(D%) : VDU 23,0&A0,1;2 : REM *FX15,1
 4260 NOW%=TIME : REPEAT : UNTIL TIME>=NOW%+D% : ENDPROC
 4270 :
 4280 DEF PROCHIT : X%=1
 4290 IF N$="GUARD"PROCCOOL : F%=1 : GOTO 4350
 4300 IF LC%<>29PROCSILLY : GOTO 4350
 4310 IF CARRY$(X%)="HAMMER" GOTO 4330
 4320 X%=X%+1 : IF X%<=6 GOTO 4310 ELSE PRINT"OUCH! You need a hammer." : GOTO 4350
 4330 IF Y1%<>11PROCSILLY : GOTO 4350
 4340 PRINT;"The wall crumbles, leaving a hole!" : VDU 26 : PRINTTAB(X1%,Y1%);"X" : PRINTTAB(35,12);" "
 4350 ENDPROC
 4360 :
 4370 DEF PROCINST
 4375 CLS
 4380 PRINT"                                        "
 4381 PRINT;"Your task is to escape from Colditz, an ";
 4382 PRINT;"old castle used by the Germans during   ";
 4383 PRINT;"WW2 as a POW camp. There are several    ";
 4384 PRINT;"methods of escape but none are easy; see";
 4385 PRINT;"how many you can find.                  ";
 4386 PRINT;"                                        ";
 4387 PRINT;"Before you can begin an escape attempt, ";
 4388 PRINT;"you must collect an escape kit.         ";
 4389 PRINT;"This consists of:-                      "
 4390 PRINT;CHR$131;"A compass";TAB(20);CHR$134;")    "
 4391 PRINT;CHR$131;"A document";TAB(20);CHR$134;") IN"
 4392 PRINT;CHR$131;"A map";TAB(20);CHR$134;") ANY    "
 4393 PRINT;CHR$131;"Civilian clothes";TAB(20);CHR$134;") ORDER"
 4394 PRINT;CHR$131;"Spare food";TAB(20);CHR$134;") (make a note)"
 4395 PRINT;"You move about with the cursor control  ";
 4396 PRINT;"keys. In addition, you may type a verb  ";
 4397 PRINT;"as a command, such as LOOK, GET and so  ";
 4398 PRINT;"on, followed if necessary by a suitable ";
 4399 PRINT;"noun, making (eg) GET GUN, GO UP or     ";
 4400 PRINT;"whatever.                               ";
 4410 PRINT;"                                        ";
 4420 PRINT;CHR$131;"            Press any key..."; : G$=GET$
 4430 CLS
 4431 PRINT;"                                        ";
 4432 PRINT;" Some commands are so frequently used   ";
 4433 PRINT;" that Function Keys have been programmed";
 4434 PRINT;" for them.                              ";
 4435 PRINT;CHR$134;"These are:-                            ";
 4436 PRINT;"                                        ";
 4437 PRINT;CHR$129;CHR$157;CHR$131;"f1 -HELP- get advice                "
 4438 PRINT;CHR$129;CHR$157;CHR$131;"f2 -CARRY- list of possessions      "
 4439 PRINT;CHR$129;CHR$157;CHR$131;"f3 -LOOK- examine an area           "
 4440 PRINT;CHR$129;CHR$157;CHR$131;"f4 -GO UP                           "
 4441 PRINT;CHR$129;CHR$157;CHR$131;"f5 -GO DOWN                         "
 4442 PRINT;CHR$129;CHR$157;CHR$131;"f6 -SHOW PASS                       "
 4443 PRINT;CHR$129;CHR$157;CHR$131;"f7 -LIFT MANHOLE COVER              "
 4444 PRINT;"                                        ";
 4445 PRINT;" If APPEL is called, you have 1 minute  ";
 4446 PRINT;" to get to the East end of the courtyard";
 4447 PRINT;" before the guards come looking for you.";
 4448 PRINT;"                                        ";
 4449 PRINT;" Finally, your time is assessed in terms";
 4450 PRINT;" of days taken to escape,               ";
 4451 PRINT;" 5 minutes of real time = 1 game day.   ";
 4452 PRINT;"                                        ";
 4453 PRINT;"                                        ";
 4454 PRINT;"                                        ";
 4455 PRINT;CHR$131;"           Press any key..."; : G$=GET$
 4470 CLS : PROCDBL(14,6,"WARNING")
 4471 PRINT;"                                        "
 4472 PRINT;"                                        "
 4473 PRINT;" Being found with items of escape kit   ";
 4474 PRINT;" will earn you 30 days in the cooler.   ";
 4475 PRINT;"                                        ";
 4476 PRINT;"                                        ";
 4477 PRINT;" Do you want to read this introduction  ";
 4480 PRINT;" again (Y-N)?"; : Q$=GET$IF Q$="Y" THEN 4380 ELSE ENDPROC
 4490 :
 4500 DATA FOOD,CHOCOLATE,MAP,COMPASS,TOBACCO,WATER BOTTLE,CLOTHING,ROPE,CLOTHING,DOCUMENT,PASS,KNIFE,SMALL KEY,LARGE KEY,SCREWDRIVER,HAMMER,SHOVEL,DOCUMENT,PASS,KEY,LADDER,GUN,FOOD,RADIO
 4510 DATA DOCUMENT,PARCEL,WIRE,MANHOLE COVER,GRILL,SPANNER
 4520 DATA The sick-bay with empty beds.,The doctor's surgery. A desk.,The chapel.,The chaplain's vestry.,German guards' rest room,The camp theatre.,British prisoners' dormitory
 4530 DATA Showers. Bare stone walls.,The Camp Commandant's bedroom,A bare landing.,The German officers' mess.,British officers' bedrooms,British officers' mess.,A deep dry moat for exercise.,The Gatehouse.,German officers' dormitory
 4540 DATA Coal and coke store.,Spiral stairs,A landing on spiral stairs,A spiral staircase,A storeroom for scenery,German lookout & armoury,The camp kitchen,German guard room.,Camp Commandant's office,Red-Cross parcels store
 4550 DATA An interrogation room,Castle courtyard.,Disused sewer pipe,An empty lumber room,The road to the village.,The roof. No way down.,Large drainage pipe
 4560 :
 4600 REM GET SYSTEM VARS.
 4610 DEF FN_GETBYTE_VDP(V%)
 4620 A% = &A0
 4630 L%=V%
 4640 = USR(&FFF4)
 4650 :
 4660 DEF FN_GETWORD_VDP(V%)
 4670 = FN_GETBYTE_VDP(V%) +256 *FN_GETBYTE_VDP(V% +1)
 4680 :
 4700 DEF PROChideCursor : REM Hide Cursor.
 4710 VDU 23,1,0;0;0;0;
 4720 ENDPROC

