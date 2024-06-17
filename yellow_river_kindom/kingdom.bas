   10 REM "********************************"
   20 REM "*     YELLOW RIVER KINGDOM     *"
   30 REM "*      written in 1981 by      *"
   40 REM "*       Tom Hartley and        *"
   50 REM "*       Jerry Temple-Fry       *"
   60 REM "*   Ported to the Agon Light   *"
   70 REM "*    By Steve Lovejoy 2024     *"
   80 REM "********************************"
   90 REM "             main               "
  100 :
  110 MODE 7
  120 CLS
  130 PROCVARIABLE : PROCTITLEPAGE
  140 PROCINSTRUCTIONS
  150 F=5000+RND(2000)
  160 P=300+RND(100)
  170 J=0:S=0
  180 S=S+1:IF S=4 THEN S=1
  190 J=J+1:Y=(J-1) DIV 3 +1
  200 PROCNEWSEASON
  210 FOR V=1 TO 3:FL(V)=0:NEXT
  220 TD=0:TF=0:FD=0:FF=0:VF=0
  230 PROCMAP:PROCDBL(S$(S)+" Season             Year "+STR$(Y),1,1)
  240 IF RND(2)=1 THEN 260
  250 PROCFLOOD:PROCATTACK:GOTO270
  260 PROCATTACK:PROCFLOOD
  270 PROCCALCULATE
  280 PROCENDSEASON
  290 IF P=0 OR F=0 THEN 330
  300 IF J MOD 12 =0 THEN PROCRITUAL : IF Y%=0 THEN 330
  310 IF P<200 AND RND(3)=1 THEN PROCADDTHIEVES
  320 P=INT(P*1.045) : GOTO 180
  330 VDU 26 : CLS : PRINTTAB(0,9)
  340 PRINT"Press the RETURN key to start again."'
  350 PRINT"Press the ESCAPE key to leave the"'"program."
  360 REPEAT UNTIL GET$=CHR$(13):GOTO150
  370 IF ERR<>17 THEN REPORT:PRINT" in line ";ERL:END
  380 VDU26:CLS
  390 PRINTTAB(5,9);
  400 PRINT"Do you want to go on to"
  410 PRINT"     the next program (Y/N)? ";
  420 PROCYESORNO:IF Y%<0 THEN 390
  430 IF Y%=0 THEN CLEAR : GOTO 130
  440 PRINT '"BIORHYTHMS WOULD BE THE NEXT PROGRAM." : END
  450 DEFPROCMAP
  460 VDU 26 : CLS : PRINT''
  470 FOR I=3 TO 23
  480   PRINTY$;W$;CHR$(&96);"55";Y$;TAB(27);R$
  490 NEXT
  500 FOR I=3 TO 21 STEP 2
  510   PRINTTAB(28,I);" x ";TAB(28,I+1);"x";CHR$(255);"~x  x"
  520   PRINTTAB(33,I+2);"x";CHR$(255);"~x";
  530 NEXT
  540 FOR I=13 TO 15 : PRINTTAB(30,I);"  "
  550 NEXT
  560 PRINTTAB(30,14);"THIEVES";TAB(31,13);"TT";TAB(31,15);"T";TAB(32,16);"T";TAB(32,17);"T"
  570 PRINTTAB(0,23);"   DYKE        VILLAGES      MOUNTAINS";
  580 FOR V=1 TO 3 : PROCVDRAW(V) : NEXT
  590 ENDPROC
  600 DEFPROCVDRAW(V)
  610 PRINTTAB(VX(V)-2,VY(V));V$;"^&";Y$TAB(VX(V)-2,VY(V)+1);V$;"&^";Y$
  620 ENDPROC
  630 DEFPROCINSTRUCTIONS
  640 PROCYELLOW:PRINT'''
  650 PRINT"The kingdom is three villages. It"'"is between the Yellow River and"'"the mountains."
  660 PRINT'"You have been chosen to take"'"all the important decisions. Your "'"poor predecessor was executed by"'"thieves who live in the nearby"'"mountains."
  670 PRINT'"These thieves live off the "'"villagers and often attack. The"'"rice stored in the villages must"'"be protected at all times."
  680 PROCSPACE
  690 CLS:PRINT''
  700 PRINT"The year consists of three long "'"seasons, Winter, Growing and"'"Harvest. Rice is planted every"'"Growing Season. You must decide"'"how much is planted."
  710 PRINT'"The river is likely to flood the"'"fields and the villages. The high"'"dyke between the river and the"'"fields must be kept up to prevent"'"a serious flood."
  720 PRINT'"The people live off the rice that"'"they have grown. It is a very poor"'"living. You must decide what the"'"people will work at each season"'"so that they prosper under your"'"leadership."
  730 PROCSPACE
  740 ENDPROC
  750 DEFPROCNEWSEASON
  760 PROCYELLOW:PRINTTAB(8,1);"Census Results"':IF J=1 THEN 800
  770 PRINT"At the start of the ";S$(S);" Season"
  780 PRINT"of year ";Y;" of your reign this is"
  790 PRINT"the situation.":GOTO830
  800 PRINT"You have inherited this situation"
  810 PRINT"from your unlucky predecessor. It"
  820 PRINT"is the start of the Winter Season."
  830 PRINT'"Allowing for births and deaths,"
  840 PRINT"the population is ";P;". "'
  850 PRINT"There are ";F;" baskets of rice"
  860 PRINT"in the village stores."
  870 PRINT'"How many people should:"
  880 PRINT" A) Defend the dyke......"
  890 PRINT" B) Work in the fields..."
  900 PRINT" C) Protect the villages."
  910 QU=14:A=0
  920 PRINTTAB(26,QU);:NI=FNNUMINP
  930 IF A+NI>P THEN PROCIMPOS:GOTO920
  940 QU=QU+1:IF QU=16 THEN B=NI:GOTO970
  950 A=NI:IF A<P THEN 920
  960 B=0:PRINTTAB(26,QU);B:QU=16
  970 C=P-(A+B):PRINTTAB(26,QU);C
  980 IF S<>2 THEN 1040
  990 PRINT'"How many baskets of rice will be"
 1000 PRINT"planted in the fields....."
 1010 PRINTTAB(26,19);:G=FNNUMINP
 1020 IF G>F THEN PROCIMPOS:GOTO1010
 1030 F=F-G
 1040 PROCSPACE
 1050 ENDPROC
 1060 DEFPROCENDSEASON
 1070 PROCWAIT(1)
 1080 IF F>0 THEN 1130
 1090 CLS:PRINTTAB(3,7);"There was no food left.All of the"
 1100 PRINT"   people have run off and joined up"
 1110 PRINT"   with the thieves after ";J;" seasons"
 1120 PRINT"   of your misrule":PROCSPACE:ENDPROC
 1130 IF P>0 THEN 1180
 1140 CLS:PRINTTAB(2,8);"There is no-one left! They have all"
 1150 PRINT"  been killed off by your decisions "
 1160 PRINT"  after only ";Y;" year";:IF Y<>1 THEN PRINT"s";
 1170 PRINT".":PROCSPACE:ENDPROC
 1180 F1=P/(FD+TD+ST+1):F2=F/(TF+FF+1):IF F2<F1 THEN F1=F2
 1190 IF F2<2 THEN T$="Disastrous Losses!":GOTO1270
 1200 IF F1<4 THEN T$="Worrying losses!":GOTO1270
 1210 IF F1<8 THEN T$="You got off lightly!":GOTO1270
 1220 IF F/P<4 THEN T$="Food supply is low.":GOTO1270
 1230 IF F/P<2 THEN T$="Starvation Imminent!":GOTO1270
 1240 IF ZA+ZF+ST>0 THEN T$="Nothing to worry about.":GOTO1270
 1250 PROCDBL("             A quiet season           ",1,11)
 1260 PROCWAIT(2):ENDPROC
 1270 PROCYELLOW:PRINTTAB(3,2);"Village Leader's Report"
 1280 PRINT'TAB(15-LEN(T$)/2);CHR$(&88);T$
 1290 PRINT'"In the ";S$(S);" Season of year ";Y
 1300 PRINT"of your reign, the kingdom has"
 1310 PRINT"suffered these losses:"'
 1320 PRINT"Deaths from floods..........";FD
 1330 PRINT"Deaths from the attacks.....";TD
 1340 PRINT"Deaths from starvation......";ST
 1350 PRINT"Baskets of rice"'"lost during the floods......";FF
 1360 PRINT"Baskets of rice"'"lost during the attacks.....";TF
 1370 PRINT'"The village census follows."
 1380 PROCSPACE
 1390 ENDPROC
 1400 DEFPROCADDTHIEVES
 1410 PROCYELLOW:PRINTTAB(0,8)
 1420 PRINT"Thieves have come out of the"
 1430 PRINT"mountain to join you. They"
 1440 PRINT"have decided that it will be"
 1450 PRINT"easier to grow the rice than"
 1460 PRINT"to steal it!":PROCSPACE
 1470 P=P+50+RND(100)
 1480 ENDPROC
 1490 DEFPROCRITUAL
 1500 PROCYELLOW:PRINT''
 1510 PRINT"We have survived for ";Y;" years"
 1520 PRINT"under your glorious control."
 1530 PRINT"By an ancient custom we must"
 1540 PRINT"offer you the chance to lay"
 1550 PRINT"down this terrible burden and"
 1560 PRINT"resume a normal life."
 1570 PRINT'"In the time honoured fashion"
 1580 PRINT"I will now ask the ritual"
 1590 PRINT"question:"':PROCWAIT(5)
 1600 PRINT"Are you prepared to accept"
 1610 PRINT"the burden of decision again?"'
 1620 PRINT"You need only answer Yes or No"
 1630 PRINT"for the people will understand"'"your reasons."
 1640 PRINTTAB(0,21);:PROCYESORNO:IF Y%<0 THEN 1640
 1650 ENDPROC
 1660 DEFPROCATTACK
 1670 LOCALX,Y,I
 1680 ZA=0:R=RND(1):ON S GOTO1690,1700,1710
 1690 IF R<.5 THEN ENDPROC ELSE 1720
 1700 IF R<.2 THEN ENDPROC ELSE 1720
 1710 IF R<.6 THEN ENDPROC ELSE 1720
 1720 ZA=1
 1730 IF VF=3 THEN ENDPROC
 1740 V=RND(3):IF FL(V)=1 THEN 1740
 1750 X=32:WX=VX(V):WY=VY(V)-1
 1760 IF WY<17 THEN Y=13:D=-1 ELSE Y=17:D=1
 1770 SY=Y
 1780 PRINTTAB(X,Y);" ":IF Y=WY THEN 1800
 1790 Y=Y+D:PRINTTAB(X,Y);"T":PROCWAIT(.05):GOTO1780
 1800 X=X-1:PRINTTAB(X-1,Y);R$;"T":PROCWAIT(1-(X-WX)/5)
 1810 PRINTTAB(X,Y);:IF X=29 THEN PRINT"x" ELSE PRINT" "
 1820 IF X>WX THEN 1800
 1830 FOR I=1 TO 99
 1840   PRINTTAB(X,Y+1);CHR$(RND(94)+32):NEXT
 1850 PROCVDRAW(V)
 1860 X=X+1:IF X<27 THEN PRINTTAB(X-2,Y);" "
 1870 IF X=31 THEN PRINTTAB(29,Y);"x"
 1880 PRINTTAB(X-1,Y);R$;"T":PROCWAIT(.04)
 1890 IF X<32 THEN 1860
 1900 IF Y=SY THEN 1920
 1910 PRINTTAB(X,Y);" ":Y=Y-D:PRINTTAB(X,Y);"T":PROCWAIT(.05):GOTO1900
 1920 ON S GOTO 1930,1940,1950
 1930 I=200+RND(70)-C:GOTO1960
 1940 I=30+RND(200)-C:GOTO1960
 1950 I=RND(400)-C
 1960 I=INT(I):IF I<0 THEN I=0
 1970 TD=INT(C*I/400):C=C-TD
 1980 TF=INT(I*F/729+RND(2000-C)/10):IF TF<0 THEN TF=0
 1990 IF TF>2000 THEN TF=1900+RND(200)
 2000 F=F-TF
 2010 ENDPROC
 2020 DEFPROCFLOOD
 2030 LOCALX,Y
 2040 ZF=0:ON S GOTO 2050,2060,2070
 2050 FS=RND(330)/(A+1):GOTO2080
 2060 FS=(RND(100)+60)/(A+1):GOTO2080
 2070 ENDPROC
 2080 IF FS<1 THEN ENDPROC
 2090 X=6:ZF=1:Y=RND(8)+10:IF FS<2 THEN FS=RND(2) ELSE FS=RND(4)
 2100 PRINTTAB(1,Y);W$;W$;W$;W$;W$;W$
 2110 FOR K=1 TO FS*100
 2120   ON RND(4) GOTO2130,2140,2150,2160
 2130   IF X=25 THEN 2120 ELSE X=X+1:GOTO2170
 2140   IF X=6 THEN 2120 ELSE X=X-1:GOTO2170
 2150   IF Y=22 THEN 2120 ELSE Y=Y+1:GOTO2170
 2160   IF Y=3 THEN 2120 ELSE Y=Y-1:GOTO2170
 2170   V=1
 2180   W1=VX(V)-X:W2=Y-VY(V)
 2190   IF W2<>1 AND W2<>0 THEN 2220
 2200   IF W1=0 OR W1=1 THEN FL(V)=1
 2210   IF W1=-1 THEN 2240
 2220   V=V+1:IF V<4 THEN 2180
 2230   PRINTTAB(X,Y);W$
 2240 NEXTK
 2250 VF=FL(1)+FL(2)+FL(3)
 2260 OP=A+B+C
 2270 A=INT((A/10)*(10-FS))
 2280 B=INT((B/10)*(10-FS))
 2290 C=INT((C/6)*(6-VF))
 2300 FF=INT(F*VF/6):F=F-FF
 2310 FD=OP-A-B-C
 2320 IF S=2 THEN G=G*(20-FS)/20
 2330 IF S=3 THEN G=G*(10-FS)/10
 2340 ENDPROC
 2350 DEFPROCCALCULATE
 2360 IF B=0 THEN G=0:GOTO2440
 2370 ON S GOTO 2440,2380,2400
 2380 IF G>1000 THEN G=1000
 2390 G=G*(B-10)/B:GOTO2440
 2400 IF G<0 THEN 2440
 2410 G=18*(11+RND(3))*(0.05-1/B)*G
 2420 IF G<0 THEN 2440
 2430 F=F+INT(G)
 2440 ST=0:P=A+B+C:IF P=0 THEN 2510
 2450 T=F/P:IF T>5 THEN T=4:GOTO2490
 2460 IF T<2 THEN P=0:GOTO2510
 2470 IF T>4 THEN T=3.5:GOTO2490
 2480 ST=INT(P*(7-T)/7):T=3
 2490 P=P-ST:F=INT(F-P*T-ST*T/2)
 2500 IF F<0 THEN F=0
 2510 ENDPROC
 2520 DEFPROCVARIABLE
 2530 DIM S$(3),VX(3),VY(3),FL(3)
 2540 S$(1)="Winter":S$(2)="Growing":S$(3)="Harvest"
 2550 W$=CHR$(255):Y$=CHR$(&93):R$=CHR$(&91):V$=CHR$(&92)
 2560 VX(1)=13:VY(1)=8
 2570 VX(2)=21:VY(2)=12
 2580 VX(3)=22:VY(3)=18
 2590 ENDPROC
 2600 DEFPROCIMPOS
 2610 PRINTTAB(4,20);CHR$(&88);CHR$(&82);"I M P O S S I B L E"
 2620 PROCWAIT(2)
 2630 PROCSPACE
 2640 PRINTTAB(5,20);SPC(20);TAB(0,22);SPC(40)
 2650 ENDPROC
 2660 DEFPROCYELLOW
 2670 LOCALI
 2680 CLS:FOR I=0 TO 24
 2690   PRINTTAB(0,I);CHR$(&83);:NEXT
 2700 PRINTTAB(0,0);
 2710 VDU 28,3,24,39,0
 2720 ENDPROC
 2730 DEFPROCDBL(X$,X,Y)
 2740 PRINTTAB(X-1,Y);CHR$(141);X$
 2750 PRINTTAB(X-1,Y+1);CHR$(141);X$
 2760 ENDPROC
 2770 DEFPROCWAIT(X)
 2780 LOCAL Z
 2790 Z=TIME
 2800 REPEAT UNTIL TIME-Z>X*100
 2810 ENDPROC
 2820 DEFPROCSPACE
 2830 PRINTTAB(0,22);"Press the SPACE BAR to continue";:PROCKCL
 2840 REPEAT UNTIL GET$=" "
 2850 ENDPROC
 2860 DEFPROCTITLEPAGE
 2870 PROCMAP:PROCOFF:PROCWAIT(2):PRINTTAB(0,11);SPC(200)
 2880 PROCDBL(Y$+"YELLOW RIVER",11,11):PROCDBL(Y$+"KINGDOM",13,14): PRINTTAB(12,21)"PRESS ENTER"
 2890 I%=INKEY(500)
 2900 ENDPROC
 2910 DEFPROCKCL
 2920 IF INKEY$(0)>"" THEN 2920
 2930 ENDPROC
 2940 DEFPROCOFF
 2950 VDU23;8202;0;0;0;:ENDPROC
 2960 DEFPROCON
 2970 VDU23;29194;0;0;0;:ENDPROC
 2980 DEFPROCGPI(F2,ML):REM General Purpose Input Routine
 2990 LOCALB,B$
 3000 A$=""
 3010 PRINTSTRING$(ML," ");STRING$(ML+1,CHR$(8));CHR$(&83);:PROCON:PROCKCL
 3020 B$=GET$:B=ASC(B$):IF B=13 THEN 3090
 3030 IF B=127 AND A$="" THEN 3020
 3040 IF B=127 THEN A$=LEFT$(A$,LEN(A$)-1):PRINTB$;:GOTO3020
 3050 IF LEN(A$)=ML OR B<32 OR B>126 THEN 3070
 3060 IF F2=0 OR B=32 OR (B>=48 AND B<=57) THEN 3080
 3070 VDU7:GOTO3020
 3080 PRINTB$;:A$=A$+B$:GOTO3020
 3090 PROCOFF
 3100 ENDPROC
 3110 DEFPROCYESORNO
 3120 LOCALB$
 3130 PROCGPI(0,3)
 3140 B$=LEFT$(A$,1)
 3150 Y%=-1
 3160 IF B$="Y" OR B$="y" THEN Y%=1
 3170 IF B$="N" OR B$="n" THEN Y%=0
 3180 ENDPROC
 3190 DEFFNNUMINP
 3200 PROCGPI(1,6)
 3210 =VAL(A$)
