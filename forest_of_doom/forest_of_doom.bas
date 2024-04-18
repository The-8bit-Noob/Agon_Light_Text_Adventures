   10 REM WRITTEN BY S.W. LUCAS IN 1983
   20 REM Ported to the Agon Light By Steve Lovejoy 2024.
   30 REM
   40 :
   50 ON ERROR GOTO 4300
   60 ZS=1 : XX%=0 : R=0
   70 :
   80 PROCvars
   90 PROCdrawHud(HudCol%) : REM draw border etc.
  100 PROC_messageViewPort : REM set the text view port.
  110 :
  120 GOSUB 3700
  130 DIMQ$(46),G$(42),S%(46,4),V$(3),B%(60,1),N$(60),N%(53),X$(61)
  140 A$="" : P%=3 : M%=0
  150 RESTORE : GOSUB 740 : GOSUB 3000
  160 CLS
  170 COLOUR Text1Col% : PRINT"I am:-" : COLOUR Text2Col%
  180 PRINT Q$(P%) : A$=""
  190 IF S%(P%,1)>0 THEN A$="North"
  200 GOSUB 3820
  210 IF S%(P%,2)>0 AND LEN(A$)>0 THEN A$=A$+", South"
  220 IF S%(P%,2)>0 AND LEN(A$)=0 THEN A$=A$+"South"
  230 IF S%(P%,3)>0 AND LEN(A$)>0 THEN A$=A$+", East"
  240 IF S%(P%,3)>0 AND LEN(A$)=0 THEN A$=A$+"East"
  250 IF S%(P%,4)>0 AND LEN(A$)>0 THEN A$=A$+", West"
  260 IF S%(P%,4)>0 AND LEN(A$)=0 THEN A$=A$+"West"
  270 :
  280 IF A%=6 THEN PRINT"You have successfully completed your   Mission!"'''
  290 IF A%=6 THEN PRINT"The Prince thanks you and Albert for   Your incredible bravery.              He gives you both a knighthood!"
  300 IF A%=6 THEN END
  310 COLOUR Text1Col% : PRINT : PRINT"I can go: ";A$ : COLOUR Text2Col%
  320 PRINT
  330 IF P%=22 AND S%(22,3)=0 THEN PRINT X$(55)
  340 E=0 : FOR T= 1 TO 37 : PP%=0 : IF B%(T,1)=P% THEN PP%=1
  350   IF PP%= 1 THEN 370
  360 NEXT T : GOTO 390
  370 IF E=0 THEN PRINT"That looks like"
  380 PRINT G$(T) : E=E+1 : GOTO 360
  390 COLOUR Text1Col% : PRINT : PRINT"What should I do now "; : INPUT Z$ : COLOUR Text2Col%
  400 IF Z$="" THEN CLS : PRINT"What?" : GOTO 170
  410 PROCPARSER
  420 CLS
  430 IF B$="NORT" AND S%(P%,1)<>0 THEN P%=S%(P%,1) : GOTO 170
  440 IF B$="SOUT" AND S%(P%,2)<>0 THEN P%=S%(P%,2) : GOTO 170
  450 IF B$="EAST" AND S%(P%,3)<>0 THEN P%=S%(P%,3) : GOTO 170
  460 IF B$="WEST" AND S%(P%,4)<>0 THEN P%=S%(P%,4) : GOTO 170
  470 IF B$="NORT" AND S%(P%,1)=0 THEN ZS=0 : GOTO 690
  480 IF B$="SOUT" AND S%(P%,2)=0 THEN ZS=0 : GOTO 690
  490 IF B$="EAST" AND S%(P%,3)=0 THEN ZS=0 : GOTO 690
  500 IF B$="WEST" AND S%(P%,4)=0 THEN ZS=0 : GOTO 690
  510 IF B$="SCOR" THEN GOSUB 3820 : PRINT"You have scored ";A%;" out of 6." : GOTO 170
  520 IF B$="PULL" OR B$="FLUS" THEN 4120
  530 :
  540 IF B$="TAKE" OR B$="GRAB" OR LEFT$(B$,3)="GET" THEN 1920
  550 IF B$="HELP" THEN 2970
  560 IF B$="SWIM" THEN PRINT"I can't swim!" : GOTO 170
  570 IF B$="FUCK" OR B$="PISS" OR B$="SHIT" THEN 3900
  580 IF B$="DROP" OR B$="LEAV" OR B$="GIVE" THEN 2280
  590 IF B$="LOOK" THEN 170
  600 IF B$="PRAY" THEN 3960
  610 IF B$="SHOO" THEN 2580
  620 IF LEFT$(B$,3)="HIT" THEN GOTO 2580
  630 IF B$="KILL" THEN GOTO 2580
  640 IF B$="EXAM" OR B$="READ" THEN 2670
  650 IF B$="THRO" OR B$="CHUC" THEN GOTO 2860
  660 IF LEFT$(B$,3)="RUB" THEN 4000
  670 IF B$="INVE" THEN 2780
  680 IF LEFT$(B$,3)="USE" THEN 2890
  690 IF ZS=0 THEN PRINT"I can't go in that direction" : ZS=1 : GOTO 170
  700 :
  710 PRINT X$(60)
  720 GOTO 170
  730 END
  740 FOR H= 1 TO 46
  750   FOR D=  1 TO 4
  760     READ S%(H,D)
  770   NEXT
  780   READ Q$(H)
  790 NEXT
  800 FOR H= 1 TO 37
  810   READ G$(H) : READ B%(H,1)
  820 NEXT
  830 FOR H= 1 TO 53
  840   READ N$(H),N%(H)
  850 NEXT
  860 RETURN
  870 DATA 0,0,2,0," at the doorway of an old hut.           The door is locked."
  880 DATA 43,8,3,1," in the Pawnbroker's shop. A sign says   'Drop your *TREASURES* here'"
  890 DATA 0,9,4,2," on a disused railway line."
  900 DATA 0,10,0,3," on a narrow footpath that leads into    the forest."
  910 DATA 0,11,6,10," At a junction in the path."
  920 DATA 0,0,0,5," In an old stone quarry."
  930 DATA 0,0,8,0," by a wooden gate.                       The Pawnbroker is here.                 He won't let me pass."
  940 DATA 2,0,0,7," by the dustbins."
  950 DATA 3,0,0,0," In the Old Ship Tavern."
  960 DATA 4,0,0,0," just by the edge of the woods."
  970 DATA 5,0,16,0," in a small thicket in the woods."
  980 DATA 7,0,0,0," in a clearing in the woods. There are   broken pots, and weeds everywhere."
  990 DATA 0,0,14,12," by a small plot of land. It is rather   overgrown."
 1000 DATA 0,18,0,13," in the graveyard, by a grave."
 1010 DATA 0,19,0,0," inside a small brick outbuilding."
 1020 DATA 0,0,0,11," at a dead end."
 1030 DATA 12,25,26,0," in a damp, gloomy tunnel. Water is      pouring down the walls."
 1040 DATA 14,0,19,0," on a disused track near the graveyard."
 1050 DATA 15,27,0,18," at the entrance to an old temple."
 1060 DATA 0,28,0,0," in the lavatory!"
 1070 DATA 16,0,0,0," on a narrow bridge that crosses the     stream."
 1080 DATA 0,0,0,16," in a very dark part of the forest."
 1090 DATA 34,0,0,22," in the workshop."
 1100 DATA 0,0,31,0," in a vast hallway."
 1110 DATA 17,0,42,0," in a twisty little passage."
 1120 DATA 0,42,0,17," in a hallway."
 1130 DATA 19,0,0,0," inside the old temple."
 1140 DATA 20,38,0,27," in the hospital."
 1150 DATA 21,0,0,0," at another dead end."
 1160 DATA 22,0,32,0," in a tiny shrine."
 1170 DATA 32,0,0,24," on a private beach."
 1180 DATA 0,31,33,30," in a large arena."
 1190 DATA 36,37,0,32," in a secluded house."
 1200 DATA 0,23,0,0," in the tiny store-room."
 1210 DATA 41,41,41,34," lost!"
 1220 DATA 36,36,36,36," Completely lost in a spinning time      vortex!"
 1230 DATA 33,0,0,0," in a cold and damp cell."
 1240 DATA 28,0,0,0," in the broom cupboard."
 1250 DATA 27,0,0,0," in a long, narrow tunnel."
 1260 DATA 0,0,0,42," in an eerie crypt, deep in the caves."
 1270 DATA 41,41,41,35," in a dense, swirling fog."
 1280 DATA 26,0,0,25," in a cavern."
 1290 DATA 0,2,45,44," in the potting shed."
 1300 DATA 0,0,43,0," at the far end of the potting shed."
 1310 DATA 0,0,0,43," by the garden shed."
 1320 DATA 0,45,0,0," in the garden shed."
 1330 RETURN
 1340 DATA "A large frog.",14
 1350 DATA "A little girl.",37
 1360 DATA "A wallet.",30
 1370 DATA "A flask of brandy.",9
 1380 DATA "An old dwarf.",29
 1390 DATA "A *RUBY* encrusted goblet.",33
 1400 DATA "A loaded shotgun.",46
 1410 DATA "A *DIAMOND* studded tiara.",41
 1420 DATA "A genuine antique Orc *DAGGER*",38
 1430 DATA "My old friend Albert. He looks ill.",28
 1440 DATA "A jar of Dr. Frankenstein's cure-all   medicine.",31
 1450 DATA "A vending machine. It contains         chocolates.",13
 1460 DATA "A 1 coin.",11
 1470 DATA "A bauble.",39
 1480 DATA "A *SILVER* spear. (ust right for      monsters of all types).",40
 1490 DATA "A golden coloured ring.",4
 1500 DATA "A can of oil.",15
 1510 DATA "A dirty old plant pot.",43
 1520 DATA "A real plastic crucifix.",6
 1530 DATA "Bill & Ben guarding the entrance to a  tunnel.",12
 1540 DATA "An evil Balrog!",16
 1550 DATA "A large altar.",27
 1560 DATA "An evil, menacing Vampire who will not let me pass.",42
 1570 DATA "A seemingly innocent old man, but he   won't let me pass.",10
 1580 DATA "A coffin, covered with mud.",25
 1590 DATA "A rusty lock.",45
 1600 DATA "An evil Hobgoblin - with halitosis!",34
 1610 DATA "A silver plated casket with no lid.",26
 1620 DATA "A broken lid.",24
 1630 DATA "A small pack-horse.",32
 1640 DATA "A sleeping monster...",23
 1650 DATA "A greedy little Orc warrior, guarding  the bridge.",21
 1660 DATA "A tiny beanstalk - with a label        attached.",3
 1670 DATA "A packet of fertiliser.",44
 1680 DATA "A brass monkey.",2
 1690 DATA "A chain.",20
 1700 DATA "Some mushrooms (I think).",18
 1710 DATA "FROG",1,"PRINCE",1
 1720 DATA "GIRL",2,"LITTLE",2
 1730 DATA "WALLET",3,"FLASK",4,"BRANDY",4
 1740 DATA "DWARF",5,"RUBY",6
 1750 DATA "SHOTGUN",7,"GUN",7
 1760 DATA "DIAMOND",8
 1770 DATA "ANTIQUE",9,"DAGGER",9
 1780 DATA "FRIEND",10,"ALBERT",10
 1790 DATA "MEDICINE",11,"VENDING",12,"CHOCOLATES",12
 1800 DATA "COIN",13,"BAUBLE",14
 1810 DATA "GOLDEN",15,"SPEAR",15,"RING",16
 1820 DATA "OIL",17,"DIRTY POT",18,"POTS",18
 1830 DATA "CRUCIFIX",19,"CROSS",19,"GUARD",20
 1840 DATA "BALROG",21,"ALTAR",22,"VAMPIRE",23,"MAN",24
 1850 DATA "COFFIN",25,"CORPSE",25
 1860 DATA "DOOR",26,"LOCK",26,"GOBLIN",27,"CASKET",28
 1870 DATA "LID",29,"HORSE",30
 1880 DATA "SLEEPING MONSTER",31,"MONSTER",31
 1890 DATA "ORC",32,"WARRIOR",32
 1900 DATA "BEAN",33,"LABEL",33
 1910 DATA "PACKET",34,"FERTILISER",34,"MONKEY",35,"CHAIN",36,"MUSHROOMS",37
 1920 GOSUB 3620
 1930 IF L$="PLANT" THEN PRINT"Sorry!" : GOTO 390
 1940 IFL%=1 THEN 1960
 1950 PRINT"Get what?" : GOTO 170
 1960 E%=0
 1970 FOR H=1 TO 37
 1980   IF B%(H,1)=P% AND B%(N%(R),1)=P% THEN E%=1
 1990 NEXT H
 2000 IF E%=0 THEN PRINT"I" don't see it." : GOTO 110
 2010 CLS : IFP%=12 AND R=30 THEN PRINT X$(3) : GOTO 170
 2020 IF P%=16 AND R=31 THEN PRINT X$(4) : GOTO 170
 2030 IF P%=20 AND R=52 THEN PRINT"Get a lavatory chain? You are joking!" : GOTO 170
 2040 IF P%=27 AND R=32 THEN PRINT X$(5) : GOTO 170
 2050 IF P%=10 AND R=34 THEN PRINT X$(7) : GOTO 170
 2060 IF P%=37 AND (R=3 OR R=4) AND XX%<>1 THEN PRINT X$(52) : GOTO 170
 2070 IF P%=37 AND (R=3 OR R=4) AND XX%=1 THEN PRINT"She smiles as she eats a chocolate." : GOTO 2230
 2080 IF P%=42 AND R=33 THEN PRINT X$(6) : GOTO 170
 2090 IF P%=25 AND (R=35 OR R=36) THEN PRINT X$(8) : GOTO 170
 2100 IF P%=14 AND (R=1 OR R=2) AND B%(2,1)=-1 THEN GOTO 2230
 2110 IF P%=45 AND (R=37 OR R=38) THEN PRINT X$(45) : GOTO 390
 2120 IF P%=34 AND R=39 THEN PRINT X$(46) : GOTO 390
 2130 IF P%=21 AND (R=44 OR R=45) THEN PRINT X$(49) : GOTO 390
 2140 IF P%=14 AND (R=1 OR R=2) AND B%(2,1)<>14 THEN PRINT X$(17) : GOTO 170
 2150 IF P%=13 AND R=19 AND B%(13,1)<>13 THEN PRINT X$(19) : GOTO 170
 2160 IF P%=13 AND R=18 AND B%(13,1)<>13 THEN PRINT X$(10) : GOTO 170
 2170 IF P%=9 AND (R=6 OR R=7) AND B%(3,1)=9 THEN 2230
 2180 IF P%=9 AND (R=6 OR R=7) AND B%(13,1)=9 THEN PRINT X$(21) : GOTO 390
 2190 IF P%=9 AND (R=6 OR R=7) AND B%(13,1)<>9 THEN PRINT X$(36) : GOTO 390
 2200 IF P%=29 AND B%(4,1)<>29 THEN PRINT X$(54) : GOTO 170
 2210 IF P%=28 AND (R=15 OR R=16) AND B%(11,1)<>28 THEN PRINT X$(56) : GOTO 170
 2220 IF P%=28 AND (R=15 OR R=16) AND B%(11,1)=28 THEN G$(10)=X$(57) : B%(11,1)=-1
 2230 E%=0
 2240 FOR D= 1 TO 3 : IF V$(D)="" THEN V$(D)=G$(N%(R)) : E%=1 : D=4
 2250 NEXT
 2260 IF E%=0 THEN PRINT X$(38) : GOTO 390
 2270 B%(N%(R),1)=0 : GOTO 170
 2280 GOSUB 3620
 2290 IF L%=1 THEN 2310
 2300 PRINT''"I can't see a ";L$ : GOTO 390
 2310 E%=0
 2320 FOR D= 1 TO 3
 2330   IF V$(D)=G$(N%(R)) THEN V$(D)="" : E%=1
 2340 NEXT
 2350 :
 2360 IF E%=1 THEN 2380
 2370 PRINT X$(39) : GOTO 390
 2380 B%(N%(R),1)=P%
 2390 CLS
 2400 IF P%=7 AND R=24 THEN PRINT X $(1) : S%(7,2)=12 : B%(16,1)=1 : Q$(7)=" by an open gate."
 2410 IF P%=12 AND (R=26 OR R=27) THEN PRINT X$(2) : S%(12,2)=17 : S%(12,3)=13
 2420 IF P%=12 AND (R=26 OR R=27) THEN B%(20,1)=-1 : B%(18,1)=0
 2430 IF P%=14 AND (R=3 OR R=4) THEN PRINT X$(9) : G$(1)=X$(13) : B%(2,1)=-1 : GOTO 170
 2440 IF P%=37 AND (R=18 OR R=19) THEN XX%=1
 2450 IF P%=29 AND (R=6 OR R=7) THEN G$(5)=X$(14) : PRINT X$(12) : GOTO 170
 2460 IF P%=28 AND R=17 THEN PRINT X$(16) : G$(10)="my friend *Albert*" : GOTO 170
 2470 IF P%=13 AND R=20 THEN PRINT X$(18) : G$(12)="a box of chocolates." : GOTO 170
 2480 IF P%=45 AND R=25 THEN PRINT X$(20) : S%(45,1)=46 : B%(26,1)=-1 : B%(17,1)=-1 : GOTO 170
 2490 IF P%=22 AND (R=49 OR R=50) AND B%(33,1)=22 THEN PRINT X$(53) : S%(22,2)=30 : S%(22,3)=23
 2500 IF P%=22 AND (R=49 OR R=50) AND B%(33,1)=22 THEN G$(33)=X$(61) : X$(55)="" : GOTO 170
 2510 IF P%=22 AND (R=47 OR R=48) AND B%(34,1)=22 THEN PRINT X$(53) : S%(22,2)=30 : S%(22,3)=23
 2520 IF P%=22 AND (R=47 OR R=48) AND B%(34,1)=22 THEN G$(33)=X$(61) : X$(55)="" : GOTO 170
 2530 IF P%=27 AND B%(12,1)=27 AND B%(1,1)=0 THEN S%(27,3)=28 : B%(12,1)=0 : G$(22)=X$(58)
 2540 IF P%=21 AND R=53 THEN PRINT X$(47) : S%(21,2)=29 : B%(32,1)=0 : B%(53,1)=-1 : GOTO 170
 2550 IF P%=13 AND (R=18 OR R=19) AND B%(13,1)=13 THEN PRINT X$(18) : GOTO 170
 2560 IF P%=34 AND R=8 THEN PRINT X$(25) : S%(34,3)=35 : B%(5,1)=-1 : B%(27,1)=-1 : GOTO 170
 2570 GOTO 170
 2580 IF P%=10 AND B%(7,1)=0 AND S%(10,3)=0 THEN PRINT X$(27) : S%(10,3)=5 : G$(24)=X$(28) : GOTO 170
 2590 IF P%=10 AND B%(7,1) THEN PRINT X$(30) : GOTO 170
 2600 IF P%=29 AND M%=0 THEN PRINTX $(29) : GOTO 170
 2610 IF B%(7,1)<>0 THEN PRINT"I don't have a gun!" : GOTO 250
 2620 PRINT X$(30) : GOTO 390
 2630 GOSUB 3620
 2640 IFP%=27 AND R=28 THEN PRINT X$(31) : S%(27,3)=28 : GOTO 170
 2650 IFP%=24 THEN PRINT X$(37) : GOTO 170
 2660 PRINT"Into what?" : GOTO 390
 2670 GOSUB 3620
 2680 IF B%(8,1)=0 AND R=12 THEN PRINT X$(34) : GOTO 170
 2690 IF P%=12 AND (R=26 OR R=27) THEN PRINT X$(40) : GOTO 170
 2700 IF P%=25 AND (R=35 OR R=36) THEN PRINT X$(59) : GOTO 170
 2710 IF B%(15,1)=0 AND R=15 THEN PRINT X$(22) : GOTO 170
 2720 IF P%=24 THEN PRINT X$(37) : GOTO 170
 2730 IF P%=39 AND R=21 THEN PRINT X$(41) : GOTO 170
 2740 IF P%=14 AND (R=1 OR R=2) THEN PRINT X$(42) : GOTO 170
 2750 IF (R=47 OR R=48) AND B%(33,1)=0 THEN PRINT X$(23) : GOTO 170
 2760 IF (R=22 OR R=23) AND B%(15,1)=0 THEN PRINT X$(22) : GOTO 170
 2770 PRINT X$(35) : GOTO 390
 2780 COLOUR Text1Col% : PRINT"I have:-" : COLOUR Text2Col%
 2790 :
 2800 F%=0
 2810 FOR H= 1 TO 3
 2820   IF V$(H)<>"" THEN PRIN TV$(H) : F%=1
 2830 NEXT
 2840 IF F%=0 THEN PRINT"nothing at all!"
 2850 GOTO 390
 2860 IF P%=16 AND B%(21,1)=16 THEN PRINT X$(48)
 2870 IF P%=16 AND B%(21,1)=16 THEN S%(16,2)=21 : S%(16,3)=22 : B%(21,1)=0 : GOTO 170
 2880 GOTO 170
 2890 GOSUB 3620
 2900 IF R=25 AND B%(17,1)=0 THEN GOTO 2940
 2910 IF B%(19,1)<>0 THEN PRINT X$(39) : GOTO 170
 2920 IF P%=42 AND R=28 AND B%(19,1)=0 AND S%(42,3)=0 THEN PRINT X$(31) : S%(42,3)=40 : G$(23)=X$(24) : GOTO 170
 2930 IF P%=42 AND R=28 AND B%(19,1)=0 AND S%(42,3)=40 THEN PRINT X$(33) : GOTO 170
 2940 IF P%=45 AND R=25 AND B%(17,1)=0 AND S%(45,1)=0 THEN PRINT X$(20) : S%(45,1)=46 : B%(17,1)=-1 : B%(26,1)=-1 : GOTO 2310
 2950 IF R=25 AND B%(17,1)=0 THEN PRINT X$(32) : GOTO 170
 2960 PRINT X$(32) : GOTO 390
 2970 CLS : PRINT''"I'm as confused as you are..."
 2980 :
 2990 PRINT'"I suppose you could try praying..." : GOTO 390
 3000 X$(1)="The Pawnbroker rubs his hands together in glee. He grabs the ring and runs    in to his shop."
 3010 X$(2)="Ben grabs the pot and runs off.        He is shouting something about a       present for Bill..."
 3020 X$(3)="You must be joking!"
 3030 X$(4)="What do you think I am?                Have you seen those fangs, dripping in BLOOD!"
 3040 X$(5)="I know I am Superman, but even I can't move that!"
 3050 X$(6)="What do you think I am? A sucker?!"
 3060 X$(7)="All that glitters..."
 3070 X$(8)="I'm not carrying that! There's a dead  body in there!"
 3080 X$(9)="The girl chases the frog and kisses it. In a blinding flash, the frog turns    into the handsome Prince of Cenra!"
 3090 X$(10)="I'm not a thief you know!              I need a coin..."
 3100 X$(11)="O.K."
 3110 X$(12)="The old dwarf takes the brandy and     drinks it. He gives you a warm smile."
 3120 X$(13)="A handsome *PRINCE*"
 3130 X$(14)="An old dwarf. He is happy to come along with you now."
 3140 X$(15)="Albert still isn't feeling well enough to travel."
 3150 X$(16)="Healthy Albert!"
 3160 X$(17)="The frog hops away."
 3170 X$(18)="The coin fits in the slot.             I get a box of chocolates."
 3180 X$(19)="I can't carry the whole machine!"
 3190 X$(20)="After a second... The lock opens."
 3200 X$(21)="The landlord grins at you and says     'I don't accept those.'"
 3210 X$(22)="There is an inscription written on it  but I can't quite make it out."
 3220 X$(23)="The label reads 'For Rapid growth  use GROWMORE fertiliser.'"
 3230 X$(24)="The dark opening to a crypt"
 3240 X$(25)="The dwarf chases the hobgoblin away    with his axe."
 3250 X$(26)="It seems like a good idea, but...      Nothing happens."
 3260 X$(27)="The man lets out an agonizing scream!  His body shrivels in mid-air.          A Pile of dust falls to the ground.    A monster starts to form from the dust!"
 3270 X$(28)="An evil smelling Monsterwith venom    dripping from its pointed teeth."
 3280 X$(29)="Whoops! Missed!"
 3290 X$(30)="BANG! - Nothing happened."
 3300 X$(31)="The Vampire recoils at the sight of the crucifix and runs for its life!"
 3310 X$(32)="It doesn't seem to do anything at the  moment."
 3320 X$(33)="The vampire has already left."
 3330 X$(34)="The *DIAMONDS* must be valuable."
 3340 X$(35)="I can't see anything unusual."
 3350 X$(36)="The landlord doesn't like that..."
 3360 X$(37)="It bears an inscription:               A perfect gift for all.'"
 3370 X$(38)="I may be superman, but I just can't    carry any more."
 3380 X$(39)="I've not got it - Dummy!"
 3390 X$(40)="The pots are rather tatty."
 3400 X$(41)="A worthless bauble."
 3410 X$(42)="It's too fast for me."
 3420 X$(43)="Watch out!                             I think I may have been spotted."
 3430 X$(44)="I've just been ATTACKED!"
 3440 X$(45)="I can't move it, it's too rusty."
 3450 X$(46)="You must be joking!                    With breath like that!"
 3460 X$(47)="It eats the mushrooms, and falls into  a stupor."
 3470 X$(48)="Straight through the heart!            I grab the *SPEAR* back quickly."
 3480 X$(49)="Orcs are far too vicious and nasty."
 3490 X$(50)="Seems like a good idea..."
 3500 X$(51)="The horse just fainted!"
 3510 X$(52)="The girl refuses to come!"
 3520 X$(53)="The beanstalk spurts into furious      growth. I can use it to climb over the wall."
 3530 X$(54)="The dwarf refuses to come with you."
 3540 X$(55)="There is a wall here, but I can't      climb it.                              The soil is good..."
 3550 X$(56)="Albert is too ill to travel."
 3560 X$(57)="It's my healthy friend *Albert*"
 3570 X$(58)="The altar moved aside.                 There are two passages behind it."
 3580 X$(59)="There's a half decomposed body         in there!"
 3590 X$(60)="I'm sorry - I don't know that word."
 3600 X$(61)="The beanstalk grows so much that I can climb the wall!"
 3610 RETURN
 3620 L$="" : FOR H= 1 TO LEN(Z$)
 3630   IF MID$(Z$,H,1)=" "THENL$=RIGHT$(Z$,(LEN(Z$)-H)) : H=H+40
 3640 NEXT
 3650 R=0
 3660 L%=0 : IF LEN(L$)<2 THEN RETURN
 3670 FOR H= 1 TO 53 : IF LEFT$(N$(H),LEN(L$))=L$ THEN L%=1 : R=H
 3680 NEXT
 3690 RETURN
 3700 CLS : REM PRINT''TAB(STW%/2 -9)"THE FOREST OF DOOM"
 3710 PRINT'
 3720 COLOUR Text1Col% : PRINT TAB(STW%/2 -6)"An adventure"
 3730 COLOUR Text2Col% : PRINT'TAB(STW%/2 -6)"By S.W.Lucas"
 3740 COLOUR Text1Col% : PRINT'TAB(STW%/2 -12)"Ported to the Agon Light"
 3750 COLOUR Text2Col% : PRINT'TAB(STW%/2 -8)"By Steve Lovejoy"
 3760 PRINT''"Many months ago your lifelong friend,  Albert, set out to rescue the Prince of Cenra who has been captured by the evil witch and is reputed to have been turned into a poor little frog."
 3770 PRINT"Albert has never returned and you must set out to find him and in the process  you must also find four items of        treasure which were stolen from your    land by the evil witch."
 3780 COLOUR Text1Col% : PRINT'''TAB(STW%/2 -14)"Press the SPACE BAR to begin" : COLOUR Text2Col%
 3790 REM *FX15,0
 3800 REPEAT UNTIL GET=32
 3810 RETURN
 3820 A%=0
 3830 IF B%(6,1)=2 THEN A%=A%+1
 3840 IF B%(1,1)=2 THEN A%=A%+1
 3850 IF B%(8,1)=2 THEN A%=A%+1
 3860 IF B%(9,1)=2 THEN A%=A%+1
 3870 IF B%(10,1)=2 THEN A%=A%+1
 3880 IF B%(15,1)=2 THEN A%=A%+1
 3890 RETURN
 3900 CLS
 3910 PRINT''"You dirty, filthy beast!"
 3920 PRINT"Go and wash your mouth out."
 3930 PRINT''"You had better apologise to me!"
 3940 INPUT A$ : IF LEFT$(A$,5)="SORRY" OR RIGHT$(A$,5)="SORRY" THEN GOTO 3950 ELSE PRINT"That's not good enough!" : GOTO 3940
 3950 CLS : PRINT"That's better!" : GOTO 170
 3960 IF P%=27 THEN 4030
 3970 PRINT''"That doesn't seem to help."
 3980 PRINT'"Maybe I didn't try hard enough?"
 3990 GOTO 390
 4000 GOSUB 3620
 4010 IF LEFT$(L$,3)="MON" THEN PRINT"The monkey is not pleased..." : GOTO 390
 4020 PRINT"Don't be silly!" : GOTO 390
 4030 :
 4040 S%(27,2)=39 : S%(27,3)=28 : G$(22)=X$(58)
 4050 :
 4060 FOR W= 1 TO 5000 : NEXT
 4070 PRINT'''"This is absolutely amazing!"
 4080 :
 4090 FOR W= 1 TO 5000 : NEXT
 4100 PRINT''"The altar slides to one side...        There are two passages behind it."
 4110 GOTO 390
 4120 GOSUB 3620 : IF P%=20 AND R=52 PRINT"Well... You DID ask me to flush it..."
 4130 IF P%<>20 THEN PRINT"Pull what?!"
 4140 GOTO 170
 4150 DEF PROCPARSER
 4160 IF LEN(Z$)=1 THEN PROCP2
 4170 IF LEFT$(Z$,3)="GO " THEN Z$=RIGHT$(Z$,LEN(Z$)-3)
 4180 IF LEFT$(Z$,2)="X " THEN Z$=RIGHT$(Z$,LEN(Z$)-2) : Z$="EXAM "+Z$
 4190 B$=LEFT$(Z$,4):GOSUB3620
 4200 ENDPROC
 4210 DEF PROCP2
 4220 IF Z$="N"ORZ$="S"ORZ$="E"ORZ$="W" THEN ZS=1 ELSE ZS=0
 4230 IF Z$="I" THEN Z$="INVE" : ENDPROC
 4240 IF Z$="L" THEN Z$="LOOK" : ENDPROC
 4250 IF Z$="N" THEN Z$="NORT" : ENDPROC
 4260 IF Z$="S" THEN Z$="SOUT" : ENDPROC
 4270 IF Z$="E" THEN Z$="EAST" : ENDPROC
 4280 IF Z$="W" THEN Z$="WEST" : ENDPROC
 4290 ENDPROC
 4300 IF ERR=17 THEN RUN
 4310 CLS : REPORT : PRINT" at line ";ERL
 4320 END
 4330 :
 4340 DEF PROCvars
 4350 MB%=&40000 : REM Memory Bank &40000.
 4360 Black%=0
 4370 Red%=1
 4380 Green%=2
 4390 Yellow%=3
 4400 Blue%=4
 4410 Magenta%=5
 4420 Cyan%=6
 4430 LtGray%=7
 4440 DkGray%=8
 4450 IntRed%=9
 4460 IntGreen%=10
 4470 IntYellow%=11
 4480 IntBlue%=12
 4490 IntMagenta%=13
 4500 IntCyan%=14
 4510 White%=15
 4520 MODE 8
 4530 COLOUR 128+Black% : REM set background colour.
 4540 COLOUR White% : REM set foreground text colour.
 4550 PrimCol% = IntCyan%
 4560 SecCol% = IntGreen%
 4570 Text1Col% = IntCyan%
 4580 Text2Col% = White%
 4590 HudCol% = PrimCol% : REM set hud colour.
 4600 SW%=1279:SH%=1023:STW%=40:STH%=30:HSPLITY%=SH%-140 : REM SW & SH are in graphical units. STW & STH are charactors.
 4610 LT%=1:RT%=STW%-2:T1X=0:T1Y=0:T2X=0:T2Y=0 : REM margins and text position vars.
 4620 ENDPROC : REM end vars.
 4630 :
 4640 DEF PROCdrawHud(Col%)
 4650 VDU 18,0,Col%
 4660 VDU 26
 4670 MOVE 0,0 : DRAW 0,SH% : MOVE 1,0 : DRAW 1,SH% : MOVE 2,0 : DRAW 2,SH% : REM left border.
 4680 MOVE 0,0 : DRAW SW%,0 : MOVE 0,1 : DRAW SW%,1 : MOVE 0,2 : DRAW SW%,2 : REM bottom border.
 4690 MOVE SW%,0 : DRAW SW%,SH% : MOVE SW%-1,1 : DRAW SW%-1,SH% : MOVE SW%-2,2 : DRAW SW%-2,SH% : REM right border
 4700 MOVE 0,SH% : DRAW SW%,SH% : MOVE 0,SH%-1 : DRAW SW%,SH%-1 : MOVE 0,SH%-2 : DRAW SW%,SH%-2 : REM top border.
 4710 MOVE 0,HSPLITY% : DRAW SW%,HSPLITY% : MOVE 0,HSPLITY%-1 : DRAW SW%,HSPLITY%-1
 4720 MOVE 0,HSPLITY%-2 : DRAW SW%,HSPLITY%-2 : REM horizontal split 1.
 4730 COLOUR Text1Col% : PRINT''TAB(STW%/2 -9,1)"THE FOREST OF DOOM" : PRINT TAB(STW%/2 -9,2)"--- ------ -- ----" : COLOUR Text2Col%
 4740 ENDPROC : REM end draw hud.
 4750 :
 4760 DEF PROC_messageViewPort
 4770 VDU 28,LT%,STH%-2,RT%,5 : REM SET text View Port (Left,Bottom,Right,Top).
 4780 REM COLOUR 128+DkGray%. used to test VP.
 4790 CLS
 4800 ENDPROC
 4810 :
 4820 DEF PROC_resetViewPorts
 4830 VDU 26
 4840 ENDPROC
 4850 :
