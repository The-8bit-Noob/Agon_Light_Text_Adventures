   10 REM "********************************"
   20 REM "*          PLANET-FALL         *"
   30 REM "*      Written in 1983 by      *"
   40 REM "*   Tim Garden & Ian Nicholls  *"
   50 REM "*   Ported to the Agon Light   *"
   60 REM "*    By Steve Lovejoy 2024     *"
   70 REM "********************************"
   80 REM "           Main Game            "
   90 :
  100 SL%=3 : Z%=RND(-TIME)
  110 REM
  120 MODE 7 : DIM Q(6)
  130 VDU 23;11;0;0;0;
  140 DIM S(12,15),T(12,12),T$(12),B(3,12),D$(4),P$(15),CO$(6)
  150 RESTORE 230
  160 FOR XX=1 TO 6 : READ Q(XX) : NEXT
  170 WZ=0 : SA$="" : QM=0 : QQ=0 : AR=0 : G$=STRING$(25," ")
  180 GOSUB 6640
  190 DIM M(6,3),C(6,3),P(6),G(6),N$(12)
  200 C$="JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC"
  210 S$="Sol VerlGwifZenoQetzFlanWephNookYttrDrunIpneCheeLingOvisJuss"
  220 GOTO 6880
  230 DATA 5000,3900,4000,4500,3300,3500
  240 TIME=0 : IF R=1 THEN 260
  250 H3=1 : H4=1 : GOTO 270
  260 GOSUB 3420 : GOSUB 3980 : GOSUB 4560 : GOTO 390
  270 S1=1 : T1=1 : L1=1 : GOSUB 4380 : PRINTTAB(8,22)"PRESS A KEY TO START";
  280 PROCi
  290 I1=RND(1)
  300 FL=1 : PQ=1 : GOSUB 3100
  310 GQ=1
  320 FOR I1=1 TO T9/P9
  330   FOR P1=1 TO P9 : S7=(P1-1)*6+1 : PRINTTAB(0,21)CHR$135;CHR$157;CHR$133;SPC36;TAB(3,21);N$(P1);" in ";T$(T1) : GOSUB 2550
  340     FOR GJ=20 TO 23 : PRINTTAB(0,GJ)CHR$135;CHR$157;CHR$135 : G$="10101" : PROCMUSIC(1) : NEXT : GOSUB 5250
  350     IF SW=9 PRINTTAB(22,22)CHR$129;"'A' to turn page"
  360     L1=L1+6 : T1=T1+1 : NEXT, : PQ=0
  370   IF GQ=1 GOSUB 4560 : GQ=0
  380   PROCi
  390   D=T(9,1) : Y=T(10,1) : T1=1 : FOR I=2 TO T9 : IF T(10,I)<Y THEN 450
  400     IF (RND(1)>.93)AND(SA$="") GOSUB 6740
  410     K0=K0+1 : IF K0>145 SA$=""
  420     IF T(10,I)>Y THEN 460
  430     IF T(9,I)>D THEN 460
  440     IF (T(9,I)=D)AND(RND(1)>.5) THEN 460
  450     D=T(9,I) : Y=T(10,I) : T1=I
  460   NEXT
  470   IF Y1=Y THEN 710
  480   D1=1 : Y1=Y : T2=T1 : GOSUB 3070
  490   PROCi
  500   IF Y1<>2070 THEN 530
  510   REM
  520   REM
  530   T1=T2 : IF Y1<Y9 THEN 710
  540   GOSUB 3110 : XX=5
  550   PRINTTAB(10,17)CHR$132;CHR$157;SPC(17);CHR$135;CHR$157
  560   PRINTTAB(10,18)CHR$132;CHR$157;CHR$147"<,,,,,,,,,,,,,l "CHR$135;CHR$157
  570   PRINTTAB(10,19)CHR$132;CHR$157;CHR$147"5"CHR$136"END OF GAME"CHR$137"j "CHR$135;CHR$157
  580   PRINTTAB(10,20)CHR$132;CHR$157;CHR$147"-,,,,,,,,,,,,,. "CHR$135;CHR$157
  590   PRINTTAB(10,21)CHR$132;CHR$157;SPC(17);CHR$135;CHR$157
  600   PRINTTAB(11-INT(LEN(N$(WINNER))/2),23)CHR$132"*** ";N$(WINNER);" has won ***"
  610   REM *FX15,0
  620   A$=INKEY$(0):IF XX>221 THEN XX=5 ELSE XX=XX+16:SOUND1,-3*SL%,XX,2
  630   IF A$="" GOTO 620
  640   CLS : PROCback(135,132)
  650   FOR E%=0 TO 1 : PRINTTAB(4,5+E%)CHR$141"Perhaps"CHR$129;N$(WINNER);CHR$132"won't be so" : NEXT
  660   FOR E%=0 TO 1 : PRINTTAB(4,7+E%)CHR$141"lucky in the next game!!" : NEXT
  670   FOR E%=0 TO 1 : PRINTTAB(2,15+E%)CHR$141;CHR$130"Do you want to set up"CHR$131"another"CHR$130"game?" : NEXT
  680   PROCi
  690   IF A$="Y" RUN
  700   GOTO 6730
  710   D1=D : M=INT((D1-1)/30) : L=3*M+1 : GOSUB 5300
  720   M=INT((D1-1)/30)
  730   H3=L : H4=D1-30*M : L=(T1-1)*6+1
  740   S1=T(8,T1) : M=S(8,S1) : GOSUB 5410
  750   FOR XX=1 TO 3 : P$(XX)="" : NEXT
  760   TXT$=CHR$129 : ON T(12,T1)+1 GOTO 940,900,860,770
  770   IF RND(1)>.5 P$(1)="3 weeks delay" : P$(2)="for Customs" : P$(3)="" : GOTO 950
  780   T(11,T1)=INT(T(11,T1)/2)
  790   FOR XX=1TO5:T(XX,T1)=INT(T(XX,T1)*(1-.4*RND(1))) : NEXT
  800   T(6,T1)=INT(T(6,T1)*RND(1))
  810   T(7,T1)=T(1,T1)+T(2,T1)+T(3,T1)+T(4,T1)
  820   P$(1)="3 weeks late *"
  830   P$(2)="Pirate attack"
  840   P$(3)=" mid voyage  "
  850   GOTO 950
  860   P$(1)="2 weeks late *"
  870   P$(2)="Navigational "
  880   P$(3)="   error     "
  890   GOTO 950
  900   P$(1)="1 week late *"
  910   P$(2)="   Computer"
  920   P$(3)="   error     "
  930   GOTO 950
  940   TXT$=CHR$130:P$(2)="On Schedule  ":P$(1)="":P$(3)=""
  950   FOR XX=1 TO 3 : PRINTTAB(23,7+XX)TXT$;P$(XX);CHR$151 : NEXT : WZ=0 : GOSUB 6540
  960   PROCi
  970   FOR ZZ=1 TO 3 : PRINTTAB(21+5*ZZ,13)STR$(T(ZZ,T1)) : NEXT
  980   FOR ZZ=4 TO 6 : PRINTTAB(21+5*(ZZ-3),16)STR$(T(ZZ,T1)) : NEXT
  990   IF QQ=1 RETURN
 1000   GOSUB 3420 : GOSUB 5580
 1010   Z1$="Requirement:" : Z2$="No. for sale:   " : Z3$="Offer is:"
 1020   Z4$="You ask:" : J1=1
 1030   FOR E%=0TO2:PRINTTAB(23,8+E%)CHR$136;CHR$145;"$$$$$$$$$$$$";CHR$137;CHR$151 : NEXT
 1040   PRINTTAB(23,9)CHR$130;"  SELL CARGO ";CHR$151
 1050   PRINTTAB(23,10)CHR$136;CHR$145;"$$$$$$$$$$$$";CHR$137;CHR$151
 1060   G$="101200530710120" : PROCMUSIC(3)
 1070   FOR I1=1 TO 6
 1080     PROCtime
 1090     GOSUB 5640
 1100     FOR Q5=9 TO 19 STEP 2 : PRINTTAB(3,Q5)SPC16 : NEXT
 1110     IF (S(I1,S1)>=0)OR(T(I1,T1)<.5)OR(P(I1)<100) THEN 1480
 1120     G$="121071290512107" : PROCMUSIC(3)
 1130     PRINTTAB(3,9)CO$(J1) : PRINTTAB(3,11)Z1$;" ";-INT(S(I1,S1))
 1140     PRINTTAB(3,13)Z2$;
 1150     XF=16 : YF=13 : N%=2 : GOSUB 3840
 1160     PRINTTAB(3,19)SPC15
 1170     IF X=0 THEN 1480
 1180     IF X<=T(I1,T1) THEN 1210
 1190     PRINTTAB(3,19)"Only ";T(I1,T1);" in hold"
 1200     GOTO 1140
 1210     IF X<=-INT(S(I1,S1)) THEN 1230
 1220     PRINTTAB(3,19)"NO DUMPING" : GOTO 1480
 1230     F%=0 : FOR K1=1 TO K9
 1240       IF K1<3 G$=STRING$(14,CHR$255) : PRINTTAB(3,15)CHR$145;G$;CHR$147 : G$="19305" : PROCMUSIC(1) : PROCdelay(5) : PRINTTAB(3,15)SPC16 : GOTO 1280
 1250       G$="08905" : PROCMUSIC(1)
 1260       PRINTTAB(3,19)"Last offer:";
 1270       GOTO 1310
 1280       PRINTTAB(11,17)SPC8
 1290       PRINTTAB(3,15)Z3$;
 1300       Y2=(L1+1)*10/3
 1310       PRINT;100*INT(.009*P(I1)*X+.5) : PRINTTAB(11,17)SPC6
 1320       PRINTTAB(3,17)Z4$ : YF=17 : XF=11 : X1=X
 1330       N%=6 : GOSUB 3840 : Y=X : X=X1
 1340       IF(Y>P(I1)*X/10)AND(Y<P(I1)*X*10) THEN 1370
 1350       PRINTTAB(3,19)"Try again       "
 1360       GOTO 1290
 1370       IF Y<=P(I1)*X THEN F%=1 : K1=K9 : GOTO 1400
 1380       IF Y>(1+ABS(FNZ(X)))*P(I1)*X THEN K1=K9 : GOTO 1400
 1390       P(I1)=.8*P(I1)+.2*Y/X
 1400     NEXT : IF F%=1 GOTO 1430
 1410     PRINTTAB(3,19)"No thanks       "
 1420     GOTO 1480
 1430     PRINTTAB(3,19)"We'll buy!!     "
 1440     T(I1,T1)=T(I1,T1)-X
 1450     T(7,T1)=T(7,T1)+X*(I1<5)
 1460     T(11,T1)=T(11,T1)+Y
 1470     S(I1,S1)=S(I1,S1)+X
 1480     J1=J1+1
 1490     PROCdelay(5)
 1500     AZ$="  " : GOSUB 5720 : AZ$=STR$(T(I1,T1)) : GOSUB 5720
 1510   NEXT
 1520   REM
 1530   REM
 1540   Z1$=" at " : Z2$="No. wanted:" : Z3$=" asks " : Z4$="You offer:"
 1550   J1=1
 1560   FOR E%=0 TO 2 : PRINTTAB(23,8+E%)CHR$136;CHR$145;"$$$$$$$$$$$$";CHR$137;CHR$151 : NEXT
 1570   PRINTTAB(23,9)CHR$131;"  BUY GOODS ";CHR$151
 1580   G$="149201010714907" : PROCMUSIC(3)
 1590   FOR I1=1TO6
 1600     PROCtime
 1610     GOSUB 5640
 1620     FOR Q5=9 TO 19 STEP 2 : PRINTTAB(3,Q5)SPC16 : NEXT
 1630     IF(P(I1)<100)OR(G(I1)<=0)OR(S(I1,S1)<1) THEN 2130
 1640     IF(I1<=4)AND(T(7,T1)>=W) THEN 2130
 1650     G$="169071770516907" : PROCMUSIC(3)
 1660     PRINTTAB(3,9)CO$(J1)
 1670     PRINTTAB(3,11)STR$(INT(S(I1,S1)));Z1$;100*INT(.011*P(I1)+.5)
 1680     PRINTTAB(3,13)Z2$;"    ";CHR$8;CHR$8;CHR$8;CHR$8;
 1690     XF=14 : YF=13
 1700     N%=2 : GOSUB 3840 : PRINTTAB(3,19)SPC16
 1710     IF X=0 THEN 2130
 1720     IF(I1>4)OR(X+T(7,T1)<=W) THEN 1750
 1730     PRINTTAB(3,19)"Max load = ";W-T(7,T1)
 1740     GOTO 1680
 1750     IF X<=INT(S(I1,S1)+.2) THEN 1780
 1760     PRINTTAB(3,19)"Only ";INT(S(I1,S1));" on offer"
 1770     GOTO 1680
 1780     F%=0 : FOR K1=1 TO K9
 1790       IF K1<3 G$=STRING$(14,CHR$255) : PRINTTAB(3,15)CHR$145;G$;CHR$147 : G$="19305" : PROCMUSIC(1) : PROCdelay(5) : PRINTTAB(3,15)SPC16 : GOTO 1830
 1800       G$="08905" : PROCMUSIC(1)
 1810       PRINTTAB(3,19)"Last offer:";
 1820       GOTO 1850
 1830       PRINTTAB(11,17)SPC8
 1840       PRINTTAB(3,15)MID$(S$,M,4);Z3$;
 1850       PP=ABS(P(I1))
 1860       PRINT;100*INT(.011*PP*X+.5) : PRINTTAB(13,17)SPC6
 1870       PRINTTAB(3,17)Z4$ : YF=17 : XF=13 : X1=X
 1880       N%=6 : GOSUB 3840 : Y=X : X=X1
 1890       IF(Y>PP*X/10)AND(Y<PP*X*10) THEN 1910
 1900       PRINTTAB(3,19)"Try again       "
 1910       IF Y>=PP*X THEN F%=1 : K1=K9 : GOTO 1940
 1920       IF Y<(1-ABS(FNZ(X)))*PP*X THEN K1=K9 : GOTO 1940
 1930       P(I1)=.8*P(I1)+.2*Y/X
 1940     NEXT : IF F%=1 GOTO 1980
 1950     PRINTTAB(3,19)"Not enough      " : PROCdelay(8) : PRINTTAB(3,19)"NO SALE         "
 1960     G$="0812007310069150612005320" : PROCMUSIC(5)
 1970     GOTO 2130
 1980     IF Y<=T(11,T1) THEN 2080
 1990     T(12,T1)=0
 2000     PRINTTAB(3,19)"Not enough cash!" : PROCdelay(8) : PRINTTAB(3,19)SPC16;TAB(3,19)"_`";T(11,T1);"_" : PROCdelay(6)
 2010     GOSUB 3780
 2020     IF(S(7,S1)<10)+(T(11,T1)+ B(1,B1)<Y) THEN 1950
 2030     FOR XZ=1 TO 400 : NEXT
 2040     PRINTTAB(3,19);Y-T(11,T1);" from Bank"
 2050     B(1,B1)=B(1,B1)-Y+T(11,T1) : T(11,T1)=Y
 2060     PROCdelay(12)
 2070     IF Y>T(11,T1) THEN 1950
 2080     PRINTTAB(3,19)CHR$130;" *** SOLD ***  "
 2090     G$="1010214904" : PROCMUSIC(2) : T(I1,T1)=T(I1,T1)+X
 2100     T(7,T1)=T(7,T1)-X*(I1<5)
 2110     S(I1,S1)=S(I1,S1)-X
 2120     T(11,T1)=T(11,T1)-Y
 2130     J1=J1+1
 2140     PROCdelay(5)
 2150     AZ$="  " : GOSUB 5720 : AZ$=STR$(T(I1,T1)) : GOSUB 5720
 2160   NEXT
 2170   GOSUB 3780
 2180   IF(S(7,S1)<10)+(T(11,T1)+B(1,B1)=0) THEN 2200
 2190   GOSUB 3570
 2200   FOR E%=0 TO 1 : PRINTTAB(2,21+E%)CHR$141;CHR$133;"You are on ";MID$(S$,M,4);CHR$140; : NEXT
 2210   S(7,S1)=S(7,S1)+.02+RND(1)/25
 2220   GOSUB 2550
 2230   J=0
 2240   F%=0 : FOR I=1 TO 6 : IF S(I,S1)>=0 THEN 2270
 2250     IF S(I,S1)<G(I) THEN F%=I : I=6 : GOTO 2270
 2260     J=J+1
 2270   NEXT : IF F%<>0 I=F% : GOTO 2310
 2280   IF J>I THEN 2310
 2290   S(7,S1)=S(7,S1)+G9
 2300   G0=S(7,S1)
 2310   IF S9=15 THEN 390
 2320   J=0
 2330   FOR I=1 TO S9 : J=J+S(7,I) : NEXT
 2340   FOR E%=0 TO 1 : PRINTTAB(2,20+E%)CHR$141;CHR$133"Developmental status of galaxy"CHR$130;INT(J/S9*100/7);"%" : NEXT
 2350   PROCdelay(18)
 2360   IF J/S9<7 THEN 390
 2370   S1=S9+1 : S9=S9+1 : GOSUB 3910 : GOSUB 2410 : S(9,S1)=D1 : S(10,S1)=Y1 : FOR J=1 TO 6
 2380     S(J,S1)=0 : NEXT : GOSUB 3900
 2390   CLS : PROCback(134,132) : FOR E%=0 TO 1 : PRINTTAB(3,5+E%)CHR$141"New class <4> Star called"CHR$131;MID$(S$,S(8,S1),4) : NEXT
 2400   PROCdelay(14) : GOSUB 3980 : GOTO 390
 2410   X=(RND(1)-.5)*100:Y=50*RND(1)
 2420   IF(ABS(X)<25)AND(Y<25) THEN 2410
 2430   F=1 : GOSUB 2460
 2440   IF F=0 THEN 2410
 2450   S(7,S1)=0 : RETURN
 2460   ON H GOTO 2500,2490,2480,2470
 2470   Z=X : X=-Y : Y=Z : GOTO 2500
 2480   Y=-Y : GOTO 2500
 2490   Z=X : X=Y : Y=Z
 2500   FOR J=1 TO S1-1
 2510     IF SQR((X-S(11,J))^2+(Y-S(12,J))^2)>=D9 THEN 2540
 2520     F=0
 2530     D%=J : J=S1-1 : NEXT : J=D% : RETURN
 2540 NEXT : S(11,S1)=INT(X) : S(12,S1)=INT(Y) : H=1-(H<=3)*H : RETURN
 2550 PRINTTAB(0,23)CHR$135;CHR$157;SPC37
 2560 IF PQ=1 THEN 2580
 2570 PRINTTAB(23,23)CHR$129;"X for Options";
 2580 REM *FX15,0
 2590 PRINTTAB(2,23)CHR$136;CHR$132;"Next Star ?"; : A$=GET$
 2600 IF(SW=9)AND(A$="A") GOSUB 4920 : GOTO 2550
 2610 IF PQ=1 THEN 2630
 2620 IF A$="X" GOSUB 5730 : GOTO 2550
 2630 F%=0 : FOR I=1 TO S9:J=S(8,I)
 2640   IF LEFT$(A$,1)=MID$(S$,J,1) THEN F%=1 : D%=I : I=S9 : GOTO 2650
 2650 NEXT : IF F%=1 I=D% : GOTO 2730
 2660 GOTO 2690
 2670 GOSUB 3100 : GOTO 2710
 2680 S2=S1 : GOSUB 3980 : GOTO 2710
 2690 FOR E%=0 TO 1 : PRINTTAB(2,21+E%)CHR$141;CHR$129;"There is no system beginning with ";A$;" "; : NEXT
 2700 PROCdelay(16) : PRINTTAB(2,21)SPC37;TAB(2,22)SPC37
 2710 REM
 2720 GOTO 2550
 2730 T(8,T1)=I
 2740 IF I<>S1 THEN 2770
 2750 FOR E%=0 TO 1 : PRINTTAB(2,21+E%)CHR$129;CHR$141"Choose a different system to visit  " : NEXT
 2760 GOTO 2710
 2770 D2=SQR((S(11,S1)-S(11,I))^2+(S(12,S1)-S(12,I))^2)/R9
 2780 D2=INT(D2) : WZ=0 : QM=0
 2790 S(7,S1)=S(7,S1)+.02+RND(1)/25
 2800 IF GQ=1 THEN 2900
 2810 CLS : PROCback(129,132) : IF RND(1)>Q/2 THEN 2900
 2820 ON I GOTO 2870,2850,2830 ELSE GOTO 2830
 2830 FOR E%=0 TO 1 : PRINTTAB(3,2+E%)CHR$141"Ship does not pass inspection" : NEXT
 2840 GOTO 2880
 2850 FOR E%=0TO1 : PRINTTAB(3,2+E%)CHR$141"Crewmen demand a vacation" : NEXT
 2860 GOTO 2880
 2870 FOR E%=0 TO 1 : PRINTTAB(3,2+E%)CHR$141"Local holiday soon" : NEXT
 2880 FOR E%=0 TO 1 : PRINTTAB(3,4+E%)CHR$141"..."CHR$136;I;CHR$137"week delay" : NEXT
 2890 D2=D2+7*I
 2900 T(9,T1)=T(9,T1)+D2
 2910 IF T(9,T1)<=360 THEN 2950
 2920 T(9,T1)=T(9,T1)-360
 2930 T(10,T1)=T(10,T1)+1
 2940 IF T(9,T1)>360 GOTO 2920
 2950 M=INT((T(9,T1)-1)/30)
 2960 L=3*M+1
 2970 IF GQ=1 THEN 2990
 2980 FOR E%=0 TO 1 : PRINTTAB(2,10+E%)CHR$141;CHR$130"The ETA at ";MID$(S$,J,4);" is ";MID$(C$,L,3);" ";T(9,T1)-30*M;",";T(10,T1); : NEXT
 2990 I=(INT(RND(1)*7+1)*(-(RND(1)>Q/2)))
 3000 IF I>3 THEN 2990
 3010 T(9,T1)=T(9,T1)+I*7
 3020 IF T(9,T1)<=360 THEN 3050
 3030 T(9,T1)=T(9,T1)-360
 3040 T(10,T1)=T(10,T1)+1
 3050 T(12,T1)=I : IF GQ<>1 PROCdelay(18)
 3060 RETURN
 3070 GOSUB 3900
 3080 AR=1 : CLS : PRINTTAB(0,0)CHR$157;CHR$133;H4;" ";MID$(C$,H3,3);",";"Annual Report ";Y1-2070; : GOTO 3140
 3090 RETURN
 3100 GOTO 4910
 3110 REM
 3120 REM
 3130 CLS
 3140 FOR I%=1 TO 24 : PRINTTAB(0,I%)CHR$157;CHR$132; : NEXT
 3150 PRINTTAB(1,1)CHR$145"````````k``````k``````k``````k```````"
 3160 PRINTTAB(1,2)CHR$130"Captain   Ship   Bank  Cargo   Total"
 3170 PRINTTAB(1,3)CHR$130"          '000s  '000s value   assets"
 3180 PRINTTAB(1,4)CHR$145"ppppppppzppppppzppppppzppppppzppppppp"
 3190 MAX=0 : FOR B1=1 TO P9 : GOSUB 3820 : NEXT
 3200 IF P9<5 PZ=4 : L0=5 : GOTO 3240
 3210 IF P9<6 PZ=3 : L0=5 : GOTO 3240
 3220 IF P9>9 PZ=1 : L0=5 : GOTO 3240
 3230 PZ=2 : L0=5
 3240 FOR P1=1 TO P9
 3250   M1=0 : M2=0
 3260   FOR I1=0 TO T9/P9-1
 3270     M1=M1+T(11,P9*I1+P1)
 3280     FOR K=1 TO 6
 3290       M2=M2+T(K,P9*I1+P1)*Q(K)
 3300     NEXT,
 3310     S7=(P1-1)*6+1
 3320     M3=M2+M1+B(1,P1)
 3330     IF M3>MAX MAX=M3 : WINNER=P1
 3340     PRINTTAB(2,L0)N$(P1)
 3350     @%=7 : PRINTTAB(10,L0),INT(M1/1000) : PRINTTAB(17,L0),INT(B(1,P1)/1000)
 3360     PRINTTAB(24,L0),INT(M2/1000) : @%=9 : PRINTTAB(31,L0),INT(M3):@%=2570
 3370     L0=L0+PZ
 3380   NEXT
 3390   PROCdelay(12) : PRINTTAB(1,5+(WINNER-1)*PZ)CHR$129;
 3400   IF AR=1 PRINTTAB(12,22)"Press a key" : AR=0
 3410   RETURN
 3420   R1=1-(S(7,S1)>=5)-(S(7,S1)>=10)
 3430   D2=12*(Y1-S(10,S1))+(D1-S(9,S1))/30
 3440   F%=0 : FOR I=1 TO 6
 3450     G(I)=(1+S(7,S1)/15)*(M(I,R1)*S(7,S1)+C(I,R1))
 3460     IF ABS(G(I))>.01 THEN 3480
 3470     P(I)=0 : F%=1 : I=6 : GOTO 3530
 3480     Q1=ABS(G(I)*12) : Q2=ABS(S(I,S1)+D2*G(I)) : IF Q1>Q2 Q3=Q2 : GOTO 3500
 3490     Q3=Q1
 3500     S(I,S1)=SGN(G(I))*Q3
 3510     P(I)=Q(I)*(1-SGN(S(I,S1))*ABS(S(I,S1)/(G(I)*X9)))
 3520     P(I)=100*INT(P(I)/100+.5)
 3530   NEXT:IF F%=1 THEN 3540 ELSE IF(SA$="")OR(S1<>VAL(LEFT$(SA$,1))) THEN 3560
 3540   P(VAL(MID$(SA$,2,1)))=VAL(RIGHT$(SA$,2))*100
 3550   S(VAL(MID$(SA$,2,1)),S1)=-ABS(S(VAL(MID$(SA$,2,1)),S1))
 3560   S(9,S1)=D1 : S(10,S1)=Y1 : RETURN
 3570   CLS : PROCback(135,132) : FOR E%=0 TO 1 : PRINTTAB(3,2+E%)CHR$141"Do you wish to visit" : NEXT : FOR E%=0 TO 1 : PRINTTAB(3,4+E%)CHR$141"the local bank?"; : NEXT
 3580   PROCi
 3590   IF A$="Y" THEN 3620
 3600   IF A$="N" RETURN
 3610   GOTO 3580
 3620   GOSUB 3780 : GOSUB 3820
 3630   FOR E%=0 TO 1 : PRINTTAB(2,6+E%)CHR$141;CHR$135"You have"CHR$134"`";INT(B(1,B1))CHR$135"in the bank";TAB(2,8+E%)CHR$141;CHR$135"And"CHR$134"`";T(11,T1)CHR$135"on the ship" : NEXT
 3640   IF B(1,B1)=0 THEN 3720
 3650   PRINTTAB(2,15)CHR$129"How much do you wish"TAB(2,16)CHR$129"to withdraw? - `       ";CHR$8;CHR$8;CHR$8;CHR$8;CHR$8;CHR$8;CHR$8;
 3660   INPUT""A$ : Z=VAL(A$) : IF Z<=B(1,B1) THEN 3680
 3670   PRINTTAB(17,17)CHR$129"TOO MUCH" : PROCdelay(12) : PRINTTAB(17,17)SPC10 : GOTO 3650
 3680   IF Z<=0 THEN 3720
 3690   B(1,B1)=B(1,B1)-Z
 3700   T(11,T1)=T(11,T1)+Z
 3710   RETURN
 3720   PRINTTAB(2,19)CHR$130"How much do you wish"TAB(2,20)CHR$130"to deposit? - `         ";CHR$8;CHR$8;CHR$8;CHR$8;CHR$8;CHR$8;CHR$8;CHR$8;CHR$8;
 3730   INPUT""A$ : Z=VAL(A$)
 3740   IF Z>T(11,T1) PRINTTAB(3,21)CHR$129"You only have `";T(11,T1) : PROCdelay(18) : PRINTTAB(3,21)SPC25 : GOTO 3720
 3750   T(11,T1)=T(11,T1)-Z
 3760   B(1,B1)=B(1,B1)+Z
 3770   RETURN
 3780   B1=T1 : FOR I=1TO S9/P9 : IF B1<=P9 THEN I=S9/P9 : GOTO 3800
 3790     B1=B1-P9
 3800   NEXT
 3810   RETURN
 3820   B(1,B1)=B(1,B1)*(1+.05*(Y1-B(3,B1)+(D1-B(2,B1))/360))
 3830   B(2,B1)=D1 : B(3,B1)=Y1 : RETURN
 3840   PRINTTAB(XF-1,YF)CHR$9; : A$="" : FOR W%=1 TO N%
 3850     Z$=GET$ : IF ASC(Z$)<>127 A$=A$+Z$ ELSE IF W%>1 A$=LEFT$(A$,LEN(A$)-1) : PRINTZ$; : W%=W%-1 : GOTO 3850 ELSE GOTO 3850
 3860     IF ASC(Z$)=13 W%=N%
 3870     PRINTZ$; : NEXT
 3880   X=VAL(A$)
 3890   RETURN
 3900   G$="101050531010107" : PROCMUSIC(3) : RETURN
 3910   IF S1>1 THEN 3930
 3920   I=1 : GOTO 3970
 3930   I=4*INT(14*RND(1))+5
 3940   F%=0 : FOR J=2 TO S1-1
 3950     IF I=S(8,J) THEN F%=1 : J=S1-1 : GOTO 3960
 3960   NEXT : IF F%=1 GOTO 3930
 3970   S(8,S1)=I : RETURN
 3980   REM
 3990   GOTO 4380
 4000   REM
 4010   IK=0 : FOR IJ=SW TO SX : IK=IK+1
 4020     IF S3=IJ THEN 4070
 4030     D2=SQR((S(11,S3)-S(11,IJ))^2+(S(12,S3)-S(12,IJ))^2)/R9
 4040     NW=INT(D2/7)
 4050     PRINTTAB(37,2*IK-1)"ns{";
 4060     PRINTTAB(36,2*IK)CHR$136;CHR$134;STR$(NW)
 4070   NEXT : RETURN
 4080   CLS : PROCback(129,135) : PRINTTAB(12,6)"CONFIRM !!! (Y/N)"
 4090   PROCi
 4100   IF A$="Y" THEN 4120
 4110   RETURN
 4120   REM *OPT1,1
 4130   VDU 28,6,24,39,14 : CLS : IF N%=FALSE T=OPENUP("P-FALL") : XX$="COMPLETE" ELSE XX$=DA$ : T=OPENOUT("P-FALL")
 4140   FOR I=0 TO 12 : FOR J=0 TO 15
 4150       IF N%=FALSE INPUT#T,S(I,J) ELSE PRINT#T,S(I,J)
 4160     NEXT,
 4170     FOR I=0 TO 12 : FOR J=0 TO 12
 4180         IF N%=FALSE INPUT#T,T(I,J) ELSE PRINT#T,T(I,J)
 4190       NEXT,
 4200       FOR I=0 TO 3 : FOR J=0 TO 12
 4210           IF N%=FALSE INPUT#T,B(I,J) ELSE PRINT#T,B(I,J)
 4220         NEXT,
 4230         FOR I=0 TO 6 : FOR J=0 TO 3
 4240             IF N%=FALSE INPUT#T,M(I,J),C(I,J) ELSE PRINT#T,M(I,J),C(I,J)
 4250           NEXT,
 4260           FOR I=0 TO 12
 4270             IF N%=FALSE INPUT#T,T$(I),N$(I) ELSE PRINT#T,T$(I),N$(I)
 4280           NEXT
 4290           FOR I=0 TO 6
 4300             IF N%=FALSE INPUT#T,P(I),Q(I),G(I) ELSE PRINT#T,P(I),Q(I),G(I)
 4310           NEXT
 4320           IF N%=FALSE INPUT#T,W,D9,K9,X9,D1,X1,P9,T9,S9,Y9,H,Y1,R9,G9,Q,S1,T1,R,H3,H4,DA$,SW,PQ,SL%,L1 ELSE PRINT#T,W,D9,K9,X9,D1,X1,P9,T9,S9,Y9,H,Y1,R9,G9,Q,S1,T1,R,H3,H4,XX$,SW,PQ,SL%,L1
 4330           CLOSE#T
 4340           PRINT'XX$ : PROCdelay(12)
 4350           VDU 26
 4360           RETURN
 4370           RETURN
 4380           REM
 4390           S3=S1
 4400           CLS : FOR L0=0 TO 20 STEP 2 : PRINTTAB(19,L0)CHR$147;CHR$32+"5":PRINTTAB(19,L0+1)CHR$147"(=" : NEXT
 4410           PRINTTAB(3,11)CHR$147",,=,,=,,=,,=,,=,,=,,=,,=,,=,,=,,=,,"
 4420           FOR S1=1 TO S9 : X%=INT(S(11,S1)/3)+18:Y%=INT(10+S(12,S1)/6):IF S(8,S1)=1 GOTO 4440 ELSE IF Y%=11 Y%=12 ELSE IF Y%=10 Y%=9
 4430             IF X%=15 THEN X%=14 ELSE IF X%=16 THEN X%=17
 4440             PRINTTAB(X%,Y%)CHR$135;MID$(S$,S(8,S1),4);
 4450             PRINTCHR$10;CHR$8;CHR$8;CHR$8;
 4460             ON INT(S(7,S1)/5+1) GOTO 4480,4490,4500,4510 ELSE GOTO 4510
 4470             GOTO 4510
 4480             PRINTCHR$145"$"CHR$147 : GOTO 4520
 4490             PRINTCHR$146"$"CHR$147 : GOTO 4520
 4500             PRINTCHR$150"$"CHR$147 : GOTO 4520
 4510             PRINTCHR$135;CHR$255;CHR$147
 4520           NEXT
 4530           S1=S3
 4540           PROCdelay(12)
 4550           RETURN
 4560           REM
 4570           L0=4 : PZ=2 : IF T9>8 PZ=1
 4580           CLS : PROCback(150,132)
 4590           PRINTTAB(13,0)"_ppppppppppppp0"TAB(12,1)"x"CHR$255;CHR$132;DA$;TAB(26,1)CHR$150;CHR$255;"t"
 4600           PRINTTAB(3,2)"7````````````7````````7```````````5"
 4610           PRINTTAB(3,3)"5   "CHR$135"SHIP   "CHR$150"5  "CHR$135"TO  "CHR$150"5  "CHR$135"ETA    "CHR$150"5"
 4620           PRINTTAB(3,4)"uppppppppppppuppppppppuppppppppppp5"
 4630           GOSUB 4800 : FOR XZ=1 TO T9 : F%=0 : FOR S7=1 TO T9
 4640               IF S7=T1 THEN 4760
 4650               IF T(0,XZ)<>T(S7,0) THEN 4760
 4660               T(S7,0)=0
 4670               S3=T(8,S7) : S4=S(8,S3) : L=(S7-1)*6+1
 4680               M7=INT((T(9,S7)-1)/30)
 4690               L7=3*M7+1
 4700               L8=T(9,S7)-30*M7
 4710               PRINTTAB(3,L0+1)CHR$135;LEFT$(T$(S7),10)
 4720               PRINTTAB(19,L0+1)MID$(S$,S4,4)
 4730               PRINTTAB(27,L0+1);L8
 4740               PRINTTAB(30,L0+1)MID$(C$,L7,3);" ";RIGHT$(STR$(T(10,S7)),2)
 4750               L0=L0+PZ : F%=1 : D%=S7 : S7=T9
 4760             NEXT : IF F%=1 S7=D%
 4770           NEXT
 4780           PRINTTAB(13,23)CHR$134;CHR$136"Press a key"
 4790           RETURN
 4800           REM
 4810           FOR XZ=1 TO T9
 4820             T(0,XZ)=(T(10,XZ)-2070)*360+T(9,XZ)
 4830             T(XZ,0)=T(0,XZ)
 4840           NEXT
 4850           FOR XZ=T9 TO 2 STEP -1
 4860             FOR XJ=1 TO XZ-1
 4870               IF T(0,XJ)<=T(0,XJ+1) THEN 4890
 4880               XX=T(0,XJ) : T(0,XJ)=T(0,XJ+1) : T(0,XJ+1)=XX
 4890             NEXT,
 4900             RETURN
 4910             REM
 4920             S3=S1 : SW=1 : SX=8
 4930             IF S9<8 SX=S9
 4940             IF S9<9 SZ=S9*2-1
 4950             IF S9>8 SZ=15
 4960             CLS : PRINT"SYSTEM"+CHR$145+"jURANjIRONjMACHjMEDIjCOMPjGEMS"
 4970             IF SW=9 SZ=2*S9-17
 4980             FOR L0=1 TO SZ STEP2:PRINTTAB(0,L0)CHR$145+",,,,,,n,,,,n,,,,n,,,,n,,,,n,,,,n,,,,":PRINTTAB(0,L0+1)"      "+CHR$145+"j   "+CHR$145+"j   "+CHR$145+"j   "+CHR$145+"j   "+CHR$145+"j   "+CHR$145+"j   " : NEXT
 4990             FOR S1=SW TO SX : IF WZ=0 THEN P$(S1)=""
 5000               IF SW=1 SP=S1
 5010               IF SW=9 SP=S1-8
 5020               SC=INT(S(7,S1)/5) : IF SC>3 SC=3
 5030               PRINTTAB(0,SP*2)MID$(S$,S(8,S1),4);TAB(4,SP*2)CHR$133;MID$(D$(SC),2,1);CHR$145;
 5040               IF S3=S1 THEN 5150
 5050               IF WZ=1 THEN 5140
 5060               GOSUB 3420
 5070               FOR I=1 TO 6
 5080                 W$=STR$(P(I)/100)
 5090                 IF(S(I,S1)=0)OR(P(I)<1000) W$="    "
 5100                 IF S(I,S1)>0 W$=CHR$131+W$+CHR$145
 5110                 IF S(I,S1)<0 W$=CHR$130+W$+CHR$145
 5120                 P$(S1)=P$(S1)+"j"+W$
 5130               NEXT
 5140               PRINTP$(S1)
 5150             NEXT : PRINTTAB(0,17)CHR$135;CHR$157;TAB(25,17)CHR$156;TAB(36,17)CHR$145;"7c{"
 5160             PRINTTAB(0,18)CHR$135;CHR$157;CHR$146;CHR$255;CHR$255;CHR$132;"buying";CHR$147;CHR$255;CHR$255;CHR$132;"selling  ";CHR$156;TAB(29,18);CHR$134;"Weeks";CHR$145;"7az"
 5170             PRINTTAB(0,19)CHR$135;CHR$157;TAB(25,19)CHR$156;CHR$145;"   wsssssqz" : GOSUB 4000
 5180             GOSUB 5250
 5190             IF SW=9 PRINTTAB(22,22)CHR$129;"'A' to turn page"
 5200             IF(S9>8)AND(S1=9) WZ=QM : GOTO 5220
 5210             S1=S3 : FL=0:QM=1:WZ=1 : RETURN
 5220             PRINTTAB(2,22)CHR$130;"Press a key for the other prices"
 5230             PROCi
 5240             SW=9 : SX=S9 : GOTO 4960
 5250             PRINTTAB(0,20)CHR$135;CHR$157;CHR$132;"CARGO"
 5260             FOR L0=1 TO 6 : IF T(L0,T1)<.000001 THEN ZZ%=1 ELSE ZZ%=0
 5270               PRINTTAB(L0*5+4+ZZ%,20)STR$(T(L0,T1)) : NEXT
 5280             PRINTTAB(0,21)CHR$135;CHR$157;CHR$130;"CASH `";T(11,T1);TAB(0,22)CHR$135;CHR$157;TAB(0,23)CHR$135;CHR$157;TAB(0,24)CHR$135;CHR$157;
 5290             WZ=1 : RETURN
 5300             REM
 5310             CLS : PRINTCHR$146;CHR$157;CHR$135:PRINTTAB(0,2)CHR$146;CHR$157;CHR$135
 5320             PROCtime
 5330             DA$=STR$(D1-30*M)+" "+MID$(C$,L,3)+" "+STR$(Y1)
 5340             PRINT" ";DA$;" "CHR$132;
 5350             J0=T1
 5360             IF J0>P9 J0=J0-P9 : GOTO 5360
 5370             N1$=N$(J0)
 5380             PRINTTAB(31-INT(LEN(N1$)/2),1)N1$
 5390             A$=N1$ : GOSUB 6690
 5400             RETURN
 5410             REM
 5420             PRINTTAB(0,3)CHR$130;CHR$157;CHR$151"7````````````k  "CHR$156:PRINTTAB(0,6)CHR$130;CHR$157;CHR$151"uppppppppppppz  "CHR$156
 5430             PRINTTAB(0,4)CHR$130;CHR$157;CHR$151"5"CHR$132;T$(T1);TAB(15,4)CHR$151;"j  "CHR$156
 5440             PRINTTAB(0,5)CHR$130;CHR$157;CHR$151"5"CHR$132"on "MID$(S$,M,4);TAB(15,5);CHR$151"j  "CHR$156
 5450             PRINTTAB(0,7)CHR$130;CHR$157" ////////////////"CHR$156
 5460             QM=0
 5470             PRINTTAB(21,5)CHR$150;"p8,,,,,,,,,,,,,,dp":PRINTTAB(21,6)CHR$150;CHR$255"}0"CHR$133"SHIP'S LOG"CHR$150"_~"CHR$255:PRINTTAB(21,7)CHR$150;CHR$255;CHR$255;CHR$255"||||||||||||"CHR$255;CHR$255;CHR$255
 5480             FOR YY=8 TO 20 : PRINTTAB(21,YY)CHR$151+"5" : PRINTTAB(39,YY)"j" : NEXT
 5490             PRINTTAB(22,11)"=,l,,,,l,,,,l,,,,n"TAB(22,14)"5 j,,,,n,,,,n,,,,n"TAB(22,17)"=,.,,,,.,,,,.,,,,n"TAB(22,20)"uppppppppppppppppz"
 5500             PRINTTAB(23,12)"CjURANjIRONjMACH"
 5510             PRINTTAB(23,13)"Aj"+CHR$131+"  "+CHR$151+"j"+CHR$131+"  "+CHR$151+"j"+CHR$131+"  "+CHR$151
 5520             PRINTTAB(23,14)"R"
 5530             PRINTTAB(23,15)"GjMEDIjCOMPjGEMS"
 5540             PRINTTAB(23,16)"Oj"+CHR$131+"  "+CHR$151+"j"+CHR$131+"  "+CHR$151+"j"+CHR$131+"  "+CHR$151
 5550             PRINTTAB(23,18)CHR$130;"Cash:         ";CHR$151
 5560             PRINTTAB(23,19)CHR$130;"Bank:         ";CHR$151
 5570             RETURN
 5580             REM
 5590             PRINTTAB(0,8)CHR$147"<,,,,,,,,,,,,,,,,,,l":FOR ZZ=10 TO 18 STEP 2 : PRINTTAB(0,ZZ)CHR$147"=,,,,,,,,,,,,,,,,,,n"; : PRINTTAB(0,ZZ+1);CHR$147+"5"+CHR$135;
 5600               PRINTTAB(19,ZZ+1);CHR$147+"j" : NEXT
 5610             PRINTTAB(0,20)CHR$147"uppppppppppppppppppz"
 5620             PRINTTAB(0,9);CHR$147+"5"+CHR$135;SPC16;CHR$147+"j"
 5630             RETURN
 5640             REM
 5650             PRINTTAB(30,18)SPC8
 5660             PRINTTAB(30,19)SPC8
 5670             GOSUB 3780
 5680             GOSUB 3820
 5690             PRINTTAB(30,18);T(11,T1)
 5700             PRINTTAB(30,19);INT(B(1,B1))
 5710             RETURN
 5720             PRINTTAB(21+5*(I1+(I1>3)*3),13-(I1>3)*3)AZ$ : RETURN
 5730             G$="1490110502" : PROCMUSIC(2)
 5740             CLS : PROCback(131,132) : PRINTTAB(17,1)"OPTIONS"
 5750             GOSUB 6580
 5760             PRINTTAB(17,2)"_______"
 5770             PRINTTAB(10,6)"N. New Game    "
 5780             PRINTTAB(10,8)"R. Recover old game"
 5790             PRINTTAB(10,10)"S. Save present game"
 5800             PRINTTAB(10,12)"P. Prices of commodities"
 5810             PRINTTAB(10,14)"T. Travel printout"
 5820             PRINTTAB(10,16)"M. Map of Star Systems"
 5830             PRINTTAB(10,18)"B. Bank statement"
 5840             PRINTTAB(10,20)"X. Option selection"
 5850             PRINTTAB(10,22)"!. End Game"
 5860             PROCi
 5870             IF A$="P" THEN 4910
 5880             IF A$="M" THEN 4380
 5890             IF A$="S" N%=TRUE : R=1 : GOTO 4080
 5900             IF A$="T" THEN 4560
 5910             IF A$="N" THEN 5960
 5920             IF A$="B" THEN 3110
 5930             IF A$="R" R=1:GQ=0 : N%=FALSE : GOTO 4080
 5940             IF A$="!" THEN 540
 5950             GOTO 5860
 5960             REM
 5970             CLS : PROCback(129,135) : FOR E%=0 TO 1 : PRINTTAB(3,5+E%)CHR$141"Do you really want" : PRINTTAB(3,8+E%)CHR$141"to start a new game?" : NEXT
 5980             PROCi
 5990             IF A$="Y" THEN 6010
 6000             GOTO 5730
 6010             FOR E%=0 TO 1 : PRINTTAB(7,18+E%)CHR$141;CHR$130"OK!! OK!! OK!!" : NEXT
 6020             RESTORE : FOR XX=1 TO 16 : READ A$ : NEXT
 6030             R9=2/7 : D9=15 : S9=8 : X3=2 : Q=.1 : GQ=1
 6040             FOR XX=0 TO 12 : FOR YY=0 TO 12 : T(XX,YY)=0 : NEXT,
 6050               FOR XX=0 TO 3 : FOR YY=0 TO 12 : B(XX,YY)=0 : NEXT,
 6060                 FOR XX=0 TO 12 : FOR YY=0 TO 15 : S(XX,YY)=0 : NEXT,
 6070                   K9=3 : W=30 : X9=36 : G9=1.25 : R=0:D1=1 : Y1=2070 : DA$=" 1 JAN 2070"
 6080                   RESTORE 6670
 6090                   FOR XX=1 TO 6 : FOR YY=1 TO 3 : READ M(XX,YY) : NEXT,
 6100                     FOR XX=1 TO 6 : FOR YY=1 TO 3 : READ C(XX,YY) : NEXT,
 6110                       CLS : PROCback(135,130)
 6120                       INPUTTAB(3,6)"How many players",A$
 6130                       P9=VAL(A$)
 6140                       IF (P9>1)AND(P9<13) THEN 6150 ELSE PRINTTAB(3,6)"Between 2 and 12 can play" : PROCdelay(8) : PRINTTAB(3,6)SPC30 : GOTO 6120
 6150                       INPUTTAB(3,9)"How many ships per player",A$
 6160                       X=VAL(A$)
 6170                       T9=P9*X : X3=X : IF X<1 THEN PRINTTAB(3,9)SPC30 : GOTO 6150
 6180                       IF T9>12 PRINTTAB(3,9)"I can't look after a total of more ";TAB(3,10)"than 12 ships" : PROCdelay(12) : PRINTTAB(3,9)SPC36;TAB(3,10)SPC36 : GOTO 6150
 6190                       INPUTTAB(3,12)"How many star systems",A$
 6200                       S9=VAL(A$) : IF(S9<1)OR(S9>15) PRINTTAB(3,12)"Between 1 and 15 systems please" : PROCdelay(12) : PRINTTAB(3,12)SPC36 : GOTO 6190
 6210                       INPUTTAB(3,15)"Enter length of game in years",A$
 6220                       Y9=VAL(A$) : IF Y9<1 OR Y9>99 PRINTTAB(3,15)SPC36 : GOTO 6210
 6230                       PRINTTAB(1,18)CHR$136"SOUND LEVEL :_ 0(silent) to 5(loud)? "CHR$8; : SL%=GET : PRINTCHR$SL%; : SL%=SL%-48 : IF SL%<0 OR SL%>5 THEN 6230
 6240                       PRINTTAB(3,2)CHR$131TAB(3,20)CHR$131TAB(2,18)CHR$131"It takes a few moments"TAB(2,19)CHR$131"to build the Universe ......"
 6250                       Y9=Y9+Y1
 6260                       S(7,1)=15 : H=1 : S1=2 : GOSUB 2410
 6270                       S1=3 : GOSUB 2410 : S1=4 : GOSUB 6500
 6280                       FOR S1=5 TO S9 : ON S1-3*INT((S1-1)/3) GOSUB 2410,6500,6510
 6290                       NEXT : FOR S1=1 TO S9 : FOR J=1 TO 6 : S(J,S1)=0 : NEXT : IF S1>1 THEN 6310
 6300                         I=1 : GOTO 6340
 6310                         I=4*INT(14*RND(1))+5
 6320                         F%=0 : FOR J=2 TO S1-1 : IF I=S(8,J) THEN F%=1 : J=S1-1
 6330                         NEXT : IF F%=1 GOTO 6310
 6340                         S(8,S1)=I : S(9,S1)=270 : S(10,S1)=Y1-1 : NEXT
 6350                       REM *FX15,0
 6360                       CLS : PROCback(132,131) : PRINTTAB(3,6)CHR$141"Captains _ enter your names";TAB(3,7)CHR$141"Captains _ enter your names"
 6370                       FOR I=1 TO P9
 6380                         PRINTTAB(3,9+I)" Captain ";I;".... "; : INPUT A$ : IF LEN(A$)>8 PRINTTAB(3,9+I)CHR$129"MAXIMUM OF 8 LETTERS PLEASE        "; : PROCdelay(12) : PRINTTAB(3,9+I)SPC35; : GOTO 6380 ELSE PRINT
 6390                         N$(I)=A$ : NEXT
 6400                       T1=1
 6410                       CLS : PROCback(132,131) : PRINTTAB(3,6)CHR$141"Captains name your ships:_";TAB(3,7)CHR$141"Captains name your ships:_"
 6420                       PRINTTAB(3,9)"CAPTAIN";TAB(15,9)"NAME OF SHIP" : VDU 28,3,23,39,10
 6430                       FOR I=1 TO T9/P9 : PRINT : FOR P1=1 TO P9
 6440                           T(1,T1)=0 : T(2,T1)=0 : T(6,T1)=0 : T(3,T1)=15 : T(4,T1)=10 : T(5,T1)=10
 6450                           T(7,T1)=25 : T(8,T1)=1 : T(9,T1)=D1 : T(10,T1)=Y1 : T(11,T1)=5000 : T(12,T1)=0
 6460                           PRINTN$(P1);TAB(12)"No.";I;" "; : INPUT A$
 6470                           IF LEN(A$)>10 THEN PRINTCHR$11;CHR$129"MAXIMUM OF 10 LETTERS PLEASE       "; : PROCdelay(12) : PRINTCHR$13;SPC35;CHR$13; : GOTO 6460 ELSE PRINT
 6480                           T$(T1)=A$ : T1=T1+1 : NEXT, : VDU 26
 6490                         FOR B1=1 TO P9 : B(1,B1)=0 : B(2,B1)=D1 : B(3,B1)=Y1 : NEXT : GOTO 240
 6500                         E=100 : GOSUB 6520 : S(7,S1)=5+RND(1)*5 : RETURN
 6510                         E=50 : GOSUB 6520 : S(7,S1)=10+RND(1)*5 : RETURN
 6520                         X=(RND(1)-.5)*E : Y=RND(1)*E/2 : F=1 : GOSUB 2460 : IF F=0 THEN 6520
 6530                         RETURN
 6540                         REM
 6550                         A$="PRESS A KEY" : FOR XX=1 TO 11 : A1$=MID$(A$,XX,1) : PRINTTAB(0,9+XX)A1$
 6560                           G$="17701" : PROCMUSIC(1) : PRINTTAB(XX-1,10)A1$ : NEXT
 6570                         RETURN
 6580                         IF DA$="" RETURN
 6590                         PRINTTAB(3,3)DA$ : FOR XX=3 TO 2+LEN(DA$) : PRINTTAB(XX,2)"_"
 6600                           PRINTTAB(XX,4)"_" : NEXT : RETURN
 6610                         DATA<4>,<3>,<2>,<1>,Uranium,Iron Ore,Machinery,Medic Supplies
 6620                         DATA Computers,Diamond Gems
 6630                         RESTORE 6610
 6640                         FOR XX=0 TO 3 : READ D$(XX) : NEXT
 6650                         FOR XX=1 TO 6 : READ CO$(XX) : NEXT
 6660                         RETURN
 6670                         DATA -.1,-.2,-.1,0,-.1,-.1,0,.1,.1,-.1,.1,0,.1,.2,.1,.1,-.1,0,1,1.5
 6680                         DATA .5,.75,.75,.75,-.75,-.75,-.75,-.5,-1.5,.5,-1,-1.5,-.5,.5,1.5,-.5
 6690                         IF LEN(A$)<4 A$=A$+A$
 6700                         FOR XX=1 TO LEN(A$) : XC%=ASC(MID$(A$,XX,1))+100
 6710                           SOUND1,-3*SL%,XC%,5
 6720                         NEXT : RETURN
 6730                         CALL!-4
 6740                         K0=0 : CLS : PROCback(135,132) : PRINTTAB(3,8);
 6750                         XX=INT(RND(1)*S9)+1 : A$=MID$(S$,S(8,XX),4) : SA$=STR$(XX)
 6760                         IF XX>9 THEN 6750
 6770                         ON INT(RND(1)*5+1) GOTO 6780,6790,6800,6810,6820
 6780                         SA$=SA$+"175" : PRINT"NUCLEAR POWER PLANT DISASTER ON ";A$ : J0=1 : GOTO 6830
 6790                         SA$=SA$+"660" : PRINT"RAGING INFLATION ON ";A$ : J0=6 : GOTO 6830
 6800                         SA$=SA$+"275" : PRINT"NEW GALACTIC RAILWAY ON ";A$ : J0=2 : GOTO 6830
 6810                         SA$=SA$+"575" : PRINT"DEEP THOUGHT PROJECT ON ";A$ : J0=5 : GOTO 6830
 6820                         SA$=SA$+"488" : PRINT"PLAGUE ON ";A$ : J0=4
 6830                         PROCdelay(12) : PRINTTAB(2,12)CHR$134"Urgent need for "CO$(J0)
 6840                         PRINTTAB(13,23)CHR$133;CHR$136"Press a key"
 6850                         PROCi
 6860                         RETURN
 6870                         PRINTTAB(15,23)"Press a key"
 6880                         CLS : G$="149101011010110" : PROCMUSIC(3) : PROCback(135,132)
 6890                         FOR E%=0 TO 1 : PRINTTAB(13,5+E%)CHR$134;CHR$141;"Planetfall" : NEXT
 6900                         PRINTTAB(2,11)CHR$135"N _ New game";TAB(2,13)CHR$135"R _ Recover old game from sdcard";TAB(2,23)CHR$135"Press"CHR$136"N"CHR$137"or"CHR$136"R"CHR$137"to start the game";
 6910                         PROCi
 6920                         I=RND(1)
 6930                         IF A$="N" CLS : PROCback(135,129) : FOR E%=0 TO 1 : PRINTTAB(15,11+E%)CHR$141"NEW GAME" : NEXT : G$="0971010510089100411006920" : PROCMUSIC(5) : GOTO 6020
 6940                         IF A$="R" R=1 : GQ=0 : N%=FALSE : CLS : G$="13710" : PROCMUSIC(1) : PROCback(129,135) : PRINTTAB(3,10)"Ensure you have the tape in ..." : PROCdelay(12) : PRINTTAB(3,12)"and that it's rewound!"' : GOSUB 4120 : GOTO 240
 6950                         GOTO 6920
 6960                         REM
 6970                         DEF FNZ(X)=(FNY(X)*.5-(FNT(X))*X)/(2*ABS(S(I1,S1)))/K1
 6980                         DEF FNY(X)=-(X>=ABS(S(I1,S1)))
 6990                         DEF FNT(X)=-(X<ABS(S(I1,S1)))
 7000                         :
 7010                         DEF PROCMUSIC(G%)
 7020                         L%=-3*SL%
 7030                         FOR Z%=0 TO G%-1
 7040                           y$=MID$(G$,Z%*5+1,3)
 7050                           z$=MID$(G$,Z%*5+4,2)
 7060                           y%=VAL(y$)
 7070                           z%=VAL(z$)
 7080                           SOUND1,L%,y%,z%
 7090                           SOUND2,L%,y%-12,z%
 7100                           SOUND3,L%,y%-28,z%
 7110                         NEXT
 7120                         ENDPROC
 7130                         :
 7140                         DEF PROCback(F%,B%)
 7150                         FOR I%=0 TO 24 : PRINTTAB(0,I%)CHR$B%;CHR$157;CHR$F%; : NEXT
 7160                         ENDPROC
 7170                         :
 7180                         DEF PROCtime
 7190                         S%=(TIME DIV 100)MOD 60
 7200                         M%=(TIME DIV 6000)MOD 60
 7210                         H%=(TIME DIV 360000)MOD 24
 7220                         h$=STR$(H%) : IF h$="0" THEN h$="00" ELSE IF H%<10 THEN h$="0"+h$
 7230                         m$=STR$(M%) : IF m$="0" THEN m$="00" ELSE IF M%<10 THEN m$="0"+m$
 7240                         s$=STR$(S%) : IF s$="0" THEN s$="00" ELSE IF S%<10 THEN s$="0"+s$
 7250                         PRINTTAB(0,1)CHR$146;CHR$157;CHR$135;h$;":";m$;":";s$;CHR$131;
 7260                         ENDPROC
 7270                         :
 7280                         DEF PROCi
 7290                         REM *FX15,0
 7300                         INPUT A$ : REM =GET$
 7310                         ENDPROC
 7320                         :
 7330                         DEF PROCdelay(I%)
 7340                         FOR J%=0 TO I%*1000 : NEXT
 7350                         ENDPROC
 7360                         REM
 7370                         RUN
