   10 REM ==================================================
   20 REM TREASURE HUNT BY LANCE MICKLUS, WINOOSKI, VERMONT
   30 REM COPYRIGHT SEPTEMBER 1978
   40 REM VERSION 2.1 : TRS-80/16K LEVEL II
   50 REM ==================================================
   60 REM Ported to the BBC Micro in 2021 by Lee Newsome.
   70 REM Ported to the Agon Light in 2024 by Steve Lovejoy.
   80 REM ==================================================
   90 REM
  100 CLS
  110 PROCvars
  120 PROCdrawHud(HudCol%) : REM draw border etc.
  130 PROC_messageViewPort : REM set the text view port.
  140 :
  150 COLOUR Text1Col% : PRINT TAB(11)"By Lance Micklus"
  160 COLOUR Text2Col%
  170 PRINT""
  180 PRINT"The LUMUS CAVES, located in Lumusville,"
  190 PRINT"Vermont are said to have 20 hidden"
  200 PRINT"treasures in them. Few explore the caves"
  210 PRINT"because it is said that pirates and"
  220 PRINT"dragons live there, and there are deep"
  230 PRINT"pits which many have fallen into and"
  240 PRINT"DIED."
  250 PRINT""
  260 PRINT"You, a smart and brave Human, and I, an"
  270 PRINT"alert computer will explore the caves"
  280 PRINT"and try to find the treasure. I will be"
  290 PRINT"Your eyes and ears and will tell you if"
  300 PRINT"there's danger ahead."
  310 PRINT""
  320 PRINT"I hope you brought a map if not You'll"
  330 PRINT"have to make one up as We explore."
  340 REM
  350 PRINT""
  360 PRINT""
  370 COLOUR Text1Col% : INPUT"    Hit Enter When You're Ready";B$ : COLOUR Text2Col%
  380 CLS
  390 DIM A(425)
  400 REM
  410 REM ORISMOLOGY OF THE A ARRAY
  420 REM -------------------------
  430 REM A(0) TO A(94)     CAVE CONTENTS
  440 REM A(96) TO A(130)   TREASURE TO BE KEPT
  450 REM A(131) TO A(133)  TREASURE BEING CARRIED
  460 REM A(134) TO A(136)  ADJACENT CAVE CONNECTIONS
  470 REM A(137) TO A(421)  CAVE CONNECTION DATA ARRAY
  480 REM
  490 REM ORISMOLOGY OF NON TREASURES
  500 REM ---------------------------
  510 REM 1 = NOT USED
  520 REM 2 = PITS
  530 REM 3 = PIRATE
  540 REM 4 = DRAGON
  550 REM 5 = VENDING MACHINE
  560 REM 6 = CAVE IN >>> DANGER <<<
  570 REM 7 = ELF
  580 REM 8 = MAGICIAN'S CAVE
  590 REM 9 = INVISIBLE DOG
  600 REM
  610 REM INITIALIZE & SET UP THE CAVES
  620 REM -----------------------------
  630 REM
  640 FOR I=1 TO 3
  650   N=3+RND(88)
  660   IF A(N)<>0 THEN 650
  670   A(N)=2
  680 NEXT I
  690 FOR I=3 TO 9
  700   N=3+RND(88)
  710   IF A(N)<>0 THEN 700
  720   A(N)=I
  730 NEXT I
  740 FOR I=288 TO 304
  750   N=RND(94)
  760   IF A(N)<>0 THEN 750
  770   A(N)=I
  780 NEXT  I
  790 RESTORE
  800 FOR N=1 TO 23
  810   READ A$
  820 NEXT N
  830 FOR N=137 TO 421
  840   READ A(N)
  850 NEXT N
  860 W=0 : REM USER'S CAVE LOCATION
  870 M=0 : REM BECOMES A 1 WHEN CARRYING MAGIC CARPET
  880 B=200 : REM BATTERY POWER LEFT
  890 D=0 : REM BECOMES A 1 AFTER INVISIBLE DOG IS FOUND
  900 PRINT"Welcome to the "; : COLOUR Text1Col% : PRINT"LUMUS CAVE "; : COLOUR Text2Col% : PRINT"where You'll "
  910 PRINT"find Mystery, Treasure, and Adventure."
  920 REM
  930 PRINT""
  940 GOTO 1010
  950 REM
  960 REM MAIN ROUTINE
  970 REM ----------------
  980 CLS
  990 B=B-1
 1000 IF B=0 THEN 4430
 1010 IF W=0 THEN 3770
 1020 REM
 1030 REM ::::: CHANCE SITUATIONS :::::
 1040 REM
 1050 IF RND(200)=200 THEN GOSUB 2410
 1060 IF RND(200)=200 THEN GOSUB 2650
 1070 IF D=0 AND A(W)=0 AND RND(50)=50 THEN GOSUB 3160
 1080 IF A(W)=6 AND RND(5)=5 THEN 4230
 1090 IF M=1 AND RND(5)=5 THEN GOSUB 3330
 1100 REM
 1110 REM ::::: SEE IF SPECIAL SITUATION :::::
 1120 REM
 1130 IF A(W)=2 THEN 4070
 1140 IF A(W)=4 THEN 3500
 1150 IF A(W)=5 THEN GOSUB 2280
 1160 IF A(W)=7 THEN PRINT"There's a shy little elf in here hiding something."
 1170 IF A(W)=8 THEN 2960
 1180 REM
 1190 REM ::::: WHERE YOU CAN GO NEXT :::::
 1200 REM
 1210 GOSUB 3990
 1220 Z=W
 1230 GOSUB 4880
 1240 FOR N=134 TO 136
 1250   IF A(N)<0 THEN 1290
 1260   PRINTTAB(5)"CAVE ";A(N);
 1270   IF A(N)=0 PRINT" - THE ENTRANCE" : GOTO 1290
 1280   PRINT""
 1290 NEXT N
 1300 REM
 1310 REM ::::: QUIT & BATTERY TEST :::::
 1320 REM
 1330 IF B>190 THEN 1380
 1340 IF W<>0 THEN 1380
 1350 INPUT"Do You want to explore more";AN$
 1360 IF LEFT$(AN$,1)="N" THEN 4510
 1370 IF LEFT$(AN$,1)<>"Y" THEN 1350
 1380 IF B=50 PRINT"" : PRINT"I hope You brought more flash light" : PRINT"batteries."
 1390 IF B=25 PRINT"" : PRINT"Your flash light is starting to dim a" : PRINT"little."
 1400 IF B=8 PRINT"" : PRINT"Your flash light is almost out. Better" : PRINT"leave now!!!"
 1410 IF A(W)=3 GOSUB 2830
 1420 REM
 1430 REM ::::: ADJACENT CAVE'S CONTENTS :::::
 1440 REM
 1450 K=0
 1460 L=0
 1470 FOR N=134 TO 136
 1480   J=A(N)
 1490   IF J<0 THEN 1590
 1500   IF A(J)=5 THEN 1590
 1510   IF A(J)>0 AND A(J)<10 AND K=0 THEN PRINT"" : K=1
 1520   IF A(J)=2 AND L=0 PRINT"There's pits nearby. watch Your" : PRINT"step." : L=1
 1530   IF A(J)=3 PRINT"Careful. There's a pirate near here."
 1540   IF A(J)=4 PRINT"I hear a hungry dragon waiting for his" : PRINT"supper."
 1550   IF A(J)=6 PRINT"here's a sign here that says," : PRINT"        >>> D A N G E R <<<"
 1560   IF A(J)=7 PRINT"Sounds like somebody is singing, must be" : PRINT"an elf."
 1570   IF A(J)=8 PRINT"There's a strange mist in this cave."
 1580   IF A(J)=9 PRINT"''RUFF RUFF''  I hear a dog barking."
 1590 NEXT N
 1600 IF A(131)=0 THEN 1700
 1610 PRINT""
 1620 COLOUR Text1Col% :  PRINT"You're carrying:" : COLOUR Text2Col%
 1630 FOR N=131 TO 133
 1640   IF A(N)<100 THEN 1680
 1650   Z=A(N)
 1660   GOSUB 4800
 1670   PRINT A$,
 1680 NEXT N
 1690 PRINT""
 1700 IF A(W)<100 THEN PRINT : GOTO 1940
 1710 REM
 1720 REM ::::: TREASURE IN THIS CAVE :::::
 1730 REM
 1740 PRINT""
 1750 Z=A(W)
 1760 GOSUB 4800
 1770 PRINT"This cave has ";A$;" in it."
 1780 INPUT"Do You want to take it with You";AN$
 1790 IF LEFT$(AN$,1)="N" THEN 1940
 1800 IF LEFT$(AN$,1)<>"Y" THEN 1780
 1810 IF Z=290 GOSUB 2120
 1820 IF Z=290 THEN 1940
 1830 IF Z=291 THEN M=1
 1840 IF Z=294 GOSUB 2510
 1850 IF Z=1 THEN 1940
 1860 IF Z=295 THEN 4320
 1870 FOR N=131 TO 133
 1880   IF A(N)=0 A(N)=A(W) : A(W)=0 : n=N : N=133 : NEXT N : N=n : GOTO 1930
 1890 NEXT N
 1900 PRINT"You can't pick it up now. You're"
 1910 PRINT"carrying too much."
 1920 GOTO 1940
 1930 PRINT"O.K You've got ";A$;"."
 1940 IF A(W)=7 THEN A(W)=307
 1950 REM
 1960 REM ::::: WHERE TO NEXT :::::
 1970 REM
 1980 COLOUR Text1Col% : INPUT"What cave do You want to explore next:";J : COLOUR Text2Col%
 1990 FOR N=134 TO 136
 2000   IF A(N)=-1 THEN 2020
 2010   IF J=A(N) THEN W=J : n=N : N=136 : NEXT N : N=n : GOTO 980
 2020 NEXT N
 2030 IF M=1 AND J>=0 AND J<=94 THEN W=J : GOTO 980
 2040 PRINT"Sorry but You can't go there from here."
 2050 GOTO 1980
 2060 REM
 2070 REM SPECIAL SITUATION SUBROUTINES
 2080 REM -----------------------------
 2090 REM
 2100 REM ::::: LOCK BOX :::::
 2110 REM
 2120 FOR N=131 TO 133
 2130   IF A(N)=289 n=N : N=133 : NEXT N : N=n : GOTO 2170
 2140 NEXT N
 2150 PRINT"You can't take it. It's too heavy."
 2160 RETURN
 2170 PRINT"The box was too heavy so I opened it"
 2180 PRINT"with Your keys."
 2190 PRINT"Inside the box is a ruby which You can"
 2200 PRINT"take."
 2210 A(W)=308
 2220 Z=308
 2230 GOSUB 4800
 2240 RETURN
 2250 REM
 2260 REM ::::: VENDING MACHINE :::::
 2270 REM
 2280 PRINT"There's a vending machine here."
 2290 FOR N=131 TO 133
 2300   IF A(N)=288 THEN n=N : N=133 : NEXT N : N=n : GOTO 2330
 2310 NEXT N
 2320 RETURN
 2330 PRINT"I'll get some batteries with one of"
 2340 PRINT"Your gold coins."
 2350 B=200
 2360 A(W)=0
 2370 RETURN
 2380 REM
 2390 REM ::::: EARTHQUAKE :::::
 2400 REM
 2410 FOR N=1 TO 10
 2420   Z=3+RND(88)
 2430   GOSUB 4710
 2440 NEXT N
 2450 PRINT"Guess what? we just had an earthquake."
 2460 PRINT"But I'm O.K."
 2470 RETURN
 2480 REM
 2490 REM ::::: MAGIC WAND ROUTINE :::::
 2500 REM
 2510 FOR N=131 TO 133
 2520   IF A(N)=293 n=N : N=133 : NEXT N : N=n : GOTO 2570
 2530 NEXT N
 2540 PRINT"It's stuck in the rocks and can't be"
 2550 PRINT"pulled out."
 2560 Z=1 : RETURN
 2570 PRINT"Let me use Your magic wand a second."
 2580 FOR Z=0 TO 1000 : NEXT Z
 2590 PRINT"HOCUS, POCUS..."
 2600 FOR Z=0 TO 1000 : NEXT Z
 2610 A(W)=310 : Z=0
 2620 RETURN
 2630 REM
 2640 REM ::::: BATS SHOW UP :::::
 2650 REM
 2660 PRINT"A super bat just flew into the cave and"
 2670 PRINT"picked You up."
 2680 IF A(131)<>0 PRINT"You dropped all of Your treasure's."
 2690 FOR N=131 TO 133
 2700   IF A(N)=0 THEN 2720
 2710   A(0)=A(N) : A(N)=0 : Z=0 : GOSUB 4710
 2720 NEXT N
 2730 N=RND(94)
 2740 IF A(N)<>0 THEN 2730
 2750 W=N
 2760 PRINT"The bat just dropped You into ";W;"!!!"
 2770 INPUT"If You're alright hit Enter";B$
 2780 CLS
 2790 RETURN
 2800 REM
 2810 REM ::::: PIRATE HERE :::::
 2820 REM
 2830 PRINT""
 2840 PRINT"There was a Pirate in here."
 2850 IF A(131)<>0 THEN PRINT"He just stole all of Your treasure's."
 2860 FOR N=131 TO 133
 2870   A(N)=0
 2880 NEXT N
 2890 Z=W
 2900 GOSUB 4710
 2910 PRINT"He's gone now."
 2920 RETURN
 2930 REM
 2940 REM ::::: MAGICIAN ROUTINE :::::
 2950 REM
 2960 CLS
 2970 PRINT"There's a magician in this cave. He"
 2980 PRINT"says he's lost his magic book."
 2990 PRINT"He said he'd give You a golden harp"
 3000 PRINT"if You'll tell him where it is."
 3010 PRINT"Type in the cave number. If You"
 3020 PRINT"don't know, then just type 99."
 3030 PRINT""
 3040 INPUT"Where's his magic book";J
 3050 IF J<0 OR J>95 THEN 3100
 3060 IF A(J)<>295 THEN 4570
 3070 A(W)=309
 3080 A(J)=0
 3090 GOTO 980
 3100 Z=W
 3110 GOSUB 4710
 3120 GOTO 980
 3130 REM
 3140 REM ::::: INVISIBLE MAN ROUTINE :::::
 3150 REM
 3160 REM PRINT@ 320,"";
 3170 PRINT"The invisible man is here looking for"
 3180 PRINT"his invisible dog."
 3190 PRINT"He says he'll give You a £1000 reward"
 3200 PRINT"if You can tell him where his dog is."
 3210 PRINT"If You don't know, guess."
 3220 PRINT""
 3230 INPUT"What cave is the invisible dog in";J
 3240 CLS
 3250 IF J<0 OR J>95 OR INT(J)<>J OR A(J)<>9 THEN RETURN
 3260 A(W)=305
 3270 A(J)=0
 3280 D=1
 3290 RETURN
 3300 REM
 3310 REM ::::: MAGIC CARPET DISAPPEARS :::::
 3320 REM
 3330 FOR N=131 TO 133
 3340   IF A(N)=291 n=N : N=133 : NEXT N : N=n : GOTO 3380
 3350 NEXT N
 3360 M=0
 3370 RETURN
 3380 A(N)=0
 3390 IF N=133 THEN 3440
 3400 FOR J=N TO 132
 3410   A(J)=A(J+1)
 3420   A(J+1)=0
 3430 NEXT J
 3440 PRINT"POOF!!!"'"Your magic carpet just disappeared."
 3450 M=0
 3460 RETURN
 3470 REM
 3480 REM ::::: DRAGON ROUTINE :::::
 3490 REM
 3500 FOR N=131 TO 133
 3510   IF A(N)=292 n=N : N=133 : NEXT N : N=n : GOTO 3540
 3520 NEXT N
 3530 GOTO 4140
 3540 PRINT"YIKES!!! There's a dragon in here."
 3550 PRINT"give me Your gun, QUICK!!!"
 3560 FORN=0 TO 2000 : NEXT N
 3570 FOR N=1 TO 5
 3580   PRINTTAB(RND(25))"B A N G ! ! !"
 3590   FOR J=0 TO 500 : NEXT J
 3600 NEXT N
 3610 PRINTTAB(RND(30));"POOF!!!"
 3620 PRINT"INCREDIBLE???  The dragon just vanished"
 3630 PRINT"when I shot him right between the eyes."
 3640 PRINT""
 3650 PRINT"But look at this. He left behind his"
 3660 PRINT"little black book with the addresses"
 3670 PRINT"and phone numbers of every beautiful"
 3680 PRINT"Princess that lives in Vermont."
 3690 PRINT""
 3700 INPUT"Hit Enter after You catch Your breath.";B$
 3710 A(W)=306
 3720 B=B+1
 3730 GOTO 980
 3740 REM
 3750 REM ::::: AT ENTRANCE ROUTINE :::::
 3760 REM
 3770 IF A(131)=0 THEN 3840
 3780 FOR N=131 TO 133
 3790   IF A(N)=0 THEN 3830
 3800   J=96
 3810   IF A(J)<>0 THEN J=J+1 : GOTO 3810
 3820   A(J)=A(N)
 3830 NEXT N
 3840 IF A(96)=0 THEN 3910
 3850 PRINT"So far, You've found these treasures"
 3860 PRINT"in the caves:"
 3870 FOR N=96 TO 130
 3880   IF A(N)=0 n=N : N=130 : NEXT N : N=n : GOTO 3910
 3890 Z=A(N) : GOSUB 4800 : PRINT A$,
 3900 NEXT N
 3910 FOR N=131 TO 133 : A(N)=0 : NEXT N
 3920 PRINT
 3930 COLOUR Text1Col% : PRINT"" : PRINT"You're at THE ENTRANCE which leads to:" : COLOUR Text2Col%
 3940 B=B+1
 3950 GOTO 1220
 3960 REM
 3970 REM ::::: IN CAVE ROUTINE :::::
 3980 REM
 3990 COLOUR Text1Col% : PRINT"You're in Cave ";W;" which leads to:"' : COLOUR Text2Col%
 4000 RETURN
 4010 REM
 4020 REM END OF PROGRAM ROUTINES
 4030 REM -----------------------
 4040 REM
 4050 REM :::: FELL INTO A PIT ::::
 4060 REM
 4070 PRINT"Sorry, but I tried to warn You."
 4080 PRINT"You fell into a deep pit and"
 4090 PRINT"killed Yourself!!!"
 4100 END
 4110 REM
 4120 REM ::::: EATEN BY THE DRAGON :::::
 4130 REM
 4140 PRINT"Sorry, but I tried to tell you about"
 4150 PRINT"that sound."
 4160 PRINT"Supper is now being served here in the"
 4170 PRINT"dragon's chamber..."
 4180 PRINT"and You are the supper."
 4190 END
 4200 REM
 4210 REM ::::: ROOF FELL IN :::::
 4220 REM
 4230 PRINT"The roof just fell in and buried you"
 4240 PRINT"alive. Too bad I don't have a shovel"
 4250 PRINT"or I'd dig You out."
 4260 PRINT""
 4270 PRINT"See You Later."
 4280 END
 4290 REM
 4300 REM ::::: PICKED UP MAGIC BOOK :::::
 4310 REM
 4320 CLS
 4330 PRINT"I don't think You should have done that."
 4340 PRINT"The magician who owns that magic book"
 4350 PRINT"put a spell on it. Anyone who tries to"
 4360 PRINT"pick it up turns into a frog."
 4370 PRINT""
 4380 PRINT"Excuse me while I look for some flies."
 4390 END
 4400 REM
 4410 REM ::::: BATTERIES WENT DEAD :::::
 4420 REM
 4430 PRINT"Now look what You did. Your flash light"
 4440 PRINT"went out and You fell into a pit and"
 4450 PRINT"killed Yourself. Too bad. Especially"
 4460 PRINT"after You were doing so well."
 4470 END
 4480 REM
 4490 REM ::::: USER QUITS :::::
 4500 REM
 4510 PRINT"The treasures are Yours to keep."
 4520 PRINT"        GOOD LUCK!!!"
 4530 END
 4540 REM
 4550 REM ::::: MAGICIAN UPSET :::::
 4560 REM
 4570 PRINT""
 4580 PRINT"You've made the magician very angry."
 4590 PRINT"Cave ";J;" doesn't have a magic book"
 4600 PRINT"in it. To punish You, the magician"
 4610 PRINT"cast a spell on You and now You're only"
 4620 PRINT"2 inches tall. Worst yet, the magician"
 4630 PRINT"put You in a small jar."
 4640 END
 4650 REM
 4660 REM UTILITY SUBROUTINES
 4670 REM -------------------
 4680 REM
 4690 REM ::::: MOVE ITEM TO NEW CAVE LOCATION :::::
 4700 REM
 4710 Y=3+RND(88)
 4720 IF A(Y)<>0 THEN 4710
 4730 IF (Y=W) OR (Y=Z) THEN 4710
 4740 A(Y)=A(Z)
 4750 A(Z)=0
 4760 RETURN
 4770 REM
 4780 REM ::::: MAKE A$ NAME OF TREASURE :::::
 4790 REM
 4800 RESTORE
 4810 FOR X=0 TO Z-288
 4820   READ A$
 4830 NEXT X
 4840 RETURN
 4850 REM
 4860 REM ::::: SET UP CONNECTING CAVE NUMBERS :::::
 4870 REM
 4880 FOR X=0 TO 2
 4890   A(134+X)=A(137+X+(Z*3))
 4900 NEXT X
 4910 RETURN
 4920 REM
 4930 REM TREASURE LIST
 4940 REM -------------
 4950 REM
 4960 DATA"GOLD COINS"
 4970 DATA"some KEYS"
 4980 DATA"a LOCKED BOX"
 4990 DATA"a MAGIC CARPET"
 5000 DATA"an OLD GUN"
 5010 DATA"a MAGIC WAND"
 5020 DATA"a SWORD"
 5030 DATA"MAGIC BOOK"
 5040 DATA"an OLD CLOCK"
 5050 DATA"FURS"
 5060 DATA"a SILVER BELL"
 5070 DATA"a NECKLACE"
 5080 DATA"PEARL"
 5090 DATA"a DIAMOND"
 5100 DATA"a GOLD WATCH"
 5110 DATA"an EMERALD"
 5120 DATA"JEWELLERY"
 5130 DATA"a $1000 NOTE"
 5140 DATA"a BLACK BOOK"
 5150 DATA"some ELF FOOD"
 5160 DATA"a RUBY"
 5170 DATA"a GOLDEN HARP"
 5180 DATA"a SWORD"
 5190 REM
 5200 REM DATA FOR CONNECTING CAVES
 5210 REM -------------------------
 5220 REM
 5230 DATA 1,94,-1
 5240 DATA 0,2,3
 5250 DATA 1,4,5
 5260 DATA 1,6,7
 5270 DATA 2,8,9
 5280 DATA 2,10,11
 5290 DATA 3,12,13
 5300 DATA 3,14,15
 5310 DATA 4,16,17
 5320 DATA 4,18,19
 5330 DATA 5,20,21
 5340 DATA 5,22,23
 5350 DATA 6,24,25
 5360 DATA 6,26,27
 5370 DATA 7,28,29
 5380 DATA 7,30,31
 5390 DATA 8,32,33
 5400 DATA 8,34,35
 5410 DATA 9,36,37
 5420 DATA 9,38,39
 5430 DATA 10,40,41
 5440 DATA 10,42,43
 5450 DATA 11,44,45
 5460 DATA 11,46,47
 5470 DATA 12,48,49
 5480 DATA 12,50,51
 5490 DATA 13,52,53
 5500 DATA 13,54,55
 5510 DATA 14,56,57
 5520 DATA 14,58,59
 5530 DATA 15,60,61
 5540 DATA 15,62,63
 5550 DATA 16,63,64
 5560 DATA 16,34,64
 5570 DATA 17,33,65
 5580 DATA 17,36,65
 5590 DATA 18,35,66
 5600 DATA 18,38,66
 5610 DATA 19,37,67
 5620 DATA 19,40,67
 5630 DATA 20,39,68
 5640 DATA 20,42,68
 5650 DATA 21,41,69
 5660 DATA 21,44,69
 5670 DATA 22,43,70
 5680 DATA 22,46,70
 5690 DATA 23,45,71
 5700 DATA 23,48,71
 5710 DATA 24,47,72
 5720 DATA 24,50,72
 5730 DATA 25,49,73
 5740 DATA 25,52,73
 5750 DATA 26,51,74
 5760 DATA 26,54,74
 5770 DATA 27,53,75
 5780 DATA 27,56,75
 5790 DATA 28,55,76
 5800 DATA 28,58,76
 5810 DATA 29,57,77
 5820 DATA 29,60,77
 5830 DATA 30,59,78
 5840 DATA 30,62,78
 5850 DATA 31,61,79
 5860 DATA 31,32,79
 5870 DATA 32,33,80
 5880 DATA 34,35,80
 5890 DATA 36,37,81
 5900 DATA 38,39,81
 5910 DATA 40,41,82
 5920 DATA 42,43,82
 5930 DATA 44,45,83
 5940 DATA 46,47,83
 5950 DATA 48,49,84
 5960 DATA 50,51,84
 5970 DATA 52,53,85
 5980 DATA 54,55,85
 5990 DATA 56,57,86
 6000 DATA 58,59,86
 6010 DATA 60,61,87
 6020 DATA 62,63,87
 6030 DATA 64,65,88
 6040 DATA 66,67,88
 6050 DATA 68,69,89
 6060 DATA 70,71,89
 6070 DATA 72,73,90
 6080 DATA 74,75,90
 6090 DATA 76,77,91
 6100 DATA 78,79,91
 6110 DATA 80,81,92
 6120 DATA 82,83,92
 6130 DATA 84,85,93
 6140 DATA 86,87,93
 6150 DATA 88,89,94
 6160 DATA 90,91,94
 6170 DATA 0,92,93
 6180 :
 6190 DEF PROCvars
 6200 MB%=&40000 : REM Memory Bank &40000.
 6210 Black%=0
 6220 Red%=1
 6230 Green%=2
 6240 Yellow%=3
 6250 Blue%=4
 6260 Magenta%=5
 6270 Cyan%=6
 6280 LtGray%=7
 6290 DkGray%=8
 6300 IntRed%=9
 6310 IntGreen%=10
 6320 IntYellow%=11
 6330 IntBlue%=12
 6340 IntMagenta%=13
 6350 IntCyan%=14
 6360 White%=15
 6370 MODE 8
 6380 COLOUR 128+Black% : REM set background colour.
 6390 COLOUR White% : REM set foreground text colour.
 6400 PrimCol% = IntCyan%
 6410 SecCol% = IntGreen%
 6420 Text1Col% = IntCyan%
 6430 Text2Col% = White%
 6440 HudCol% = PrimCol% : REM set hud colour.
 6450 SW%=1279:SH%=1023:STW%=39:STH%=29:HSPLITY%=SH%-140 : REM SW & SH are in graphical units. STW & STH are charactors.
 6460 LT%=0:RT%=STW%:T1X=0:T1Y=0:T2X=0:T2Y=0 : REM margins and text position vars.
 6470 ENDPROC : REM end vars.
 6480 :
 6490 DEF PROCdrawHud(Col%)
 6500 VDU 18,0,Col%
 6510 VDU 26
 6520 MOVE 0,HSPLITY% : DRAW 0,SH% : MOVE 1,HSPLITY% : DRAW 1,SH% : MOVE 2,HSPLITY% : DRAW 2,SH% : REM left border.
 6530 MOVE 0,0 : DRAW SW%,0 : MOVE 0,1 : DRAW SW%,1 : MOVE 0,2 : DRAW SW%,2 : REM bottom border.
 6540 MOVE SW%,HSPLITY% : DRAW SW%,SH% : MOVE SW%-1,HSPLITY% : DRAW SW%-1,SH% : MOVE SW%-2,HSPLITY% : DRAW SW%-2,SH% : REM right border
 6550 MOVE 0,SH% : DRAW SW%,SH% : MOVE 0,SH%-1 : DRAW SW%,SH%-1 : MOVE 0,SH%-2 : DRAW SW%,SH%-2 : REM top border.
 6560 MOVE 0,HSPLITY% : DRAW SW%,HSPLITY% : MOVE 0,HSPLITY%-1 : DRAW SW%,HSPLITY%-1
 6570 MOVE 0,HSPLITY%-2 : DRAW SW%,HSPLITY%-2 : REM horizontal split 1.
 6580 COLOUR Text1Col% : PRINT''TAB(STW%/2 -12,1)"T R E A S U R E   H U N T" : PRINT TAB(STW%/2 -12,2)"=========================" : COLOUR Text2Col%
 6590 ENDPROC : REM end draw hud.
 6600 :
 6610 DEF PROC_messageViewPort
 6620 VDU 28,0,STH%-1,RT%,5 : REM SET text View Port (Left,Bottom,Right,Top).
 6630 REM COLOUR 128+DkGray%. used to test VP.
 6640 REM CLS
 6650 ENDPROC
 6660 :
 6670 DEF PROC_resetViewPorts
 6680 VDU 26
 6690 ENDPROC
 6700 :
