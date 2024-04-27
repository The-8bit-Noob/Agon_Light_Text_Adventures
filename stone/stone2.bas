   10 REM "********************************"
   20 REM "*   The Philosopher's Stone    *"
   30 REM "*      written in 1986 by      *"
   40 REM "*       Graham J Barlow        *"
   50 REM "*   Ported to the Agon Light   *"
   60 REM "*    By Steve Lovejoy 2024     *"
   70 REM "********************************"
   80 MODE 8 : ob%=42 : DIM obj(64):c=0:c2=1:N=0:S=0:E=0:W=0 : RESTORE 570 : FOR B=1 TO ob% : READobj(B) : NEXT B : cut=0 : u=0:d=0:o=0:R1=0:B1=0:G1=0:P1=0:C1=-1:CA1=0:T1=0:D1=0
   90 VDU 23,224,255,255,0,0,0,0,255,255 : REM define custom chars.
  100 ON ERROR IF ERR=9 GOTO 190 ELSE REPORT : PRINT;" at line ";ERL : END
  110 room=12 : REM ?602=&20
  120 ptcol%=15 : stcol%=14 : COLOUR stcol%
  130 FOR A%=0 TO 6 : PRINTTAB(A%,1);CHR$224 : NEXT A%
  140 FOR A%=32 TO 39 : PRINTTAB(A%,1);CHR$224 : NEXT A%
  150 FOR A%=0 TO 39 : PRINTTAB(A%,20);CHR$224 : NEXT A%
  160 PRINT TAB(8,1)"THE PHILOSOPHER'S STONE" : COLOUR15
  170 :
  180 PROClook
  190 TIME=0 : VDU 28,0,27,39,22 : VDU 31,0,Y%+1 : COLOUR 128 : COLOUR stcol% : PRINT">"; : COLOUR 128 : COLOUR ptcol% : INPUT"" B$  : REM L,B,R,T
  200 Y%=VPOS-1 : VDU 28,0,17,39,3 : VDU 31,0,16 : REM L,B,R,T
  210 IF TIME>=4500 PRINT"YOU TOOK YOUR TIME ABOUT THAT!"' : FOR A%=1 TO 200 : NEXT A%
  220 IF B$="" PROCp(14) : GOTO 190
  230 IF LEFT$(B$,8)="SPECTRUM" PROCp(15) : GOTO 190
  240 IF B$="SHIT" PROCp(16) : GOTO 190
  250 IF LEFT$(B$,2)="GO" PROCg
  260 IF B$="THE WORD" AND room=21 PRINT"A magic force draws you through the     north wall." : room=31 : GOTO 180
  270 IF B$="KOLLCHOP" AND room=50 PRINT"The Red Dragon is transfered to another dimension." : obj(33)=318 : GOTO 190
  280 GOTO 2410
  290 IF N<>-1 THEN 300 ELSE RESTORE 650 : FOR C=1 TO room : READD : NEXT C : IF D=0 THEN 430 ELSE A$="North" : GOTO 350
  300 IF S<>-1 THEN 310 ELSE RESTORE 660 : FOR C=1 TO room : READD : NEXT C : IF D=0 THEN 430 ELSE A$="South" : GOTO 350
  310 IF E<>-1 THEN 320 ELSE RESTORE 670 : FOR C=1 TO room : READD : NEXT C : IF D=0 THEN 430 ELSE A$="East": GOTO 350
  320 IF W<>-1 THEN 330 ELSE RESTORE 680 : FOR C=1 TO room : READD : NEXT C : IF D=0 THEN 430 ELSE A$="West": GOTO 350
  330 IF U<>-1 THEN 340 ELSE RESTORE 690 : FOR C=1 TO room : READD : NEXT C : IF D=0 THEN 430 ELSE A$="Up" : GOTO 350
  340 IF D<>-1 THEN 440 ELSE RESTORE 700 : FOR C=1 TO room : READD : NEXT C : IF D=0 THEN 430 ELSE A$="Down" : GOTO 350
  350 IF u=-1 AND room>=14 AND u=-1 AND room<=31 PRINT"You cannot fit through the exit!" : GOTO 190
  360 IF u=-1 AND room=10 GOTO 420
  370 IF u=-1 AND room=5 GOTO 420
  380 IF u=-1 AND room=6 GOTO 420
  390 IF u=-1 AND room=7 GOTO 420
  400 IF u=-1 AND room=8 GOTO 420
  410 room=room+D : PRINT'"You go ";A$ : GOTO 180
  420 PRINT"You cannot fit through the exit!" : GOTO 190
  430 PROCp(13) : PROCs : GOTO 190
  440 M=0:N=0:O=0 : RESTORE 560 : FOR I=1 TO 30 : READ C$ : FOR K=0 TO 9
  450     IF LEFT$(B$,K)=C$ M=I : N=K+2 : K=9 : I=11
  460   NEXT K : NEXT I : IF M=0 PROCp(11) : PROCs : GOTO 190
  470 ON M GOTO 860,480,480,480,1070,1080,1110,1110,1120,1130,1140,2620,480,480,480,480,1330,1330,480,480,480,480,480,480,480,480,480,480,480,3220
  480 RESTORE 630 : FOR J%=1 TO ob% : READC$
  490   FOR K%=N TO 12
  500     IF MID$(B$,N,K%)=C$ O=J% : K%=12 : J%=ob%
  510   NEXT K% : NEXT J%
  520 IF O<>0 GOTO 540
  530 PROCp(12) : PROCs : GOTO 190
  540 ON M GOTO 860,910,910,1030,1080,220,1120,,,2260,2300,,1040,1080,1120,1170,0,0,1240,1280,1350,1440,1470,1600,1700,1770,1850,1900,1970,0
  550 END
  560 DATA HELP,GET,TAKE,DROP,LOOK,INV,SCREAM,SHOUT,RUN,WAIT,WHY,QUIT,CUT,DRINK,ENTER,EXIT,KILL,ATTACK,WEAR,STRANGLE,PULL,PLAY,UNLOCK,OPEN,SMASH,STAB,LOAD,SHOOT,EXAMINE,SAVE
  570 DATA 14,19,318,29,29,1,4,4,1,15,318,318,17,31,10,56,58,318,318,2
  580 DATA 19,29,30,32,18,49,27,22,26,15,7,16,50,8,8,8,3,1,318,59,8,16,43
  590 DATA a small knife,a long rope,a sword,a glass dome,a bone,a thick cloak,a heavy club,a crossbow,a flute,a wooden-key,a stone-key,an arrow,a tube of potion,a phial of potion,a gauntlet of Ogre power,a fantastic golden crown
  600 DATA The Philosopher's Stone!,E,a blazing torch,some nose plugs
  610 DATA a chest,a Pixie,a fire-breathing Hell Hound,a stone building,a mossy cave,a vast castle,a large casket,a large trunk,a huge Boulder Beast,an Orc,a stone Golem,a target,a red Dragon
  620 DATA a red-lever,a blue-lever,a green-lever,a nasty snake,a long dead Skeleton,a huge stone ball,a man sized statue,a portcullis,a large door
  630 DATA KNIFE,ROPE,SWORD,DOME,BONE,CLOAK,CLUB,CROSSBOW,FLUTE,WOODEN-KEY,STONE-KEY,ARROW,TUBE,PHIAL,GAUNTLET,CROWN,STONE,EVERYTHING,TORCH,PLUGS
  640 DATA CHEST,PIXIE,HOUND,BUILDING,CAVE,CASTLE,CASKET,TRUNK,BEAST,ORC,GOLEM,TARGET,DRAGON,RED-LEVER,BLUE-LEVER,GREEN-LEVER,SNAKE,SKELETON,BALL,STATUE,PORTCULLIS,DOOR
  650 DATA 0,0,0,0,0,0,0,2,3,7,0,6,0,5,5,0,4,7,10,10,0,0,0,0,7,0,0,0,0,0,0,0,0,2,4,4,0,0,6,0,0,5,5,0,4,0,0,2,3,4,4,4,4,4,4,0,3,0,2,3,0,0,0
  660 DATA 0,0,0,0,0,0,0,0,0,-2,0,-3,0,0,0,0,-7,-6,-5,-5,-4,0,0,0,-7,0,0,0,-10,-10,-10,-7,0,0,0,-2,0,0,-4,-4,0,0,0,0,-6,0,-5,-5,-4,-2,0,-3,0,-4,-4,-4,-4,-4,-4,-3,-2,0,-3
  670 DATA 0,1,15,28,0,0,1,0,0,0,1,1,0,0,1,1,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,1,0,1,1,0,1,1,1,1,0,0,1,0,1,0,0,0,0,1,1,0,0,1,0,0,0,0,0,1,1,0
  680 DATA 0,0,-1,0,0,0,0,-1,0,0,0,-1,-1,0,0,-1,-1,0,0,0,0,0,-1,-1,-1,-1,-1,-1,0,0,0,0,0,-1,0,-1,-1,0,-1,-1,-1,-1,0,0,-1,0,-1,0,0,0,0,-1,-1,0,0,0,0,0,0,0,0,-1,0
  690 DATA 3,0,0,0,29,-1,-1,0,0,0,0,0,0,-2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  700 DATA 0,0,0,-3,1,1,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,-29,0,0,0,0,0,0,0,0,0,0,0,0,-4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  710 DATA You are in a small dank crypt.The dry   stone walls covered in a layer of dust  undisturbed for centuries crumble at    your touch,You are in a small mossy cave,You are at the entrance to a mossy cave To the west the cave narrows
  720 DATA You are in a strange crumbling building.There is a large circular hole in the   floor leading down,The passage goes steeply up and down    here,The passage goes steeply up and down    here
  730 DATA You are standing on an iron grating.    Below you there is a pit full of oil andabove you the passage goes upward,To the west is a huge portcullis and on the wall are three different coloured   levers,You are in a forest
  740 DATA You are in a circular cave with a very  high roof which slopes down to the exitsat the north and south,You are in a forest
  750 DATA You are in a forest clearing.A well     trodden road leads north and smaller    paths lead south east and west.A tunnel leads down,You are in a forest,You are in a low roofed passage,You are in a passage that turns sharply
  760 DATA You are in an echoing narrow passage.To the east is a door.On the wall above thedoor is a large target,You are at a T-junction,By the side of the road is a mossy cave.You can hear the sound of dripping waterfrom inside
  770 DATA You are in a long abandoned cave
  780 DATA The walls of the cave you are in are    bathed in a red glow from the wall of   fire to the south,On the north wall is written in barely  legible writing 'Say the word to enter.',You are in a forest clearing,You are in a forest
  790 DATA You are in a forest,You are in a forest,You are in a forest,You are in a forest,You are in a forest clearing,You are in another cave but this time anexit leads down,You are in a small cave,You are in a cramped cave
  800 DATA You are at a dead-end.By the side of theroad is a strange stone building.Plants and ferns have grown up its wet stone   walls,You are in a forest,You are in a forest.A hole in the groundleads down,You are in a forest
  810 DATA You are in a forest,You are in a forest,You are in a forest,You are in a forest,You are in a forest,You are in a forest,You are in a forest,You are in a steaply sloping passage,You are in a forest,You are in a forest
  820 DATA You are in a forest,You are in a forest.There is another    hole in the ground,You are in a steeply sloping passage,To the north is the Dwarf Kings castle,You are in a steeply sloping passage,You are in the Dwarf Kings halls
  830 DATA You are in the Dwarf Kings halls,You are in the Dwarf Kings halls,You are in a steeply sloping passage,You are in the Dwarf Kings rooms,You are in the Dwarf Kings treasure room,You are in the Dwarf Kings rooms
  840 DATA You are in a very large circular cave.  All around you the air hums,You are in the Dwarf Kings passage way,You are in the Dwarf Kings passage way,You are in the Dwarf Kings castle,You are in the Dwarf Kings castle
  850 DATA You are in the Dwarf Kings castle
  860 CLS : PRINT"Verbs I understand :"'
  870 PRINT"HELP,GET,TAKE,DROP,LOOK,INV,SCREAM,SHOUTRUN,WAIT,WHY,QUIT,CUT,DRINK,ENTER,EXIT, KILL,ATTACK,WEAR,STRANGLE,PULL,PLAY,    UNLOCK,OPEN,SMASH,STAB,LOAD,SHOOT,GO,   SAVE"
  880 PRINT'"A useful command is GET EVERYTHING"'"Use your wits and make a map."
  890 PRINT"To save a position in the adventure justtype SAVE.Then type in the file name it is to be saved under.When you are killedor type QUIT you will be given the      option to load in a saved ";
  900 PRINT"game." : GOTO 190
  910 IF O=18 PROCe1 : GOTO 190
  920 IF obj(O)=0 OR obj(O)=-1 PROCp(9) : GOTO 190
  930 IF obj(O)<>room PROCp(8) : GOTO 190
  940 IF O>20 PROCp(17) : GOTO 190
  950 IF O=16 PRINT"The crown was realy a shape changer! It turns into its true form so quickly thatyou don't have time to protect yourself from its poisonous bite, and within     seconds you are dead!" : GOTO 2610
  960 IF O=2 PROCp(6) : GOTO 190
  970 IF O=5 AND obj(4)=room AND room=29 PRINT"Sorry -the bone is under the glass dome" : GOTO 190
  980 IF O=4 PRINT"The Pixie jumps out from under the dome and runs away." : PROCpi
  990 IF O=15 AND room=10 AND o=0 AND u=-1 o=-1
 1000 IF O=15 AND room=10 AND o=0 PRINT"You cannot reach it." : GOTO 190
 1010 IF O=17 CLS : GOTO 2910
 1020 obj(O)=0 : PROCp(7) : GOTO 190
 1030 IF O=18 PROCe2 : GOTO 190
 1040 IF obj(O)<>0 AND obj(O)<>-1 PROCp(10) : GOTO 190
 1050 IF O=5 AND room=30 PRINT"The Hell Hound picks up the bone with   its huge jaws and walks away.":obj(23)=318:obj(5)=318 : GOTO 190
 1060 obj(O)=room : PROCp(7) : GOTO 190
 1070 GOTO 180
 1080 PRINT'"Inventory : ";
 1090 RESTORE 590 : FOR G=1 TO ob% : READC$ : IF obj(G)<>0 AND obj(G)<>-1 AND obj(G)<>-2 NEXT G ELSE PRINT ;C$;","; : NEXT G
 1100 VDU 127 : PRINT;"." : PRINT : GOTO 190
 1110 PROCp(1) : GOTO 190
 1120 PROCp(2) : GOTO 190
 1130 PROCp(3) : GOTO 190
 1140 PROCp(4) : GOTO 190
 1150 IF obj(O)<>room PROCp(8) : GOTO 190
 1160 IF obj(1)<>0 PROCp(6) : GOTO 190
 1170 IF O<>2 PRINT"That wont do any good." : GOTO 190
 1180 PROCp(7):PRINT;"The chest falls to the floor.Inside it  is a sword.":obj(2)=318:obj(3)=19:cut=-1 : GOTO 190
 1190 IF O<>13 AND O<>14 PROCp(6) : GOTO 190
 1200 IF obj(O)<>0 PROCp(10) : GOTO 190
 1210 IF O=13 PRINT"You grow to twice your normal size!":u=-1:d=0:obj(13)=318 : GOTO 190
 1220 IF O=14 PRINT"You shrink half your size!":d=-1:u=0:obj(14)=318 : GOTO 190
 1230 IF O<>24 AND O<>25 AND O<>26PROCp(6) : GOTO 190
 1240 IF obj(O)<>room PROCp(8) : GOTO 190
 1250 IF O=24 room=4 : PROCp(7) : GOTO 180
 1260 IF O=25 room=3 : PROCp(7) : GOTO 180
 1270 IF O=26 room=52 : PROCp(7) : GOTO 180
 1280 IF O<>24 AND O<>25 AND O<>26 PROCp(6) : GOTO 190
 1290 IF room<>4 AND room<>3 AND room<>52 PROCp(8) : GOTO 190
 1300 IF O=24 room=32 : PROCp(7) : GOTO 180
 1310 IF O=25 room=18 : PROCp(7) : GOTO 180
 1320 IF O=26 room=49 : PROCp(7) : GOTO 180
 1330 PRINT'''"To use the knife type CUT MONSTER"''"To use the sword type STAB MONSTER"''"To use the club type SMASH MONSTER"''"To use the crossbow type SHOOT MONSTER"''"To use your hands type STRANGLE MONSTER"'
 1340 PRINT"Instead of the word MONSTER use the     monsters name E.g SHOOT ORC"'' : GOTO 190
 1350 IF obj(O)=-1 PRINT"You are wearing it." : GOTO 190
 1360 IF obj(O)<>0 PROCp(10) : GOTO 190
 1370 IF O<>6 AND O<>20 AND O<>15 PROCp(6) : GOTO 190
 1380 obj(O)=-1 : PROCp(7) : GOTO 190
 1390 IF O<>22 AND O<>23 AND O<>29 AND O<>30 AND O<>31 AND O<>33 AND O<>37 AND O<>38 AND O<>43 PROCp(6) : GOTO 190
 1400 IF obj(O)<>room PROCp(8) : GOTO 190
 1410 IF O=22 PRINT"You cannot reach it because it is under the glass dome." : GOTO 190
 1420 IF O=31 AND obj(15)<>-1 PRINT"After a long battle the Golem is still  alive." : GOTO 190
 1430 IF O=31 AND obj(15)=-1 PRINT"After a long battle you strangle the    stone Golem.His body falls into the oil with a splash." : obj(31)=318 : GOTO 190
 1440 IF O=38 PRINT"Why do you want to kill somthing that isalready dead?" : GOTO 190
 1450 PRINT"He is to strong for you!" : GOTO 190
 1460 IF O<>34 AND O<>35 AND O<>36 PROCp(6) : GOTO 190
 1470 IF room<>8PROCp(8) : GOTO 190
 1480 IF R1=0 AND B1=0 AND G1=0 AND O<>36 GOTO 3160
 1490 IF R1=0 AND B1=0 AND G1=0 AND O=36 G1=-1 : PROCp(7) : GOTO 190
 1500 IF R1=0 AND G1=-1 AND B1=0 AND O<>35 GOTO 3160
 1510 IF R1=0 AND G1=-1 AND B1=0 AND O=35B1=-1 : PROCp(7) : GOTO 190
 1520 IF R1=0 AND B1=-1 AND G1=-1 AND O<>34 GOTO 3160
 1530 IF R1=0 AND B1=-1 AND G1=-1 AND O=34R1=-1 : P1=-1 : PRINT"The portcullis slowly rises." : GOTO 190
 1540 PRINT"Nothing happens." : GOTO 190
 1550 IF O<>9PROCp(6) : GOTO 190 ELSE IF obj(O)<>0 PROCp(10) : GOTO 190
 1560 IF room=3 AND obj(37)=3 PRINT"The snake looks sleapy and crawls away." : obj(37)=318 : PROCmusic2 : GOTO 190
 1570 PROCp(7) : PROCmusic2 : GOTO 190
 1580 IF O<>21 AND O<>27 AND O<>28 AND O<>42 PROCp(6) : GOTO 190
 1590 IF obj(O)<>room PROCp(8) : GOTO 190
 1600 IF O=21 AND C1=-1PROCp(18) : GOTO 190
 1610 IF O=27 AND CA1=-1PROCp(18) : GOTO 190
 1620 IF O=28 AND T1=-1PROCp(18) : GOTO 190
 1630 IF O=42 AND D1=-1PROCp(18) : GOTO 190
 1640 IF O=27 AND obj(10)<>0PROCp(20) : GOTO 190
 1650 IF O=28 AND obj(11)<>0PROCp(20) : GOTO 190
 1660 IF O=42 PROCp(20) : GOTO 190
 1670 IF O=27 PROCp(21) : PRINT'"Inside is a stone-key." : CA1=-1 : obj(11)=27 : GOTO 190
 1680 IF O=28 PROCp(21) : PRINT'"When you open it a cloud of gas is goes out of the chest."'"Inside is an arrow." : CA1=-1 : obj(12)=22
 1690 IF O=28 AND obj(20)<>-1 PRINT"You are poisoned by the gas!" : GOTO 2610
 1700 IF O=28 AND obj(20)=-1 PRINT"The nose plugs protect you from the gas." : GOTO 190
 1710 IF O<>21 AND O<>27 AND O<>28 AND O<>42 AND O<>41 PROCp(6) : GOTO 190
 1720 IF O=21 PROCp(19) : GOTO 190
 1730 IF O=27 AND CA1=0 PROCp(22) : GOTO 190
 1740 IF O=28 AND T1=0 PROCp(22) : GOTO 190
 1750 IF O=42 AND D1=0 PROCp(22) : GOTO 190
 1760 IF O=41 AND P1=0 PROCp(22) : GOTO 190
 1770 IF O=27 AND CA1=-1 PROCp(19) : GOTO 190
 1780 IF O=28 AND T1=-1 PROCp(19) : GOTO 190
 1790 IF O=42 AND D1=-1 PROCp(19) : GOTO 190
 1800 IF O=41 AND P1=-1 PROCp(19) : GOTO 190
 1810 IF obj(7)<>0PRINT"You are not carrying the club." : GOTO 190
 1820 IF O<>23 AND O<>29 AND O<>30 AND O<>31 AND O<>33 AND O<>43 AND O<>37 PROCp(6) : GOTO 190
 1830 IF obj(O)<>room PROCp(8) : GOTO 190
 1840 IF O=29 PRINT"You smash the Boulder Beast." : obj(29)=318 : GOTO 190
 1850 IF O=33 PRINT"The Dragon casts a spell on the club andit disappears!" : obj(7)=318 : GOTO 190
 1860 IF O=31 PRINT"A spark flys into the oil when the club hits his stone body and the room goes upin flames." : GOTO 2610
 1870 PRINT"He dodges the blow." : GOTO 190
 1880 IF obj(3)<>0 PRINT"You are not carrying the sword." : GOTO 190
 1890 IF O<>23 AND O<>29 AND O<>30 AND O<>31 AND O<>33 AND O<>43 AND O<>37 PROCp(6) : GOTO 190
 1900 IF obj(O)<>room PROCp(8) : GOTO 190
 1910 IF O=33 PRINT"The Dragon casts a spell on the sword   and it disappears!" : obj(3)=318 : GOTO 190
 1920 IF O=29 PRINT"The sword shatters on his stone body." : obj(3)=318 : GOTO 190
 1930 IF O=30 PRINT"You kill the Orc." : obj(30)=318 : GOTO 190
 1940 IF O=31 PRINT"A spark flys into the oil when the swordhits his stone body and the room goes upin flames." : GOTO 2610
 1950 PRINT"He dodges the blow." : GOTO 190
 1960 IF O<>8 PROCp(6) : GOTO 190
 1970 IF obj(8)=-1 PRINT"It is already loaded." : GOTO 190
 1980 IF obj(12)<>0 PRINT"You are not carrying the arrow." : GOTO 190
 1990 IF obj(8)<>0 PRINT"You are not carrying the crossbow." : GOTO 190
 2000 obj(12)=318 : obj(8)=-1 : PROCp(7) : GOTO 190
 2010 IF obj(8)<>-1 AND obj(8)<>0 PROCp(10) : GOTO 190
 2020 IF O<>23 AND O<>29 AND O<>30 AND O<>31 AND O<>33 AND O<>43 AND O<>37 AND O<>32 PROCp(6) : GOTO 190
 2030 IF obj(8)<>-1 PRINT"The crossbow is not loaded." : GOTO 190
 2040 obj(8)=0
 2050 IF O=30 PRINT"You kill the Orc." : obj(30)=318 : GOTO 190
 2060 IF O=32 PRINT"The door swings open!" : D1=-1 : GOTO 190
 2070 PRINT"You miss!" : GOTO 190
 2080 IF obj(O)<>0 AND obj(O)<>-1 PROCp(10) : GOTO 190
 2090 COLOUR stcol% : PRINT"You see "; : COLOUR ptcol% : RESTORE 590 : FOR A%=1 TO O : READC$ : NEXT : PRINT;C$ : GOTO 190
 2100 DEF PROClook : VDU 28,0,19,39,3 : VDU 31,0,16 : RESTORE 710 : FOR Z=1 TO room : READ C$ : NEXT : PRINT'C$;"." : RESTORE 590 : c=0 : FOR G=1 TO ob% : READC$ : IF obj(G)<>room NEXT G ELSE c=-1 : NEXT G : REM L,B,R,T
 2110 COLOUR stcol% : PRINT;"Exits lead "; : COLOUR ptcol% :
 2120 RESTORE 650 : FOR A%=1 TO room : READB% : NEXT : IF B%=0 GOTO 2130 ELSE PRINT;"North,";
 2130 RESTORE 660 : FOR A%=1 TO room : READB% : NEXT : IF B%=0 GOTO 2140 ELSE PRINT;"South,";
 2140 RESTORE 670 : FOR A%=1 TO room : READB% : NEXT : IF B%=0 GOTO 2150 ELSE PRINT;"East,";
 2150 RESTORE 680 : FOR A%=1 TO room : READB% : NEXT : IF B%=0 GOTO 2160 ELSE PRINT;"West,";
 2160 RESTORE 690 : FOR A%=1 TO room : READB% : NEXT : IF B%=0 GOTO 2170 ELSE PRINT;"Up,";
 2170 RESTORE 700 : FOR A%=1 TO room : READB% : NEXT : IF B%=0 GOTO 2180 ELSE PRINT;"Down,";
 2180 VDU 8 : PRINT;"."
 2190 IF c=0 GOTO 2310
 2200 n%=12 : COLOUR stcol% : PRINT'"You can see "; : COLOUR ptcol%
 2210 RESTORE 590
 2220 FOR G=1 TO ob% : READC$
 2230   IF obj(G)<>room NEXT G
 2240 IF G=ob%+1 GOTO 2290
 2250 C$=C$+"," : n%=n%+LEN(C$)
 2260 IF n%>39 PRINT : n%=LEN(C$)
 2270 PRINT;C$;
 2280 NEXT
 2290 IF n%>=32 PRINT ELSE VDU 127
 2300 PRINT;" here."
 2310 IF room=29 AND obj(4)=29 AND room=29 AND obj(5)=29 PRINT;"The bone is under the glass dome."
 2320 IF room=29 AND obj(4)=29 AND room=29 AND obj(22)=29 PRINT"The Pixie is under the glass dome.He    wants you to let him out by TAKEing the DOME."
 2330 IF cut=0 AND room=19 PRINT;"The chest is suspended by the rope whichis tied to the ceiling at one end and   the floor at the other."
 2340 IF room=10 AND o=0 PRINT"The gauntlet is hanging from the roof."
 2350 IF room=59 PROCst
 2360 VDU 28,0,27,39,22 : VDU 31,0,Y% : ENDPROC
 2370 DEF PROCsound : FOR Z=0 TO 100 STEP 4 : SOUND1,-15,Z,1 : NEXT : ENDPROC
 2380 DEF PROCmusic : RESTORE 2390
 2390 DATA 80,24,0,0,80,24,0,0,80,8,0,0,80,24,92,24,88,8,0,0,88,8,80,8,0,0,80,8,76,8,80,8
 2400 RESTORE 2390 : FOR A%=1 TO 16 : READp%,d% : SOUND1,-15,p%-48,d% : NEXT : ENDPROC
 2410 N=0:S=0:W=0:E=0:U=0:D=0
 2420 IF LEFT$(B$,4)="WEAR" GOTO 2490
 2430 IF LEFT$(B$,2)="W" OR LEFT$(B$,2)="WE" THEN W=-1
 2440 IF LEFT$(B$,2)="E" OR LEFT$(B$,2)="EA" THEN E=-1
 2450 IF LEFT$(B$,2)="N" OR LEFT$(B$,2)="NO" THEN N=-1
 2460 IF LEFT$(B$,2)="S" OR LEFT$(B$,2)="SO" THEN S=-1
 2470 IF LEFT$(B$,2)="U" OR B$="UP" THEN U=-1
 2480 IF LEFT$(B$,2)="D" OR LEFT$(B$,2)="DO" THEN D=-1
 2490 IF S=-1 AND room=30 AND obj(23)=30 PRINT"The Hell Hound will not let you past." : r=RND(3) : IF r=1 PRINT"The Hell Hound burns you to a crisp." : GOTO 2610
 2500 IF S=-1 AND room=30 AND obj(23)=30 GOTO 190
 2510 IF S=-1 AND room=20 AND obj(6)<>-1 PRINT"You are burnt to a crisp!" : GOTO 2610
 2520 IF S=-1 AND room=20 AND obj(6)=-1 PRINT"Your cloak protects you from the flames."
 2530 IF U=-1 AND room=7 AND obj(31)=7 PRINT"The stone Golem will not let you past." : GOTO 190
 2540 IF P1=0 AND W=-1 AND room=8 PRINT"You cannot walk through the portcullis!" : GOTO 190
 2550 IF N=-1 AND room=50 AND obj(33)=50 PRINT"The Dragon burns you to a crisp with a  fire ball!" : GOTO 2610
 2560 IF W=-1 AND room=3 AND obj(37)=3 PRINT"The snake will not let you past." : GOTO 190
 2570 IF E=-1 AND room=26 AND obj(29)=26 PRINT"The Boulder Beast will not let you past" : GOTO 190
 2580 IF E=-1 AND room=15 AND obj(30)=15 PRINT"The Orc will not let you past." : GOTO 190
 2590 IF E=-1 AND room=16 AND D1=0 PRINT"The door is in the way." : GOTO 190
 2600 GOTO 290
 2610 REM DEAD !!!!!
 2620 PROCmusic : PRINT''"Well, that seams to be the end of that  game.Do you want to load a saved game ?"
 2630 LD$=GET$
 2640 IF LD$="N" PRINT"NO" : RUN
 2650 IF LD$="Y" PRINT"YES" : PROCload : GOTO 190
 2660 GOTO 2630
 2670 DATA AAAAAAAAAAAA!!!!,Which way?,Time passes...,Because I say so!,HELP,You can't do that.,O.K.,It is not here.,You are already carrying it.,You are not carrying it.
 2680 DATA I do not understand that.,I cannot apply that.,No exit.,At least do somthing!,Dont talk to me about Spectrums!!!!,Now then now then don't get bad tempered,Sorry - it is one of those objects you  cannot pick up.
 2690 DATA It is already unlocked.,It is already open.,You dont have the right key.,You unlock and open it.,It is locked.
 2700 DEF PROCp(A%) : RESTORE 2670 : FOR B%=1 TO A% : READm$ : NEXT : PRINTm$ : ENDPROC
 2710 DEF PROCe1
 2720 FOR A%=1 TO 20
 2730   IF A%=2 GOTO 2750
 2740   IF obj(A%)=room obj(A%)=0
 2750 NEXT
 2760 PROCp(7) : PROClook : ENDPROC
 2770 DEF PROCe2
 2780 FOR A%=1 TO 20
 2790   IF obj(A%)=0 OR obj(A%)=-1 obj(A%)=room
 2800 NEXT
 2810 PROCp(7) : PROClook : ENDPROC
 2820 DEF PROCpi
 2830 FOR A%=1 TO ob%
 2840   IF obj(A%)=0 PRINT"The Pixie pinches everything you are    carying before he goes though!":A%=ob%
 2850 NEXT
 2860 FOR A%=1 TO ob%
 2870   IF obj(A%)=0 obj(A%)=318
 2880   IF obj(A%)=-1 obj(A%)=318
 2890 NEXT : obj(22)=318 : ENDPROC
 2900 DEF PROCs : SOUND1,-15,0,2 : ENDPROC
 2910 PRINT''"Congratulations! You have compleated    this adventure."''"You are now rich beyond your wildest    dreams,well almost...."''"Look out for more Davrick Harpmoon      adventures written by Graham Barlow."
 2920 FOR A%=1 TO 255 STEP 2 : SOUND1,-15,A%,1 : NEXT : COLOUR stcol% : PRINT''"PRESS THE SPACE BAR." : REPEAT UNTIL INKEY-99
 2930 MODE 8
 2940 COLOUR stcol% : PRINTTAB(15,10)"THE END." : COLOUR ptcol%
 2950 REPEAT
 2960   PROCscrolldown(70)
 2970 UNTIL FALSE
 2980 STOP
 2990 DEF PROCg
 3000 IF MID$(B$,4,1)="N"ORMID$(B$,4,1)="S"ORMID$(B$,4,1)="E"ORMID$(B$,4,1)="W"ORMID$(B$,4,1)="U"ORMID$(B$,4,1)="D"THEN B$=MID$(B$,4,7) : ENDPROC
 3010 C$=MID$(B$,4,12)
 3020 D$="ENTER "
 3030 B$=D$+C$ : ENDPROC
 3040 VDU 28,0,18,39,3 : VDU 31,0,15 : PRINT''"The ball squashes you flat!" : GOTO 2610
 3050 DEF PROCscrolldown(S)
 3060 LOCAL J,K,Y
 3070 Y=INT(?&354*256/(?&352+256*?&353))
 3080 FOR J=1 TO Y
 3090   FOR K=1 TO S
 3100   NEXT
 3110   U%=VPOS
 3120   PRINTTAB(RND(38),0)"."
 3130   VDU 31,0,U%,11
 3140 NEXT
 3150 ENDPROC
 3160 PRINT'"There is a low rumbling and the walls   and roof begin to close in on you! Thereis nothing you can do to prevent        yourself from being squashed to a pulp." : GOTO 2610
 3170 DATA To get rid of a Red Dragon say KOLLCHOP,This castle is haunted!,Beware of the shape changer,Beware of the rolling ball,Watch your back!,How long is a piece of string?,This forest used to be inhabited by     strange momsters!
 3180 DATA One day the Dwarf King will return,I wish I was human,Magic still works in the caves
 3190 DEF PROCst : RESTORE 3170 : r=RND(10) : FOR A%=1 TO r : READC$ : NEXT : PRINT'"The statue says,"'"'";C$;"'" : ENDPROC
 3200 DATA 110,118,114,112,118,114,118,112,116,118,112,114
 3210 DEF PROCmusic2 : RESTORE 3200 : FOR A%=1 TO 12 : READB% : SOUND1,-15,B%,8 : NEXT A% : ENDPROC
 3220 INPUT''"File name ";file$ : IF LEN(file$)>7 OR LEN(file$)<=0 VDU7 : GOTO 3220
 3230 PRINT"Saving ";file$;" now."
 3240 uu=OPENOUT file$
 3250 FOR A%=1 TO ob%
 3260   PRINT# uu,obj(A%)
 3270 NEXT A%
 3280 PRINT# uu,c,c2,N,S,E,W,cut,u,d,o
 3290 PRINT# uu,R1,B1,G1,P1,C1,CA1,T1
 3300 PRINT# uu,D1,room
 3310 CLOSE# uu
 3320 PROCp(7) : GOTO 190
 3330 DEF PROCload
 3340 INPUT''"File name ";file$ : IF LEN(file$)>7 OR LEN(file$)<=0 VDU7 : GOTO 3340
 3350 uu=OPENIN file$
 3360 PRINT"Loading ";file$;" now."
 3370 FOR A%=1 TO ob%
 3380   INPUT# uu,obj(A%)
 3390 NEXT A%
 3400 INPUT# uu,c,c2,N,S,E,W,cut,u,d,o,R1,B1,G1,P1,C1,CA1,T1,D1,room
 3410 CLOSE# uu
 3420 PROCp(7) : ENDPROC
 3430 :
 3440 DEF PROChideCursor : REM Hide Cursor.
 3450 VDU 23,1,0;0;0;0;
 3460 ENDPROC
