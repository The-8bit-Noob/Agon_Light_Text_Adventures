   10 REM ******************************
   20 REM *    THE HAUNTED HOUSE IV    *
   30 REM *  This Version Is For The   *
   40 REM *      **Agon Light2**       *
   50 REM *          MODE  8           *
   60 REM *     BY STEVE LOVEJOY       *
   70 REM *         March 2024         *
   80 REM ******************************
   90 :
  100 REM CREDITS:
  110 REM Haunted House was originally
  120 REM written by Jenny Tylor and
  130 REM Les Howarth for Usborne Books.
  140 REM It was a type-in listing from
  150 REM back in 1983.
  160 REM I've Ported it to the agon light2
  170 REM plus added graphics & sound etc.
  180 :
  190 PROC_Vars
  200 PROC_LoadChars
  210 PROC_InitScreen
  220 PROC_ClearAudioCh
  230 PROC_LoadBitmaps
  240 PROC_LoadSounds
  250 PROC_TitleSplash
  260 PROC_HauntedInit
  270 PROC_MainLoop
  280 :
  290 DEF PROC_MainLoop : REM MAIN GAME LOOP.
  300 PROC_resetViewPort
  310 CLS
  320 :
  330 Map$ = STR$(rm%) : REM IF rm%=41 AND route$(49)="SW" THEN Map$ = STR$(64)
  340 :
  350 PROC_drawHud
  360 PROC_LoadMap(Map$) : REM load map.
  370 PROC_ShowMap(24,35,24) : REM show map.
  380 :
  390 COLOUR Yellow%
  400 PROC_locationViewPort
  410 PRINT "You are ";
  420 PRINT loc$(rm%)
  430 :
  440 COLOUR Green%
  450 PROC_resetViewPort
  460 PRINT TAB(LT%,STH%/4*3-2);"Current Exits: ";
  470 COLOUR Yellow%
  480 FOR I=1 TO LEN(route$(rm%))
  490   PRINT MID$(route$(rm%),I,1);",";
  500 NEXT I
  510 VDU 127 : REM backspace
  520 :
  530 COLOUR Green%
  540 PRINT TAB(RT%+1,3);"RuckSacK"
  550 COLOUR Yellow%
  560 FOR I=1 TO get% : REM display collected items in rucksack.
  570   IF cy%(I)=1 THEN PRINT TAB(RT%+1,4+(I)) obj$(I)
  580 NEXT I
  590 :
  600 COLOUR Green%
  610 PRINT TAB(RT%+1,1);"Score"
  620 score%=0 : REM GET score
  630 FOR I=1 TO get%
  640   IF cy%(I)=1 THEN score%=score%+1
  650 NEXT I
  660 COLOUR Yellow%
  670 PRINT TAB(RT%+7,1);"";score% : REM PRINT score
  680 :
  690 COLOUR Green%
  700 PROC_messageViewPort
  710 CLS
  720 PRINT ;msge$ : msge$="What"
  730 PRINT ;"What will You do now"
  740 PRINT : FOR I=1 TO get%
  750   IF loc%(I)=rm% AND flag%(I)=0 THEN PRINT ;"You can see a ";:COLOUR Yellow%:PRINT obj$(I);:COLOUR Green%:PRINT " here"
  760 NEXT I
  770 :
  780 COLOUR Yellow%
  790 PRINT ""; : INPUT in$
  800 vb$="" : n$="" : vb%=0 : ob%=0
  810 FOR I=1 TO LEN(in$)
  820   IF MID$(in$,I,1)=" " AND vb$="" THEN vb$=LEFT$(in$,I-1)
  830   IF MID$(in$,I+1,1)<>" " AND vb$<>"" THEN n$=MID$(in$,I+1,LEN(in$)-1) : I=LEN(in$)
  840 NEXT I
  850 IF n$="" THEN vb$=in$
  860 FOR I=1 TO nvbs%
  870   IF vb$=vb$(I) THEN vb%=I
  880 NEXT I
  890 FOR I=1 TO nobs%
  900   IF LEFT$(n$,3)=gob$(I) THEN ob%=I
  910 NEXT I
  920 :
  930 IF n$>"" AND ob%=0 THEN msge$="That is silly!"
  940 IF vb%=0 THEN vb%=vb%+1
  950 IF n$="" THEN  msge$="-"
  960 IF vb%>nvbs% AND ob%>0 THEN msge$="You can not '"+in$+"'"
  970 IF vb%>nvbs% AND ob%=0 THEN msge$="You do not make sense!"
  980 IF vb%<nvbs% AND ob%>0 AND cy%(ob%)=0 THEN msge$="You do not have '"+n$+"'"
  990 IF flag%(26)=1 AND rm%=13 AND RND(3)<>3 AND vb%<>21 THEN msge$="VAMPIRE BATS ARE ATTACKING YOU!" : PROC_sound_gameover : PROC_MainLoop
 1000 IF rm%=44 AND RND(2)=1 AND flag%(24)<>1 THEN flag%(27)=1
 1010 :
 1020 IF vb%=1 PROC_help
 1030 IF vb%=2 PROC_rucksack
 1040 IF vb%=3 PROC_move
 1050 IF vb%=4 PROC_move
 1060 IF vb%=5 PROC_move
 1070 IF vb%=6 PROC_move
 1080 IF vb%=7 PROC_move
 1090 IF vb%=8 PROC_move
 1100 IF vb%=9 PROC_move
 1110 IF vb%=10 PROC_take
 1120 IF vb%=11 PROC_take
 1130 IF vb%=12 PROC_open
 1140 IF vb%=13 PROC_exam
 1150 IF vb%=14 PROC_read
 1160 IF vb%=15 PROC_say
 1170 IF vb%=16 PROC_dig
 1180 IF vb%=17 PROC_swing
 1190 IF vb%=18 PROC_climb
 1200 IF vb%=19 PROC_light
 1210 IF vb%=20 PROC_blowOut
 1220 IF vb%=21 PROC_spray
 1230 IF vb%=22 PROC_use
 1240 IF vb%=23 PROC_unlock
 1250 IF vb%=24 PROC_leave
 1260 IF vb%=25 PROC_score
 1270 IF vb%=26 PROC_save
 1280 IF vb%=27 PROC_load
 1290 IF vb%=28 PROC_quit
 1300 IF vb%=29 PROC_hint
 1310 :
 1320 IF GAMEOVER=2 THEN PROC_YouDied
 1330 PROC_MainLoop
 1340 ENDPROC : REM END mainLoop.
 1350 END : REM END GAME.
 1360 :
 1370 DEF PROC_Vars : REM Vars *****.
 1380 mode% = 8
 1390 REM colours.
 1400 Black% = 0
 1410 Blue% = 4
 1420 Red% = 9
 1430 Green% = 10
 1440 Yellow% = 11
 1450 Blue% = 12
 1460 Cyan% = 14
 1470 White% = 15
 1480 MB%=&40000 : REM Memory Bank &40000.
 1490 nvbs%=29:nobs%=36:get%=18
 1500 GAMEOVER=1
 1510 DIM GraphicsDim 1024
 1520 DIM SoundsDim 1024
 1530 DIM TheMap%(14,14)
 1540 STW% = 40 : STH% = 30 : RT% = STW%/4*3 : LT% = 1 : T1X = 0 : T1Y = 0 : T2X = 0 : T2Y = 0
 1550 SW% = 1279 : SH% = 1023 : VSPLITX% = SW%/4*3 : HSPLITY% = SH%/4 : REM screen width & height in graphical units.
 1560 XSIZE%=11:YSIZE%=6:XIMP%=0:YIMP%=0:x%=112:y%=96:p%=0:custom%=0:decks%=6
 1570 MyMaps$="maps" : REM maps directory.
 1580 Map$="57" : REM map start point.
 1590 TilesPack$="tiles" : REM changes for your custom tiles directory.
 1600 MapName$=(MyMaps$ + "/" + Map$  + ".map") : REM maps file paths & names.
 1610 MySounds$="sfx" : REM sounds directory.
 1620 :
 1630 ENDPROC : REM END VARS.
 1640 :
 1650 DEF PROC_messageViewPort
 1660 VDU 28,LT%,STH%-2,RT%-2,STH%/4*3+1 : REM SET text VP.
 1670 ENDPROC
 1680 :
 1690 DEF PROC_locationViewPort
 1700 VDU 28,LT%,3,RT%-2,1 : REM SET text VP.
 1710 ENDPROC
 1720 :
 1730 DEF PROC_resetViewPort
 1740 VDU 26
 1750 ENDPROC
 1760 :
 1770 DEF PROC_HideCursor : REM Hide Cursor.
 1780 VDU 23,1,0;0;0;0;
 1790 ENDPROC
 1800 :
 1810 DEF PROC_ShowCursor : REM Show Cursor.
 1820 VDU 23,1,1;0;0;0;
 1830 ENDPROC
 1840 :
 1850 REM Sound Effects.
 1860 DEF PROC_sound_blip
 1870 REM Set buffer 101.
 1880 VDU 23, 0, &85, 1, 4, 8, 101; : REM Set sample for channel 1 to buffer 101.
 1890 VDU 23, 0, &85, 1, 0, 100, 750; 10786 DIV 16; : REM Play sample on channel 1.
 1900 ENDPROC
 1910 :
 1920 DEF PROC_sound_dig
 1930 REM Set buffer 102.
 1940 VDU 23, 0, &85, 2, 4, 8, 102; : REM Set sample for channel 2 to buffer 102.
 1950 VDU 23, 0, &85, 2, 0, 100, 750; 13244 DIV 16; : REM Play sample on channel 2.
 1960 ENDPROC
 1970 :
 1980 DEF PROC_sound_gameover
 1990 REM Set buffer 103.
 2000 VDU 23, 0, &85, 3, 4, 8, 103; : REM Set sample for channel 3 to buffer 103.
 2010 VDU 23, 0, &85, 3, 0, 127, 750; 47669 DIV 16; : REM Play sample on channel 3.
 2020 ENDPROC
 2030 :
 2040 DEF PROC_sound_get
 2050 REM Set buffer 104.
 2060 VDU 23, 0, &85, 4, 4, 8, 104; : REM Set sample for channel 4 to buffer 104.
 2070 VDU 23, 0, &85, 4, 0, 127, 750; 5069 DIV 16; : REM Play sample on channel 4.
 2080 ENDPROC
 2090 :
 2100 DEF PROC_sound_magic
 2110 REM Set buffer 105.
 2120 VDU 23, 0, &85, 5, 4, 8, 105; : REM Set sample for channel 5 to buffer 105.
 2130 VDU 23, 0, &85, 5, 0, 127, 750; 21751 DIV 16; : REM Play sample on channel 5.
 2140 ENDPROC
 2150 :
 2160 DEF PROC_sound_pickup
 2170 REM Set buffer 106.
 2180 VDU 23, 0, &85, 6, 4, 8, 106; : REM Set sample for channel 6 to buffer 106.
 2190 VDU 23, 0, &85, 6, 0, 127, 750; 1903 DIV 16; : REM Play sample on channel 6.
 2200 ENDPROC
 2210 :
 2220 DEF PROC_sound_slam
 2230 REM Set buffer 107.
 2240 VDU 23, 0, &85, 7, 4, 8, 107; : REM Set sample for channel 7 to buffer 107.
 2250 VDU 23, 0, &85, 7, 0, 110, 750; 10368 DIV 16; : REM Play sample on channel 7.
 2260 ENDPROC
 2270 :
 2280 DEF PROC_sound_spray
 2290 REM Set buffer 108.
 2300 VDU 23, 0, &85, 8, 4, 8, 108; : REM Set sample for channel 8 to buffer 108.
 2310 VDU 23, 0, &85, 8, 0, 127, 750; 21725 DIV 16; : REM Play sample on channel 8.
 2320 ENDPROC
 2330 :
 2340 DEF PROC_help
 2350 PROC_messageViewPort
 2360 CLS
 2370 PROC_sound_magic
 2380 COLOUR Green% : PRINT "Words I know: "
 2390 COLOUR Yellow% : PRINT "";
 2400 FOR I=1 TO nvbs%
 2410   PRINT vb$(I);",";
 2420 NEXT I
 2430 msge$="" : PRINT
 2440 PROC_cyon
 2450 ENDPROC : REM END help.
 2460 :
 2470 DEF PROC_rucksack
 2480 PROC_messageViewPort
 2490 CLS
 2500 PROC_sound_magic
 2510 COLOUR Green% : PRINT "RuckSacK: "
 2520 COLOUR Yellow% : PRINT "";
 2530 FOR I=1 TO get%
 2540   IF cy%(I)=1 THEN PRINT obj$(I);",";
 2550 NEXT I
 2560 msge$="" : PRINT
 2570 PROC_cyon
 2580 ENDPROC : REM END rucksack.
 2590 :
 2600 DEF PROC_move
 2610 PROC_sound_pickup
 2620 dir%=0
 2630 IF ob%=0 THEN dir%=vb%-3
 2640 IF ob%=19 THEN dir%=1
 2650 IF ob%=20 THEN dir%=2
 2660 IF ob%=21 THEN dir%=3
 2670 IF ob%=22 THEN dir%=4
 2680 IF ob%=23 THEN dir%=5
 2690 IF ob%=24 THEN dir%=6
 2700 IF rm%=20 AND dir%=5 THEN dir%=1
 2710 IF rm%=20 AND dir%=6 THEN dir%=3
 2720 IF rm%=22 AND dir%=6 THEN dir%=2
 2730 IF rm%=22 AND dir%=5 THEN dir%=3
 2740 IF rm%=36 AND dir%=6 THEN dir%=1
 2750 IF rm%=36 AND dir%=5 THEN dir%=2
 2760 IF flag%(14)=1 THEN msge$="Crash! You fell out of the tree!" : PROC_sound_gameover : flag%(14)=0 : GAMEOVER=2 : ENDPROC
 2770 IF flag%(27)=1 AND rm%=52 THEN msge$="Ghosts will not let you move!" : PROC_sound_gameover : ENDPROC
 2780 IF rm%=45 AND cy%(1)=1 AND flag%(34)=0 THEN msge$="A magical barrier appeared." : PROC_sound_magic : ENDPROC
 2790 IF (rm%=18 AND flag%(0)=0) AND (dir%=1 OR dir%=4) THEN msge$="It is too dark to move, you need a light." : PROC_sound_blip : ENDPROC
 2800 IF rm%=54 AND cy%(15)<>1 THEN msge$="You are stuck! Better luck next time." : PROC_sound_gameover : GAMEOVER=2 : ENDPROC
 2810 IF cy%(15)=1 AND NOT(rm%=53 OR rm%=54 OR rm%=55 OR rm%=47) THEN msge$="You cannot carry a boat!" : ENDPROC
 2820 IF (rm%>26 AND rm%<30) AND flag%(0)=0 THEN msge$="It is too dark to move" : PROC_sound_gameover : ENDPROC
 2830 flag%(35)=0 : RL=LEN(route$(rm%))
 2840 REM IF rm%=49 THEN PROC_sound_magic
 2850 FOR I=1 TO RL
 2860   dir$=MID$(route$(rm%),I,1)
 2870   IF (dir$="N" AND dir%=1 AND flag%(35)=0) rm%=rm%-8 : flag%(35)=1
 2880   IF (dir$="S" AND dir%=2 AND flag%(35)=0) rm%=rm%+8 : flag%(35)=1
 2890   IF (dir$="W" AND dir%=3 AND flag%(35)=0) rm%=rm%-1 : flag%(35)=1
 2900   IF (dir$="E" AND dir%=4 AND flag%(35)=0) rm%=rm%+1 : flag%(35)=1
 2910 NEXT I
 2920 msge$="Ready"
 2930 IF flag%(35)=0 THEN msge$="You cannot go that way!" : PROC_sound_blip
 2940 IF dir%<1 THEN msge$="Go where?"
 2950 IF rm%=41 AND flag%(23)=1 THEN route$(49)="W" : msge$="The door slams shut!" : flag%(23)=0 : PROC_sound_slam
 2960 ENDPROC : REM END move
 2970 :
 2980 DEF PROC_take
 2990 IF ob%>get% THEN msge$="You cannot get "+n$ : PROC_sound_blip : ENDPROC
 3000 IF loc%(ob%)<>rm% THEN msge$="It is not here" : PROC_sound_blip
 3010 IF ob%<>0 THEN msge$="WHAT "+n$+"?"
 3020 IF cy%(ob%)=1 THEN msge$="You already have it" : PROC_sound_blip
 3030 IF ob%>0 AND loc%(ob%)=rm% AND flag%(ob%)=0 THEN cy%(ob%)=1 : loc%(ob%)=65 : msge$="You now have it." : PROC_sound_get
 3040 ENDPROC : REM END take
 3050 :
 3060 DEF PROC_open
 3070 IF rm%=43 AND (ob%=28 OR ob%=29) THEN flag%(17)=0 : msge$="The drawer is now open" : PROC_sound_get
 3080 IF rm%=28 AND ob%=25 THEN msge$="It is locked" : PROC_sound_blip
 3090 IF rm%=38 AND ob%=32 THEN msge$="It is now open" : flag%(2)=0 : PROC_sound_get
 3100 ENDPROC : REM END open
 3110 :
 3120 DEF PROC_exam
 3130 IF ob%=10 THEN msge$="It needs batteries"
 3140 IF ob%=30 THEN flag%(18)=0 : msge$="Something falls out the     pocket." : PROC_sound_blip
 3150 IF ob%=31 THEN msge$="That's disgusting!"
 3160 IF (ob%=28 OR ob%=29) THEN msge$="There is a drawer"
 3170 IF ob%=33 OR ob%=5 THEN PROC_read
 3180 IF rm%=43 AND ob%=35 THEN msge$="There is something beyond....."
 3190 IF ob%=32 PROC_open
 3200 ENDPROC : REM END exam
 3210 :
 3220 DEF PROC_read
 3230 IF rm%=42 AND ob%=33 THEN msge$="They are MAGIC spells" PROC_sound_magic
 3240 IF (ob%=3 OR ob%=36) AND cy%(3)=1 AND flag%(34)=0 THEN msge$="It says: Use this word with  care.. AGON" : PROC_sound_magic
 3250 IF cy%(5)=1 AND ob%=5 THEN msge$="The writing is strange  find a Secret room" : PROC_sound_magic
 3260 ENDPROC : REM END read
 3270 :
 3280 DEF PROC_say
 3290 msge$="Ready  "+n$+""
 3300 IF cy%(3)=1 AND ob%=34 THEN msge$="You close your eyes. When you open them something magical has happened." : PROC_sound_magic : IF rm%<>45 THEN rm%=RND(63)
 3310 IF cy%(3)=1 AND ob%=34 AND rm%=45 THEN flag%(34)=1
 3320 ENDPROC : REM END say
 3330 :
 3340 DEF PROC_dig
 3350 IF cy%(12)=1 THEN msge$="You made a lovely little hole!" : PROC_sound_dig
 3360 IF cy%(12)=1 AND rm%=30 THEN msge$="You have dug the bars out" : loc$(rm%)="There is a hole in the wall" : route$(rm%)="NSE" : PROC_sound_dig
 3370 ENDPROC : REM END dig
 3380 :
 3390 DEF PROC_swing
 3400 IF cy%(14)<>1 AND rm%=7 THEN msge$="This is no time to play games!" : PROC_sound_dig
 3410 IF ob%=14 AND cy%(14)=1 THEN msge$="You swung it" : PROC_sound_dig
 3420 IF ob%=13 AND cy%(13)=1 THEN msge$="Whoooosshhh!" : PROC_sound_dig
 3430 IF ob%=13 AND cy%(13)=1 AND rm%=43 THEN route$(rm%)="WN" : loc$(rm%)="in the Study with a Desk and a Hole in Wall" : PROC_sound_dig : msge$="You have broken the wall"
 3440 ENDPROC : REM END swing
 3450 :
 3460 DEF PROC_climb
 3470 IF ob%=14 AND cy%(14)=1 THEN msge$="It is not attached to anything!"
 3480 IF ob%=14 AND cy%(14)<>1 AND rm%=7 AND flag%(14)=0 THEN msge$="You see thick forest and a    cliff to the south" : PROC_sound_magic : flag%(14)=1 : ENDPROC
 3490 IF ob%=14 AND cy%(14)<>1 AND rm%=7 AND flag%(14)=1 THEN msge$="Going down!" : flag%(14)=0
 3500 ENDPROC : REM END climb
 3510 :
 3520 DEF PROC_light
 3530 IF ob%=17 AND cy%(17)=1 AND cy%(8)=0 THEN msge$="It will burn your hands!" : PROC_sound_blip
 3540 IF ob%=17 AND cy%(17)=1 AND cy%(9)=0 THEN msge$="You have nothing to light it with!" : PROC_sound_blip
 3550 IF ob%=17 AND cy%(17)=1 AND cy%(9)=1 AND cy%(8)=1 THEN msge$="It casts a flickering light" : PROC_sound_magic : flag%(0)=1
 3560 ENDPROC : REM END light
 3570 :
 3580 DEF PROC_blowOut
 3590 IF flag%(0)=1 THEN flag%(0)=0 : msge$="Extinguished" : PROC_sound_blip
 3600 IF flag%(0)=1 THEN flag%(0)=0 msge$="Your candle is out"
 3610 ENDPROC : REM END blowout
 3620 :
 3630 DEF PROC_spray
 3640 IF ob%=26 AND cy%(16)=1 THEN msge$="Hissssss" : PROC_sound_spray
 3650 IF ob%=26 AND cy%(16)=1 THEN flag%(26)=0 : msge$="Pfffft! Got them!"
 3660 ENDPROC : REM END spray
 3670 :
 3680 DEF PROC_use
 3690 IF ob%=10 AND cy%(10)=1 AND cy%(11)=1 THEN msge$="It is switched on" : PROC_sound_magic : flag%(24)=1
 3700 IF flag%(27)=1 AND flag%(24)=1 THEN msge$="Whizzzz! You vacuumed the ghosts up!" : flag%(27)=0
 3710 ENDPROC : REM END use
 3720 :
 3730 DEF PROC_unlock
 3740 IF rm%=43 AND(ob%=27 OR ob%=28) PROC_open
 3750 IF rm%=28 AND ob%=25 AND flag%(25)=0 AND cy%(18)=1 flag%(25)=1 : route$(rm%)="SEW" : loc$(rm%)="by a huge open door" : msge$="The key turns!" : PROC_sound_magic
 3760 ENDPROC : REM END unlock
 3770 :
 3780 DEF PROC_leave
 3790 IF cy%(ob%)=1 THEN cy%(ob%)=0 : loc%(ob%)=rm% : msge$="Done" : PROC_sound_blip
 3800 ENDPROC : REM END leave
 3810 :
 3820 DEF PROC_score
 3830 PROC_messageViewPort
 3840 CLS
 3850 PROC_sound_magic
 3860 score%=0
 3870 FOR I=1 TO get%
 3880   IF cy%(I)=1 THEN score%=score%+1
 3890 NEXTI
 3900 IF score%=17 AND cy%(15)<>1 AND rm%<>57 THEN PRINT "You have everything" : PRINT "Return to the gate for your final score":
 3910 IF score%=17 AND rm%=57 THEN PRINT "DOUBLE SCORE FOR REACHING HERE!" : score%=score%*2 : PRINT score% : PROC_sound_magic : PROC_cyon : ENDPROC
 3920 PRINT "Your score is ";score% : PROC_cyon : IF score%>18 THEN PRINT "Well done! You have finished the game" : PROC_sound_magic
 3930 ENDPROC : REM END score
 3940 :
 3950 DEF PROC_cyon
 3960 PROC_resetViewPort
 3970 COLOUR Green%
 3980 PRINT TAB(LT%,STH%-2);""; : INPUT "Press Enter to Continue" in$
 3990 PROC_sound_get
 4000 ENDPROC : REM END carry on
 4010 :
 4020 DEF PROC_HauntedInit
 4030 DIM route$(63),loc$(63),obj$(nobs%),vb$(nvbs%),gob$(nobs%)
 4040 DIM cy%(nobs%),loc%(get%),flag%(nobs%)
 4050 DATA 46,38,35,50,13,18,28,42,10,25,26,4,2,7,47,60,43,32
 4060 FOR I=1 TO get%
 4070   READ loc%(I)
 4080 NEXT I
 4090 DATA HELP,RUCKSACK,GO,N,S,W,E,U,D,GET,TAKE,OPEN,EXAMINE,READ,SAY
 4100 DATA DIG,SWING,CLIMB,LIGHT,BLOWOUT,SPRAY,USE,UNLOCK,LEAVE,SCORE,SAVE,LOAD,QUIT,HINT
 4110 FOR I=1 TO nvbs%
 4120   READ vb$(I)
 4130 NEXT I
 4140 DATA SE,WE,WE,SWE,WE,WE,SWE,WS
 4150 DATA NS,SE,WE,NW,SE,W,NE,NSW
 4160 DATA NS,NS,SE,WE,NWUD,SE,WSUD,NS
 4170 DATA N,NS,NSE,WE,WE,NSW,NS,NS
 4180 DATA S,NSE,NSW,S,NSUD,N,N,NS
 4190 DATA NE,NW,NE,W,NSE,WE,W,NS
 4200 DATA SE,NSW,E,WE,NW,S,SW,NW
 4210 DATA NE,NWE,WE,WE,WE,NWE,NWE,W
 4220 FOR I=0 TO 63
 4230   READ route$(I)
 4240 NEXT I
 4250 DATA in a Dark Corner,in an Overgrown      Garden,by a Large Woodpile,in a Yard Littered   with Rubbish
 4260 DATA in a Weedpatch,in a Forest,in a Thicker part of the Forest,by the Blasted Tree
 4270 DATA by the corner of House,at the Entrance to   the Kitchen,in the Kitchen with a Grimy looking Cooker,in the Scullery
 4280 DATA in a Room Thick with Dust,in the Rear Turret Room,in a Clearing,on an Old Footpath
 4290 DATA by the Side of the House,at the Back of the Hallway,in a Dark Alcove,in a Small Dark Room
 4300 DATA at the Bottom of a   Spiral Staircase,in a Wide Passage,On a set of Slippery Steps,On a Cliff Top
 4310 DATA near a Crumbling wall,in a Gloomy Passage,in a Short Corridor,in an Impressive Hallway
 4320 DATA in a Hall by a Thick      Wooden Door. The Door is Locked,in the Trophy Room,in a Cellar with a Barred    Window,on a Cliff Path
 4330 DATA in a Cupboard with a Coat hanging up,in the Front Hall,in the Sitting Room,in a Secret Room
 4340 DATA on some Steep Marble  Stairs,in the Dining Room,in a Deep Cellar with a Closed Coffin,on a Cliff Path
 4350 DATA in a Closet,in the Front Lobby,in a Library full of Evil   Books,in the Study with a Desk and a Hole in Wall
 4360 DATA in a Weird Cobwebbed Room,in an Ice Cold Chamber,in a very Spooky Room,on a Cliff Path. a Marsh Close by
 4370 DATA on a Rubbish Strewn Verandah,on the Front Porch,in the Front Tower,in a Sloping Corridoor
 4380 DATA in the Upper Gallery,in a Marsh by a Wall,in a Marsh,on a Soggy Path
 4390 DATA by the Twisted       Railings,by the Main Iron    gate - It seems Open,by some Old Railings,beneath the Front   Tower
 4400 DATA by some Debris from a  Crumbling Wall,by some Fallen       Brickwork,by a Rotting Stone   Arch,on a Crumbling Clifftop
 4410 FOR I=0 TO 63
 4420   READ loc$(I)
 4430 NEXT I
 4440 DATA "painting","ring","magic","goblet","scroll","coins","statue","glove"
 4450 DATA "matches","vacuum","battery","shovel","axe","rope","boat","aerosol","candle","key"
 4460 DATA NORTH,SOUTH,WEST,EAST,UP,DOWN
 4470 DATA DOOR,BATS,GHOSTS,DRAWER,DESK,COAT,RUBBISH
 4480 DATA COFFIN,BOOKS,AGON,WALL,SPELLS
 4490 DATA PAI,RIN,MAG,GOB,SCR,COI,STA,GLO,MAT,VAC,BAT,SHO,AXE,ROP,BOA,AER,CAN,KEY,NOR,SOU,WES,EAS,UP,DOW,DOO,VBT,GHO,DRA,DES,COA,RUB,COF,BOO,AGO,WAL,SPE
 4500 FOR I=1 TO nobs%
 4510   READ obj$(I)
 4520 NEXT I
 4530 FOR I=1 TO nobs%
 4540   READ gob$(I)
 4550 NEXT I
 4560 flag%(18)=1:flag%(17)=1:flag%(2)=1:flag%(26)=1:flag%(28)=1:flag%(23)=1:rm%=57:msge$="Ready"
 4570 ENDPROC : REM END hauntedInit
 4580 :
 4590 DEF PROC_save
 4600 PROC_messageViewPort
 4610 PRINT ;""; : INPUT "Filename",file$
 4620 PRINT "Saving. Please wait..."
 4630 X=OPENOUT file$
 4640 PRINT#X,rm%
 4650 FOR I=1 TO get% : PRINT#X,loc%(I) : NEXT
 4660 FOR I=0 TO 63 : PRINT#X,loc$(I) : NEXT
 4670 FOR I=0 TO 63 : PRINT#X,route$(I) : NEXT
 4680 FOR I=1 TO nobs% : PRINT#X,cy%(I) : NEXT
 4690 FOR I=1 TO nobs% : PRINT#X,flag%(I) : NEXT
 4700 CLOSE#X
 4710 PROC_sound_magic
 4720 ENDPROC : REM END save.
 4730 :
 4740 DEF PROC_load
 4750 PROC_messageViewPort
 4760 PRINT ;""; : INPUT "Filename",file$
 4770 PRINT ;"" "Loading. Please wait...."
 4780 X=OPENUP file$
 4790 INPUT#X,rm%
 4800 FOR I=1 TO get%:INPUT#X,loc%(I) : NEXT
 4810 FOR I=0TO 63 : INPUT#X,loc$(I) : NEXT
 4820 FOR I=0TO 63 : INPUT#X,route$(I) : NEXT
 4830 FOR I=1 TO nobs%:INPUT#X,cy%(I) : NEXT
 4840 FOR I=1 TO nobs%:INPUT#X,flag%(I) : NEXT
 4850 CLOSE#X
 4860 PROC_sound_magic
 4870 ENDPROC : REM END load.
 4880 :
 4890 DEF PROC_quit
 4900 PROC_messageViewPort
 4910 CLS
 4920 PRINT ;""; : INPUT "Type 'SAVE' OR QUIT: " in$ : PROC_sound_get
 4930 IF in$="SAVE" PROC_save
 4940 IF in$="QUIT" THEN PROC_EndGame
 4950 ENDPROC : REM END quit.
 4960 :
 4980 DEF PROC_hint
 4990 PROC_sound_magic
 5000 IF rm%=13 PROC_print("Have you got the 'Vampire Bat SPRAY' An AEROSOL Can?",Yellow%) : PROC_cyon : ENDPROC
 5010 IF rm%=30 PROC_print("If you have the SHOVEL, use it to DIG WINDOW.",Yellow%) : PROC_cyon : ENDPROC
 5020 IF rm%=32 PROC_print("Try to EXAMINE COAT.",Yellow) : PROC_cyon : ENDPROC
 5030 IF rm%=35 PROC_print("Hmmmm you're in a Library Maybe try READ BOOK.",Yellow%) : PROC_cyon : ENDPROC
 5040 IF rm%=38 PROC_print("Have a look in the COFFIN try OPEN COFFIN.",Yellow%) : PROC_cyon : ENDPROC
 5050 IF rm%=39 PROC_print("Try to EXAMINE DESK, maybe something is there.",Yellow%) : PROC_cyon : ENDPROC
 5060 IF rm%=19 PROC_print("You need that GLOVE",Yellow%) : PROC_cyon : ENDPROC
 5070 IF rm%=45 PROC_print("Do you know the MAGIC Word? If not, you might as well QUIT!",Yellow%) : PROC_cyon : ENDPROC
 5080 IF rm%=43 PROC_print("If You have an AXE try SWING AXE",Yellow%) : PROC_cyon : ENDPROC
 5090 IF rm%=52 PROC_print("USE VACUUM on GHOSTS. You may need the BATTERY 1st.",Yellow%) : PROC_cyon : ENDPROC
 5100 IF rm%=49 PROC_print("Make sure you have one thing before you go into the house, look east.",Yellow%) : PROC_cyon : ENDPROC
 5110 IF rm%=57 PROC_print("Make sure you have one thing before you go into the house, look east.",Yellow%) : PROC_cyon : ENDPROC
 5120 PROC_print("There is not much I can help you with here, SORRY!",Yellow%) : PROC_cyon : ENDPROC
 5130 ENDPROC : REM END proc hint.
 5140 :
 5150 DEF PROC_print(mess$,colour%)
 5160 PROC_messageViewPort
 5170 CLS
 5180 COLOUR colour%
 5190 PRINT mess$
 5200 ENDPROC : REM END print.
 5210 :
 5220 REM ASK Y/N QUESTION. DOES THE USER SAY YES?.
 5230 DEF FN_DO_I_HEAR_YES
 5240 LOCAL ANSWER, KEY%
 5250 ANSWER = FALSE
 5260 KEY% = -1
 5270 REPEAT
 5280   KEY%=INKEY(10000)
 5290 UNTIL KEY% <> -1 AND (KEY% = ASC("Y")) OR (KEY% = ASC("y") OR KEY% = ASC("N")) OR (KEY% = ASC("n"))
 5300 IF (KEY% = ASC("Y")) OR (KEY% = ASC("y")) THEN ANSWER = TRUE
 5310 = ANSWER
 5320 REM END FN do i hear a yes.
 5330 :
 5340 DEF PROC_InitScreen : REM init screen.
 5350 MODE mode%
 5360 COLOUR Red%
 5370 CLS
 5380 CLG
 5390 PROC_HideCursor
 5400 REM VDU 23,27,16 : REM Clear all sprite data.
 5410 ENDPROC : REM END init screen.
 5420 :
 5430 DEF PROC_drawHud : REM DRAW HUD.
 5440 VDU 18,0,Red%
 5450 VDU 26
 5460 MOVE 0,0 : DRAW 0,SH% : MOVE 1,0 : DRAW 1,SH% : MOVE 2,0 : DRAW 2,SH% : REM left border
 5470 MOVE 0,0 : DRAW SW%,0 : MOVE 0,1 : DRAW SW%,1 : MOVE 0,2 : DRAW SW%,2 : REM bottom border
 5480 MOVE SW%,0 : DRAW SW%,SH% : MOVE SW%-1,1 : DRAW SW%-1,SH% : MOVE SW%-2,2 : DRAW SW%-2,SH% : REM right border
 5490 MOVE 0,SH% : DRAW SW%,SH% : MOVE 0,SH%-1 : DRAW SW%,SH%-1 : MOVE 0,SH%-2 : DRAW SW%,SH%-2 : REM top border
 5500 MOVE VSPLITX%,0 : DRAW VSPLITX%,SH% : MOVE VSPLITX%-1,0 : DRAW VSPLITX%-1,SH%
 5510 MOVE VSPLITX%-2,0 : DRAW VSPLITX%-2,SH% : REM vertical split
 5520 MOVE 0,HSPLITY% : DRAW VSPLITX%,HSPLITY% : MOVE 0,HSPLITY%-1 : DRAW VSPLITX%,HSPLITY%-1
 5530 MOVE 0,HSPLITY%-2 : DRAW VSPLITX%,HSPLITY%-2 : REM horizontal split
 5540 ENDPROC : REM END DRAW HUD.
 5550 :
 5560 DEF PROC_TitleSplash : REM Title Splash.
 5570 CLS : PROC_sound_magic
 5580 COLOUR Red%
 5600 PROC_DrawHaunted((STW%/2)-7,5) : REM DRAW HAUNTED.
 5610 PROC_DrawHouse((STW%/2)-5,8) : REM DRAW HOUSE.
 5620 COLOUR Green%
 5630 PRINT "                                       "
 5640 PRINT "                                       "
 5650 PRINT "                                       "
 5660 PRINT "                                       "
 5670 PRINT TAB(STW%/2-13)"  A Text Adventure Game  "
 5680 PRINT TAB(STW%/2-13)"    Haunted House IV     "
 5690 PRINT TAB(STW%/2-13)"  For The Agon Light2    "
 5700 PRINT TAB(STW%/2-13)" By Steve Lovejoy (2024) "
 5710 ANYKEY%=INKEY(2000)
 5720 CLS
 5730 PROC_OfferInstructions
 5740 ENDPROC : REM END Title Splash
 5750 :
 5760 DEF PROC_OfferInstructions : REM Offer Instructions.
 5770 COLOUR Green%
 5780 :
 5790 PRINT TAB((STW%/2)-15,STH%/2)"Do You Want Instructions (Y-N)";
 5800 LOCAL ANSWER
 5810 ANSWER = FALSE
 5820 ANSWER = FN_DO_I_HEAR_YES
 5830 IF ANSWER = TRUE THEN PROC_Instructions
 5840 CLS
 5850 ENDPROC : REM END Offer Instructions.
 5860 :
 5870 DEF PROC_Instructions : REM Instructions.
 5880 CLS
 5890 PROC_sound_magic
 5900 PROC_DrawHaunted((STW%/2)-7,1)
 5910 PROC_DrawHouse((STW%/2)-5,4)
 5920 COLOUR Green%
 5930 PRINT TAB(LT%);""
 5940 PRINT TAB(LT%);""
 5950 PRINT TAB((STW%/2)-18);"This is a text adventure game set in"
 5960 PRINT TAB((STW%/2)-18);"and around an old spooky haunted"
 5970 PRINT TAB((STW%/2)-18);"house. The object of the game is to"
 5980 PRINT TAB((STW%/2)-18);"move through the house and it's"
 5990 PRINT TAB((STW%/2)-18);"grounds and pick up all the hidden"
 6000 PRINT TAB((STW%/2)-18);"objects along the way."
 6010 PRINT TAB((STW%/2)-18);"You will need all objects to gain"
 6020 PRINT TAB((STW%/2)-18);"access to all area's and rooms."
 6030 PRINT TAB((STW%/2)-18);"Good Luck.... You'll need it...."
 6040 PRINT TAB((STW%/2)-18);" "
 6050 COLOUR Yellow%
 6060 PRINT TAB((STW%/2)-18);"You Score By Collecting Items."
 6070 PRINT TAB((STW%/2)-18);"Type HELP For A List Of Commands."
 6080 PRINT TAB((STW%/2)-18);"N,E,S,W Are One-Key Short-Cuts."
 6090 PRINT TAB((STW%/2)-18);"If you want to save the game to "
 6100 PRINT TAB((STW%/2)-18);"continue later, type SAVE."
 6110 PRINT TAB((STW%/2)-18);"If you want a hint when you are stuck"
 6120 PRINT TAB((STW%/2)-18);"type HINT."
 6130 COLOUR Green%
 6140 PRINT TAB(LT%);""
 6150 PRINT TAB((STW%/2)-18);"(Press Any Key To Enter The Horror)"
 6160 PROC_HideCursor
 6170 REPEAT
 6180   ANYKEY%=INKEY(5000)
 6190 UNTIL ANYKEY% <> -1
 6200 CLS
 6210 ENDPROC : REM END Instructions.
 6220 :
 6230 DEF PROC_LoadChars : REM Load Chars.
 6240 REM ASSIGN H to CHRS.
 6250 VDU 23,201,0,56,56,56,56,56,57,59
 6260 VDU 23,202,0,28,28,28,28,28,252,252
 6270 VDU 23,203,57,56,56,56,56,56,56,48
 6280 VDU 23,204,252,60,28,28,28,28,28,12
 6290 REM ASSIGN A to CHARS.
 6300 VDU 23,205,0,1,1,3,3,7,7,7
 6310 VDU 23,206,0,128,128,128,192,192,224,224
 6320 VDU 23,207,15,14,14,30,30,28,60,56
 6330 VDU 23,208,96,112,112,240,248,60,28,30
 6340 REM ASSIGN U to CHARS.
 6350 VDU 23,209,0,16,56,56,56,56,56,56
 6360 VDU 23,210,0,8,28,28,28,28,28,28
 6370 VDU 23,211,56,56,56,56,56,60,60,30
 6380 VDU 23,212,28,28,28,28,28,60,60,120
 6390 REM ASSIGN N to CHARS.
 6400 VDU 23,213,0,24,24,28,30,62,63,63
 6410 VDU 23,214,0,8,28,28,28,28,28,156
 6420 VDU 23,215,63,59,57,56,56,56,56,56
 6430 VDU 23,216,252,252,252,252,124,124,60,28
 6440 REM ASSIGN T to CHARS.
 6450 VDU 23,217,0,24,57,113,3,3,3,3
 6460 VDU 23,218,0,244,248,252,192,192,192,192
 6470 VDU 23,219,3,3,3,3,3,3,3,3
 6480 VDU 23,220,192,192,192,192,192,192,192,192
 6490 REM ASSIGN E to CHARS.
 6500 VDU 23,221,0,12,30,30,30,30,30,30
 6510 VDU 23,222,0,124,124,24,0,0,56,124
 6520 VDU 23,223,30,30,30,30,30,30,30,30
 6530 VDU 23,224,56,0,0,0,0,56,124,56
 6540 REM ASSIGN D to CHARS.
 6550 VDU 23,225,0,48,57,56,56,56,56,56
 6560 VDU 23,226,0,192,224,240,60,28,28,28
 6570 VDU 23,227,56,56,56,56,56,56,56,48
 6580 VDU 23,228,28,28,28,60,252,248,240,192
 6590 REM ASSIGN O to CHARS.
 6600 VDU 23,229,0,2,6,15,30,60,56,120
 6610 VDU 23,230,0,96,96,120,124,28,30,14
 6620 VDU 23,231,120,120,120,120,56,60,30,14
 6630 VDU 23,232,14,14,14,30,30,60,120,112
 6640 REM ASSIGN S to CHARS.
 6650 VDU 23,233,0,7,15,31,63,62,60,31
 6660 VDU 23,234,0,16,188,28,30,12,0,128
 6670 VDU 23,235,15,3,0,0,56,56,60,30
 6680 VDU 23,236,240,248,124,60,60,120,240,224
 6690 REM HUD CHARS.
 6700 REM ASSIGN I to CHARS.
 6710 VDU 23,237,0,24,57,113,3,3,3,3
 6720 VDU 23,238,0,244,248,252,192,192,192,192
 6730 VDU 23,239,3,3,3,3,3,95,63,95
 6740 VDU 23,240,192,192,192,192,192,140,156,56
 6750 REM ASSIGN Y to CHARS.
 6760 VDU 23,241,0,16,56,56,56,56,30,15
 6770 VDU 23,242,0,8,28,28,12,28,124,248
 6780 VDU 23,243,7,3,3,3,3,3,3,3
 6790 VDU 23,244,224,224,192,192,192,192,128,128
 6800 ENDPROC : REM END Load Chars.
 6810 :
 6820 DEF PROC_DrawHaunted(T1X,T1Y)  : REM DRAW haunted.
 6830 REM DISPLAY H (2x2) CHARS.
 6840 COLOUR Red%
 6850 PRINT TAB(T1X,T1Y);CHR$(201);CHR$(202)
 6860 PRINT TAB(T1X,T1Y+1);CHR$(203);CHR$(204)
 6870 REM DISPLAY A (2x2) CHARS.
 6880 PRINT TAB(T1X+2,T1Y);CHR$(205);CHR$(206)
 6890 PRINT TAB(T1X+2,T1Y+1);CHR$(207);CHR$(208)
 6900 REM DISPLAY U (2x2) CHARS.:PRINT TAB(0,3)CHR$(243);
 6910 PRINT TAB(T1X+4,T1Y);CHR$(209);CHR$(210)
 6920 PRINT TAB(T1X+4,T1Y+1);CHR$(211);CHR$(212)
 6930 REM DISPLAY N (2x2) CHARS.
 6940 PRINT TAB(T1X+6,T1Y);CHR$(213);CHR$(214)
 6950 PRINT TAB(T1X+6,T1Y+1);CHR$(215);CHR$(216)
 6960 REM DISPLAY T (2x2) CHARS.
 6970 PRINT TAB(T1X+8,T1Y);CHR$(217);CHR$(218)
 6980 PRINT TAB(T1X+8,T1Y+1);CHR$(219);CHR$(220)
 6990 REM DISPLAY E (2x2) CHARS.
 7000 PRINT TAB(T1X+10,T1Y);CHR$(221);CHR$(222)
 7010 PRINT TAB(T1X+10,T1Y+1);CHR$(223);CHR$(224)
 7020 REM DISPLAY D (2x2) CHARS.
 7030 PRINT TAB(T1X+12,T1Y);CHR$(225);CHR$(226)
 7040 PRINT TAB(T1X+12,T1Y+1);CHR$(227);CHR$(228)
 7050 ENDPROC : REM END DRAW_HAUNTED.
 7060 :
 7070 DEF PROC_DrawHouse(T2X,T2Y) : REM DRAW house.
 7080 REM DISPLAY H (2x2) CHARS.
 7090 COLOUR Red%
 7100 PRINT TAB(T2X,T2Y);CHR$(201);CHR$(202)
 7110 PRINT TAB(T2X,T2Y+1);CHR$(203);CHR$(204)
 7120 REM DISPLAY O (2x2) CHARS.
 7130 PRINT TAB(T2X+2,T2Y);CHR$(229);CHR$(230)
 7140 PRINT TAB(T2X+2,T2Y+1);CHR$(231);CHR$(232)
 7150 REM DISPLAY U (2x2) CHARS.
 7160 PRINT TAB(T2X+4,T2Y);CHR$(209);CHR$(210)
 7170 PRINT TAB(T2X+4,T2Y+1);CHR$(211);CHR$(212)
 7180 REM DISPLAY S (2x2) CHARS.
 7190 PRINT TAB(T2X+6,T2Y);CHR$(233);CHR$(234)
 7200 PRINT TAB(T2X+6,T2Y+1);CHR$(235);CHR$(236)
 7210 REM DISPLAY E (2x2) CHARS.
 7220 PRINT TAB(T2X+8,T2Y);CHR$(221);CHR$(222)
 7230 PRINT TAB(T2X+8,T2Y+1);CHR$(223);CHR$(224)
 7240 ENDPROC : REM END DRAW_HOUSE.
 7250 :
 7260 DEF PROC_DrawYou(T1X,T1Y)  : REM DRAW YOU.
 7270 REM DISPLAY Y (2x2) CHARS.
 7280 COLOUR Red%
 7290 PRINT TAB(T1X,T1Y);CHR$(241);CHR$(242)
 7300 PRINT TAB(T1X,T1Y+1);CHR$(243);CHR$(244)
 7310 REM DISPLAY 0 (2x2) CHARS.
 7320 PRINT TAB(T1X+2,T1Y);CHR$(229);CHR$(230)
 7330 PRINT TAB(T1X+2,T1Y+1);CHR$(231);CHR$(232)
 7340 REM DISPLAY U (2x2) CHARS.
 7350 PRINT TAB(T1X+4,T1Y);CHR$(209);CHR$(210)
 7360 PRINT TAB(T1X+4,T1Y+1);CHR$(211);CHR$(212)
 7370 ENDPROC : REM END DRAW_YOU
 7380 :
 7390 DEF PROC_DrawDied(T2X,T2Y) : REM DRAW died.
 7400 REM DISPLAY D (2x2) CHARS.
 7410 COLOUR Red%
 7420 PRINT TAB(T2X,T2Y);CHR$(225);CHR$(226)
 7430 PRINT TAB(T2X,T2Y+1);CHR$(227);CHR$(228)
 7440 REM DISPLAY I (2x2) CHARS.
 7450 PRINT TAB(T2X+2,T2Y);CHR$(237);CHR$(238)
 7460 PRINT TAB(T2X+2,T2Y+1);CHR$(239);CHR$(240)
 7470 REM DISPLAY E (2x2) CHARS.
 7480 PRINT TAB(T2X+4,T2Y);CHR$(221);CHR$(222)
 7490 PRINT TAB(T2X+4,T2Y+1);CHR$(223);CHR$(224)
 7500 REM DISPLAY D (2x2) CHARS.
 7510 PRINT TAB(T2X+6,T2Y);CHR$(225);CHR$(226)
 7520 PRINT TAB(T2X+6,T2Y+1);CHR$(227);CHR$(228)
 7530 ENDPROC : REM END DRAW_DIED.
 7540 :
 7550 DEF PROC_LoadBitmaps : REM LOAD bitmaps.
 7560 CLS
 7570 REM PROC_LoadBitmap("0","0",0,16,16) : REM LOAD the white square dir 0.
 7580 REM PROC_LoadBitmap("0","1",1,16,16) : REM LOAD THE black tile dir 0.
 7590 PRINT TAB(STW%/2-8,STH%/2);"Loading Scary Bits"
 7600 FOR R%=1 TO decks%
 7610   FOR L%=0 TO 9
 7620     p%=R%*10 : p%=p%+L% : REM Populate empty slots
 7630     PROC_LoadBitmap(STR$(R%),STR$(L%),p%,16,16) : REM directory, filename, sprite number.
 7640     PP$ = STR$(p% - 10)
 7650     DD$ = STR$(decks% * 10)
 7660     PRINT TAB(STW%/2-4,STH%/2+2);"GFX " + PP$ + "/" + DD$
 7670   NEXT
 7680 NEXT
 7690 ENDPROC : REM END load bitmaps.
 7700 :
 7710 DEF PROC_LoadBitmap(D$,F$,N%,W%,H%) : REM Load bitmap.
 7720 REM IF N%=9 THEN PRINT TAB(19,18);"  "
 7730 OSCLI("LOAD " + TilesPack$ + "/" + D$ + "/" + F$ + ".rgb" + " " + STR$(MB%+GraphicsDim))
 7740 VDU 23,27,0,N% : REM select sprite n (equating to buffer ID numbered 64000+n).
 7750 VDU 23,27,1,W%;H%; : REM load colour DATA into current sprite.
 7760 FOR I%=0 TO (W%*H%*4)-1 STEP 4 : REM loop 16x16x4 each pixel r,g,b,a.
 7770   r% = ?(GraphicsDim+I%+0) : REM Red DATA.
 7780   g% = ?(GraphicsDim+I%+1) : REM Green DATA.
 7790   b% = ?(GraphicsDim+I%+2) : REM Blue DATA.
 7800   a% = ?(GraphicsDim+I%+3) : REM Alpha (transparency) DATA.
 7810   VDU r%, g%, b%, a%
 7820 NEXT
 7830 ENDPROC : REM END load bitmap.
 7840 :
 7850 DEF PROC_ShowMap(XLOC%,YLOC%,XSLOC%)
 7860 REM outputs each map location and moves 16 pixels to next. End of each line resets location.
 7870 VDU 24,35;400;1000;1000; : REM GFX VP.
 7880 FOR j=0 TO YSIZE%
 7890   FOR i=0 TO XSIZE%
 7900     g%=TheMap%(i,j)
 7910     VDU 23,27,0,g% : REM select the specified bitmap.
 7920     VDU 23,27,3,XLOC%;YLOC%; : REM displays the bitmap.
 7930     XLOC%=XLOC%+16 : REM update the X location to move to the right.
 7940     IF i=11 THEN YLOC%=YLOC%+16 : XLOC%=XSLOC% : REM at end of row move to start next line and down.
 7950   NEXT
 7960 NEXT
 7970 ENDPROC : REM END show map.
 7980 :
 7990 DEF PROC_LoadMap(Map$)
 8000 fnum=OPENIN (MyMaps$ + "/" + Map$  + ".map")
 8010 IF fnum=0 THEN PRINT TAB(STW%/2-9,STH%/2); Map$; " NOT loaded" : GOTO 8110
 8020 INPUT#fnum,XIMP% :REM Read X map size.
 8030 INPUT#fnum,YIMP% :REM Read Y map size.
 8040 INPUT#fnum,decks% :REM load the number of decks in use.
 8050 INPUT#fnum,custom% :REM read number of custom tile slots.
 8060 FOR j=0TOYIMP% :REM read map based on defined size.
 8070   FOR i=0TOXIMP%
 8080     INPUT#fnum,TheMap%(i,j)  : REM save to map.
 8090   NEXT
 8100 NEXT
 8110 CLOSE#fnum
 8120 ENDPROC : REM END load map.
 8130 :
 8140 DEF PROC_YouDied : REM You Died.
 8150 PROC_resetViewPort
 8160 CLS
 8170 PROC_sound_gameover
 8180 PRINT : PRINT : COLOUR Red%
 8190 PROC_DrawYou(STW%/2-10,8) : REM DRAW YOU.
 8200 PROC_DrawDied(STW%/2-8,11) : REM DRAW DIED.
 8210 COLOUR Green%
 8220 PRINT "                                         "
 8230 PRINT "                                         "
 8240 PRINT "                                         "
 8250 PRINT "                                         "
 8260 PRINT TAB(STW%/2-12)" You Died a Horrible Death "
 8270 PRINT TAB(STW%/2-12)"                           "
 8280 PRINT TAB(STW%/2-12)"        TRY AGAIN          "
 8290 PRINT TAB(STW%/2-12)"          Whimp            "
 8300 PRINT "                                         "
 8310 PRINT TAB(STW%/2-12);""; : INPUT "Play Again Y or N " in$
 8320 IF in$="Y" OR in$="y" THEN PROC_reset
 8330 IF in$="N" OR in$="n" THEN PROC_EndGame
 8340 CLS
 8350 ENDPROC : REM END YouDied.
 8360 :
 8370 DEF PROC_reset
 8380 flag%(18)=1:flag%(17)=1:flag%(2)=1:flag%(26)=1:flag%(28)=1:flag%(23)=1:rm%=57:msge$="Ready"
 8390 GAMEOVER=1
 8400 PROC_TitleSplash
 8410 ENDPROC : REM END reset.
 8420 :
 8430 DEF PROC_EndGame
 8440 MODE 0
 8450 PROC_resetViewPort
 8460 COLOUR White%
 8470 COLOUR Blue%+128
 8480 CLS
 8490 CLG
 8500 PRINT"Agon Ready"
 8510 NEW
 8520 END
 8530 ENDPROC : REM END end game.
 8540 :
 8550 DEF FN_GETBYTE_VDP(V%)
 8560 A% = &A0
 8570 L%=V%
 8580 = USR(&FFF4)
 8590 :
 8600 DEF PROC_LoadSounds
 8610 REM activate sound channels 1,2,3,4,5,6,7,8. (max channels = 32).
 8620 VDU 23,0,&85,1,8, 23,0,&85,2,8, 23,0,&85,3,8, 23,0,&85,4,8
 8630 VDU 23,0,&85,5,8, 23,0,&85,6,8, 23,0,&85,7,8, 23,0,&85,8,8
 8640 PROC_LoadSound("sound_blip.raw",101,1)
 8650 PROC_LoadSound("sound_dig.raw",102,2)
 8660 PROC_LoadSound("sound_gameover.raw",103,3)
 8670 PROC_LoadSound("sound_get.raw",104,4)
 8680 PROC_LoadSound("sound_magic.raw",105,5)
 8690 PROC_LoadSound("sound_pickup.raw",106,6)
 8700 PROC_LoadSound("sound_slamdoor.raw",107,7)
 8710 PROC_LoadSound("sound_spray.raw",108,8)
 8720 ENDPROC : REM END load sounds.
 8730 :
 8740 DEF PROC_LoadSound(sound$,buffer_id%,channel%)
 8750 CLS
 8760 blockSize% = 1000
 8770 infile% = OPENIN (MySounds$ + "/" + sound$)
 8780 length% = EXT#infile%
 8790 PRINT TAB(STW%/2-8,STH%/2);"Loading Scary Bits"
 8800 PRINT TAB(STW%/2-4,STH%/2+2); "SFX "; buffer_id% - 100; "/8"
 8810 remaining% = length%
 8820 VDU 23, 0, &A0, buffer_id%; 2 : REM Clear out buffer buffer_id%.
 8830 IF infile%=0 THEN PRINT TAB(STW%/2-9,STH%/2); sound$; " NOT loaded" : GOTO 8930
 8840 REPEAT
 8850   IF remaining% < blockSize% THEN blockSize% = remaining%
 8860   remaining% = remaining% - blockSize%
 8870   PRINT ".";
 8880   VDU 23, 0, &A0, buffer_id%; 0, blockSize%; : REM Send next blockSize% bytes to buffer, buffer_id%.
 8890   FOR i% = 1 TO blockSize%
 8900     VDU BGET#infile%
 8910   NEXT
 8920 UNTIL remaining% = 0
 8930 CLOSE #infile%
 8940 VDU 23, 0, &85, channel%, 5, 2, buffer_id%; 1 : REM (1) unsigned .raw / (0) signed .raw file.
 8950 ENDPROC : REM END load sound.
 8960 :
 8970 DEF PROC_ClearAudioCh
 8980 resetAllChannels% = 7
 8990 VDU 23, 0, &A0, resetAllChannels%; 2 : REM Clear out buffer.
 9000 FOR channel = 0 TO 31
 9010   VDU 23, 0, &A0, resetAllChannels%; 0, 5; : REM 5 bytes for the following "reset channel" command.
 9020   VDU 23, 0, &85, channel, 10
 9030 NEXT
 9040 REM Call the clear command.
 9050 VDU 23, 0, &A0, resetAllChannels%; 1
 9060 ENDPROC : REM END clear all audio channels.
 9070 :
