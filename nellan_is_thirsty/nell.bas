     10 MODE7:FOR I%=0 TO 1:PRINTTAB(10,3+I%)CHR$141"NELLAN IS THIRSTY":NEXT:PRINT''TAB(5)CHR$134"Written by Dr Furman H Smith"'TAB(2)CHR$134"Published in Recreational Computing"'TAB(11)CHR$134"magazine in 1980"
    20 PRINT''TAB(7)"""ported shortly thereafter"'" to the Commodore 64"" by Steven Darnold"'''CHR$134" Ported to BBC BASIC for the BBC Micro"'TAB(10)CHR$134"by lurkio in 2020"
    30 PRINT''TAB(7)"Ported to the Agon Light"'TAB(7)"by Steve Lovejoy in 2024" TAB(39,22);:PROCd(30)
   100 L%=39:a$=STRING$(30," "):DIM S% 255
   105 GOSUB705:GOSUB1010:GOSUB745
   110 INPUT"Are you the only person playing? "a$
   115 p=1:a$=LEFT$(a$,1):IFa$="Y"THENp9=1:GOTO140
   120 IFa$<>"N"THENPRINT"Please type YES or NO":GOTO110
   130 INPUT"How many of you will be playing? "a$:p9=VAL(a$)
   135 IFp9<1THENPRINT"Oh, come on.":GOTO130
   140 IFp9>5THENPRINT"Sorry, that is too many.":GOTO130
   145 DIM p$(p9):i=1:INPUTLINE"What is your name? "p$(p):p$(p)=FNt(p$(p)):GOTO150
   150 IFi=p9 THEN165 ELSE i=i+1
   155 PROCp("Please give me the name of the next player.")
   160 INPUTp$(i):GOTO150
   165 IFp9=1 THENt2=t9 ELSE t2=4
   205 PROCrc(r):PRINT
   210 w4(r)=1:i=1+INT((r-1)/r8):j=r-r8*(i-1)
   215 ONi GOSUB220,225,230:GOTO235
   220 ONj GOTO2010,2020,2030
   225 ONj GOTO2040,2050,2060
   230 ONj GOTO2070,2080,2090
   235 FORm=1TOm9
   240 IFl(m)=r THENGOSUB265
   245 NEXTm
   250 IFRND(1)>t*(2-w4(1)-w4(3))/(7*t9)THEN260
   256 PROCb:PROCp("A voice says, <<Type HELP if you need help.>>")
   260 GOTO305
   265 i=1+INT((m-1)/8):j=m-8*(i-1):PROCb
   270 ONi GOTO275,280,285,290
   275 ONj GOTO2410,2420,2430,2440,2450,2460,2470,2480
   280 ONj GOTO2490,2500,2510,2520,2530,2540,2550,2560
   285 ONj GOTO2570,2580,2590,2600,2610,2620,2630,2640
   290 ONj GOTO2650
   305 PROCb:PRINT"* ";:q$=q$(1+q9*RND(1))
   310 IFRND(1)>.5THENq$=q$+", "+p$(p)
   315 q$=q$+"?":PROCp(q$):VDU23,1,1;0;0;0;:INPUT"* "a$:VDU23,1,0;0;0;0;:a$=FNt(a$):i9=LEN(a$):PRINT
   320 IF i9=0 THEN305
   325 FORi=1TOi9:IFMID$(a$,i,1)<>" "THENNEXT
   330 v$=LEFT$(a$,i-1):IFi=i9+1THENn$=v$:GOTO345 ELSEix=i:i=i9:NEXT:i=ix
   335 FOR j=i9 TO i STEP-1:IFMID$(a$,j,1)<>" "THENNEXT
   340 n$=RIGHT$(a$,i9-j):jx=j:j=i:NEXT:j=jx
   345 v=0:n=0
   350 FORi=1TOv9:IFv$(i)=v$THENv=i:i=v9:NEXT ELSENEXT
   355 FORi=1TOn9:IFn$(i)=n$THENn=i:i=n9:NEXT:i=n ELSENEXT
   357 IF 0<n AND n<9 THEN405
   360 IFv*n>0OR(v+n>0ANDv$=n$)THEN380 ELSE3505
   365 PROCp("I don't understand "+a$+".")
   370 PRINT"Type LIST WORDS to see a list of"
   375 PRINT"some of the words that I understand.":GOTO 305
   380 IFn<29THEN405 ELSEIFn=29THENn=11 ELSEn=n-7
   405 IFn>4ANDn<9THENn=n-4
   410 IF n>4 OR n=0 THEN435 ELSE ON n GOTO412,416,420,424
   412 w1(r)=ABS(w1(r)):IFw1(r)=1THEN430
   414 IFw1(r)=2THENr=r-r8:GOTO605ELSE505
   416 w1(r+r8)=ABS(w1(r+r8)):IFw1(r+r8)=1THEN430
   418 IFw1(r+r8)=2THENr=r+r8:GOTO605 ELSE505
   420 w2(r+1)=ABS(w2(r+1)):IFw2(r+1)=1THEN430
   422 IFw2(r+1)=2THENr=r+1:GOTO605 ELSE505
   424 w2(r)=ABS(w2(r)):IFw2(r)=1THEN430
   426 IFw2(r)=2THENr=r-1:GOTO605 ELSE505
   430 PRINT"You can't walk through walls.":GOTO305
   435 IFn<>12ANDn<>22THENGOSUB4015ELSEGOSUB4030
   440 IF(v<=4ORv=13)ANDn=22THEN5410
   442 IFn=28ANDv<9 GOTO480
   445 IFm<>0ORv=0ORv>8THEN455
   450 PROCp("That's not possible now, "+p$(p)+"."):GOTO305
   455 IFm=0ORv=15ORn=9THEN505
   460 IF 4<v AND v<9 THEN475
   465 IFl(m)>-1ANDl(m)<>r THEN470 ELSE475
   470 PROCp("It seems that the "+n$+" isn't here."):GOTO305
   475 IFv>8THEN505 ELSEIFv<5THENv=1 ELSEv=5
   480 IFn=28THENPRINT"The WATCH stays on your wrist.":GOTO305
   485 IFn=10ORn=23ORn=24THEN5980
   490 ON(v+3)/4GOSUB4045,4100
   495 GOTO235
   505 IFn<=8ANDn>0THEN5015
   510 IFn=26ORn=27THENON(n-25)GOSUB5105,5155:GOTO305
   512 IFv=0THEN365
   515 IFv<=14THENj=v-8:GOTO520 ELSEj=v-14:GOTO525
   520 ONj GOTO5205,5255,5355,5355,5405,5605
   525 ONj GOTO5705,5755,5780,5805,5980,210
   605 t=t+1:t1=t1+1
   610 IF t>t9 THEN GOSUB5155 ELSE625
   615 PROCb:PROCp("Time is up _ the "+STR$t9+" scoots have passed."):VDU7
   620 PROCb:PRINT"If you want to play again, push RETURN.":PROCd(0):RUN
   625 IFw1(r)=-1THENw1(r)=1
   630 IFw1(r+r8)=-1THENw1(r+r8)=1
   635 IFw2(r)=-1THENw2(r)=1
   640 IFw2(r+1)=-1THENw2(r+1)=1
   645 IF t1<=t2 THEN205 ELSE t1=0:IF p<p9 THEN p=p+1 ELSE p=1
   650 PROCp(" # It's "+p$(p)+"'s turn now."):PROCb:GOTO210
   705 PROCrc(2):PRINT
   710 PROCp("Let's pretend that you are in an enchanted house. You should use one or two words to tell me what you want to do. I'll suggest messages at first. If you have a question while you're inside the house, type HELP.")
   735 RETURN
   745 PROCb:PROCp("When you have read all this, please push the button that says RETURN (or ENTER).")
   755 PROCb:PROCd(30):RETURN
  1010 :
  1015 r6=1:r7=3:r8=3:r9=r6*r7*r8:r0=r9-r8+1:r=r0
  1020 v9=20:n9=31:m9=25
  1025 DIMv$(v9),n$(n9),l(m9),n1(m9),w(m9),w4(r9),w4$(r9)
  1030 DIMw1((r6*r7+1)*r8),w2(r9+1),w1$(3),w2$(3),w3$(9)
  1035 t=0:t1=0:t9=72:c=0:c9=4
  1040 i=RND(-TIME)
  1045 q9=4:b9=4:DIMq$(q9),b$(b9)
  1110 FORi=1TOv9:READv$(i):NEXT
  1115 DATA TAKE,GET,GRAB,PICK,DROP,GIVE,OFFER,DEPOSIT,KICK,CONSULT,OPEN,UNLOCK
  1125 DATA FILL,LIST,WORTH,SIT,DRINK,HELP,GO,RELOOK
  1210 FORi=1TOn9:READn$(i):NEXT
  1215 DATA N,S,E,W,NORTH,SOUTH,EAST,WEST,DOOR,CHAIR,RABBIT,BOWL,COUPON,WRAPPER,MAP
  1225 DATA KEY,EGG,COIN,JEWEL,CATALOG,VASE,MILK,BANKER,CAT,WORDS
  1230 DATA INVENTORY,SCORE,WATCH,CHULA,KLINKOYN,NELLAN
  1320 FORj=1TO9:w3$(j)=STRING$(3,CHR$255):NEXT
  1420 FORi=0TO3:READw1$(i),w2$(i):NEXT:PROCw
  1430 DATA"##($($##",", ,"
  1440 DATA"########","###"
  1450 DATA"##    ##"," ` "
  1460 DATA"##-*%.##","%,h"
  1510 FORi=0TO9:READw4$(i):w4(i)=0:NEXT
  1515 DATA"  ??  "
  1520 DATA"Office"," Milk "," Store"
  1525 DATA"White "," Gold ","  Hot "
  1530 DATA" Bank "," Green","  Cat "
  1610 FORi=1TO(r6*r7+1)*r8:READw1(i):NEXT
  1615 DATA1,1,1
  1620 DATA-2.5,-2,-1
  1625 DATA-2,-1,-2
  1630 DATA1,1,1
  1710 FORi=1TOr9+1:READw2(i):NEXT
  1715 DATA1,-1,-2.5
  1720 DATA1,-2,-2
  1725 DATA1,1,-2,1
  1810 FORm=1TOm9:READl(m),n1(m):w(m)=0:NEXT
  1815 DATA1,20,6,13,0,12,0,12,0,12,2,9,3,0,0,0,7,23
  1820 DATA1,16,9,24,0,24,0,24,0,24,0,11,0,11,0,11,4,11
  1825 DATA7,15,2,14,1,0,8,18,0,17,3,19,0,21
  1830 FORi=22TO25:w(i)=25:NEXT
  1910 FORi=1TOq9:READq$(i):NEXT
  1915 DATA"What are you going to do now","What now"
  1920 DATA"What do you choose to do","What is your decision"
  1925 FORi=1TOb9:READb$(i):NEXT
  1930 DATAhappy,"glad to see you",busy,sleepy
  1995 RETURN
  2010 PROCp("Well, "+p$(p)+", you are in the Office.")
  2011 PROCp(" You are standing next to a CHAIR which is next to a desk in a room with yellow walls and brown carpet.")
  2015 PROCp(" There is a door in the south wall."):RETURN
  2020 PROCp("This is the Milk Room. If you have a BOWL, you can say FILL BOWL or GET MILK and have your BOWL filled with nice cold MILK. There are doorways to the south and east.")
  2024 IFl(15)=-1ANDl(6)=2 THENl(18)=0:l(17)=2
  2025 RETURN
  2030 PRINT"You are in the Store.":RETURN
  2040 PROCp("Now you are in the White Room _ the walls are white. There is a wall to the west. You know that the Bank is through the south doorway. There's a door to the north and a doorway to the east.")
  2044 RETURN
  2050 PROCp("All the walls in this room are painted gold. There are exits to the north, east, and west.")
  2053 IFl(15)=-1ANDl(23)=0THEN2054 ELSE RETURN
  2054 l(15)=0:l(16)=5:l(23)=5:RETURN
  2060 PROCp("Oh, it's hot in here! You are in the Hot Room and if cold MILK were in this room, it would be warmed.")
  2062 PRINT" The MAP shows the doorways."
  2063 IFl(4)=-1THENl(4)=0:l(5)=-1:RETURN ELSE RETURN
  2070 PRINT"You are in a room called the Bank."'
  2071 PROCp("A giant carpet on the floor says, <<Welcome "+p$(p)+">>."):PROCb
  2073 PROCp("A screen says that your visit will last for "+STR$t9+" scoots. "+STR$t+" scoots have passed."):PROCb
  2075 PRINT"To leave this room, type GO NORTH.":RETURN
  2080 PROCp("You are standing in a room with green walls. A green CHAIR is in the corner.")
  2083 IFw1(4)<0THENRETURN ELSE PROCb:PRINT"A sign here says:"'
  2084 PRINTTAB(2)STRING$(25,CHR$95)
  2085 PRINTTAB(2)"|"TAB(9)"Magic works"TAB(26)"|"
  2086 PRINTTAB(2)"|"TAB(11)"in the"TAB(26)"|"
  2087 PRINTTAB(2)"|"TAB(7)"Enchanted House"TAB(26)"|"
  2088 PRINTTAB(2)STRING$(25,CHR$95)':RETURN
  2090 PROCp("You are in the room where "+n$(31)+" lives; this room is called the Cat Room.")
  2091 RETURN
  2410 PROCp("There is a college CATALOG from the University of Houston Victoria Campus here.")
  2411 RETURN
  2420 PROCp("On the floor is a COUPON. According to what is written on the COUPON, if it is DROPped in the Store while the machine is working, you will receive one blue BOWL.")
  2423 RETURN
  2430 PRINT"There is a clean empty blue BOWL here.":RETURN
  2440 PRINT"The BOWL of cold MILK is here.":RETURN
  2450 PRINT"There is a blue BOWL with warm MILK.":RETURN
  2460 RETURN
  2470 PROCp("In a corner of the room is a machine which announces that if you DEPOSIT (or DROP) a COUPON and the machine is working, you will receive whatever the coupon is good for."):PROCj
  2473 PROCp(" If the machine doesn't work, you are invited to call the repairperson.")
  2476 RETURN
  2480 PRINT"The machine in the corner has a"
  2481 PRINT"flashing display announcing:"
  2482 PRINT"<<out of BOWLs>>.":RETURN
  2490 PROCp("The BANKER, Mr."+n$(30)+", looks "+b$(1+b9*RND(1))+".")
  2492 IFl(23)=r0 THENPRINT"Type SCORE to check your score."
  2494 RETURN
  2500 PRINT"There is an old brass KEY here.":RETURN
  2510 PROCp(n$(31)+" the CAT is here. She pretty much fills up the room; she's as large as an elephant _ no kidding."):PROCp(" In a soft polite voice she says,"):PROCj
  2512 PROCp(" <<I'd love to have some nice cold MILK. Many of my friends have tried to deliver cold MILK here and many have failed. Perhaps you, "+p$(p)+", would be kind enough to try. I must warn you: It will not be easy.>>")
  2517 RETURN
  2520 PROCp(n$(31)+" purrs and says, <<Thank you, "+p$(p)+", for OFFERing me this good MILK.>>")
  2523 PROCp(" She doesn't mention that it was warm.")
  2525 l(5)=0:l(3)=9:l(12)=0:l(11)=9:RETURN
  2530 PROCp("Wow! "+n$(31)+" can sure be loud when she purrs.")
  2531 PROCp(" She looks at you and says, <<"+p$(p)+", you've made me so happy. I know that it wasn't easy to get this BOWL of cold MILK to me. You did it!")
  2534 l(4)=0:l(3)=9:l(13)=0:l(14)=9:IFl(25)<>0THEN2537
  2535 PROCj:PROCp(" Please accept this small present.>> She offers you a small "+n$(21)+".")
  2536 l(25)=9
  2537 RETURN
  2540 PROCp(n$(31)+" is napping. She's quite happy."):RETURN
  2550 PROCp(n$(29)+" the white RABBIT is here and she says, <<Well, my friend "+p$(p)+", I hope that you are enjoying your adventure.>>")
  2552 RETURN
  2560 PROCp(n$(29)+" hops out of your arms and scurries off. She returns and says, <<Please TAKE this golden EGG that I hid here in the Gold Room.>>")
  2563 l(23)=5:l(15)=5:l(16)=0:c=c-1:RETURN
  2570 PROCb:PROCp(n$(29)+" hops down and gobbles a growth of carrots that was blocking the east doorway. She smiles and says, <<Thanks, friend "+p$(p)+".>>")
  2574 l(17)=0:l(15)=2:l(6)=0:c=c-1:RETURN
  2580 PROCp("A white RABBIT is here. She hops to you and says, <<I am "+n$(29)+". Welcome to the Enchanted House, my friend, "+p$(p)+".>>")
  2583 PROCp(" She hugs you and says, <<I have a present saved for you in the room to the east of here. If you say TAKE RABBIT (or TAKE "+n$(29)+") and next say GO EAST (or E or EAST), you can carry me to the Gold Room.>>")
  2587 l(18)=0:l(15)=4:RETURN
  2590 PROCp("There is a magic MAP here. If you GET the MAP, you may CONSULT the MAP.")
  2591 RETURN
  2600 PRINT"An old gum wrapper is on the floor.":RETURN
  2610 PROCp("A voice says, <<Furman Smith's July 1980 Recreational Computing article helps programmers remodel this Enchanted House.>>")
  2612 RETURN
  2620 PRINT"A heavy COIN is here.":RETURN
  2630 PRINT"A golden EGG is on the floor.":RETURN
  2640 PRINT"On the floor is a JEWEL.":RETURN
  2650 PRINT"A magnificent VASE is here.":RETURN
  3505 IFa$="extend time"THENt9=t9+24:n=28:GOTO5315
  3995 GOTO365
  4015 IFv=0ORn=0THENm=0:RETURN
  4020 IFn<>24 ELSE IFl(11)=9 THENm=11:RETURN ELSEm=14:RETURN
  4025 FORi=1TOm9:IFn1(i)=n THENm=i:i=m9:NEXT:i=m:RETURN ELSE NEXT
  4030 m=0:IFn<>22ANDn<>12THENRETURN
  4035 FORj=3TO5:IFl(j)<>0THENm=j:NEXT ELSE NEXT
  4040 RETURN
  4045 IFl(m)=r ANDc<c9 THEN4075 ELSE IFc>=c9 THEN4055
  4050 PROCp("You've still got the "+n$+"."):GOTO4140
  4055 PROCp("You can only carry "+STR$c9+" objects (not counting the WATCH) and you are already carrying that much. If you really want to GET something else, then you will have to DROP something first.")
  4071 GOTO4140
  4075 IFw(m)=0THEN4090 ELSE PROCp("Congratulations, "+p$(p)+"!")
  4080 PROCp("You'll earn points when the "+n$+" is DEPOSITed (or DROPped) in the Bank.")
  4085 c=c+1:l(m)=-1:RETURN
  4090 PROCp("OK, you are carrying the "+n$+".")
  4095 l(m)=-1:c=c+1:RETURN
  4100 IFl(m)=-1THEN PRINT"OK.":l(m)=r:c=c-1 ELSE 4135
  4105 IFr=r0 THEN GOSUB5175
  4110 IFr<>3ANDr<>9THEN RETURN
  4115 IFl(2)=3THENl(2)=0:l(3)=3:l(7)=0:l(8)=3
  4120 IFl(4)=9THENl(4)=0:l(3)=9:l(11)=0:l(13)=9
  4125 IFl(5)=9THENl(5)=0:l(3)=9:l(11)=0:l(12)=9
  4130 RETURN
  4135 PROCp("You don't have the "+n$+".")
  4140 PROCp("To see an inventory of what you're carrying, type INVENTORY."):PROCb
  4145 RETURN
  4505 PRINT"You are in the "FNt(w4$(r))" Room now.";
  4510 REPEAT VDU9:UNTILPOS=36:VDU11,135:PRINT"N";:VDU10,8,8,8,135:PRINT"W+E";:VDU10,8,8,8,135:PRINT"S"
  4515 wc%=145+6
  4520 i2=r7*r8:FORi1=1TOr6
  4525 IF(i1-1)*i2<r AND r<=i1*i2 THEN4530 ELSE NEXT
  4530 k0=(i1-1)*i2:k9=i1*i2:k=k0:j=1
  4535 IFj=1VDUwc%
  4536 IFk=k0 ANDj=1THENPRINTw3$(7);
  4540 IFk=k0 ANDj>1ANDj<r8+1THENPRINTw3$(8);
  4545 IFk=k0 ANDj=r8+1THENPRINTw3$(9)
  4550 IFk>k0 ANDk<k9 ANDj=1THENPRINTw3$(4);
  4555 IFk>k0 ANDk<k9 ANDj>1ANDj<r8+1THENPRINTw3$(5);
  4560 IFk>k0 ANDk<k9 ANDj=r8+1THENPRINTw3$(6)
  4565 IFk=k9 ANDj=1THENPRINTw3$(1);
  4570 IFk=k9 ANDj>1ANDj<r8+1THENPRINTw3$(2);
  4575 IFk=k9 ANDj=r8+1THENPRINTw3$(3)
  4580 IFj>r8 THEN4595
  4585 IFw1(k+j)>0THENPRINTw1$(w1(k+j)); ELSE PRINTw1$(0);
  4590 j=j+1:GOTO4535
  4595 IFk=k9 THEN:GOTO305 ELSE j=1:VDUwc% : REM IFk=k9 THEN:RETURN ELSE j=1:VDUwc%
  4600 IFw2(k+j)>0THENPRINTw2$(w2(k+j)); ELSE PRINTw2$(0);
  4605 IFj>r8 THENPRINT:GOTO4620
  4610 IFw4(k+j)>0THENPRINTCHR$(129+FNrc(k+j))w4$(k+j)CHR$(145+6); ELSE PRINTCHR$(129+5)w4$(0)CHR$(145+6);
  4615 j=j+1:GOTO4600
  4620 k=k+r8:j=1:GOTO4535
  5015 IFr<>1THEN5040
  5016 IFl(10)=-1THEN5030
  5020 PROCp("The door is locked and you're not carrying the key.")
  5025 w1(4)=3.5:GOTO305
  5030 w1(4)=2.5:r=4:GOTO605
  5040 IFr<>2THEN5070
  5041 IFl(6)<>2THEN5060
  5045 PROCp("You cannot enter _ the doorway is blocked by a thick growth of carrots.")
  5055 w2(3)=3.5:GOTO305
  5060 r=3:w2(3)=2.5:GOTO605
  5070 IFr=4ANDl(10)<>-1THEN5020
  5071 IFr=4THEN5080
  5073 IFr>4THEN365
  5075 r=2:GOTO605
  5080 w1(4)=2.5:r=1:GOTO605
  5105 PROCp("Your WATCH stays on your wrist for the whole visit.")
  5106 IFc=0THENPROCp(" You aren't carrying anything else."):RETURN
  5115 PROCp(" Here is an inventory of what you're carrying:")
  5120 FORj=1TOm9
  5125 IFl(j)=-1THENPRINTTAB(2)n$(n1(j)):NEXT ELSE NEXT
  5130 RETURN
  5155 GOSUB5175:PRINT"You have ";i;" points out of 100."
  5160 PROCp("You earn points by DEPOSITing valuable things in the Bank.")
  5165 RETURN
  5175 i=0:FORj=1TOm9:IFl(j)=r0 THENi=i+w(j)
  5180 IFp9>1THENa$="all " ELSE a$=""
  5185 NEXTj:IFi<100THENRETURN
  5190 PROCb:PROCp("Mr "+n$(30)+" shouts, <<You "+a$+"won!>>"):VDU7:GOTO620
  5205 PROCp("Kicking "+n$+" will not help anything."):GOTO305
  5255 IFNOT(n=11ORn=23ORn=24)THEN5305
  5260 IFl(6)=0THEN5275
  5265 PROCp("The "+n$(n1(m))+" laughs and says, <<Well, I know that you know a carrot-liking RABBIT.>>")
  5270 GOTO305
  5275 ON 2-w4(1) GOTO5280,5290
  5280 PROCp("The "+n$(n1(m))+" says, <<"+p$(p)+", I think that you're doing great.>>"):GOTO305
  5290 PROCp("The "+n$(n1(m))+" smiles mysteriously and says, <<I recommend that you SIT in the CHAIR.>>")
  5300 GOTO305
  5305 IFn=15THENGOSUB4505:GOTO305
  5310 IFn=20THENPRINT"It doesn't help here.":GOTO305
  5315 IFn=28THENPRINT;t;" scoots have passed":PROCj
  5320 IFn=28THENPROCp(" and "+STR$(t9-t)+" scoots remain."):GOTO305
  5325 GOTO5980
  5355 IFn=9 THEN5015 ELSE5980
  5405 IFn<>12ANDn<>24THEN5980
  5406 IFn=24THENv=5:n=12:GOTO435
  5410 IFr<>2ORl(3)<>-1THEN5425
  5411 l(3)=0:l(4)=-1
  5415 PROCp("Glurg; glurg; plink. Your BOWL has cold MILK now.")
  5420 GOTO305
  5425 IFn=22ANDm=3THENPRINT"The BOWL is empty.":n$="BOWL"
  5430 IFv<>13ANDl(m)=r THENGOSUB4045:GOTO305
  5435 IFm=4ORm=5THENPRINT"The BOWL is still full of MILK."
  5440 IFr<>2THENPRINT"The Milk Room has lots of MILK."
  5445 IFl(m)>-1ORm<3ORm>5THENPRINT"You need a BOWL."
  5450 GOTO305
  5605 IFn<>25THEN5980 ELSE PRINT"I know these verbs: ";
  5610 FORi=1TOv9:a$=v$(i):GOSUB5655:NEXT
  5615 PROCb:PRINT"I know these nouns: ";
  5620 FORi=1TOn9:a$=n$(i):GOSUB5655:NEXT
  5625 PROCb:PROCp("I know some one-word messages (for example HELP) and I know some two-word messages (for examples FILL BOWL, OFFER MILK)."):PROCj
  5630 PROCp(" Whatever you say, I'll look at the first and last words; you could say SIT IN THE CHAIR or CONSULT THE SLEEPY MR "+n$(30)+".")
  5650 GOTO 305
  5655 IFPOS=1VDU8
  5656 IFL%-POS<LENa$+1PRINT
  5660 PRINTa$;:IFa$=v$(v9)ORa$=n$(n9)THENPRINT"."ELSE PRINT", ";
  5666 RETURN
  5705 IFm=0THEN5980
  5706 PROCp("The "+n$+" is worth "+STR$w(m)+" points."):IFw(m)<>0THEN305
  5710 PROCp("The "+n$+" might be useful as a tool.")
  5720 IFn=11ORn=23ORn=24THENPRINT"Friends are valuable."
  5725 IFn=20THENPROCp("A college education is a worthwhile and stimulating experience.")
  5735 GOTO305
  5755 IFn<>10THEN5980
  5756 IFr=1ORr=8THENr=9-r:GOTO605
  5760 PRINT"There's no CHAIR in here.":GOTO305
  5780 IFn<>22THEN5980
  5781 IFl(4)=-1ORl(5)=-1THEN5790
  5785 PRINT"You're not carrying any MILK.":GOTO305
  5790 PRINT"Glug; glug.":l(4)=0:l(5)=0:l(3)=-1:GOTO305
  5805 PRINT"Lost? "STRING$(11,". ")"CONSULT MAP"
  5810 PRINT"Not sure what you're carrying? "STRING$(19,". ")"INVENTORY"
  5815 PRINT"How many scoots are left? CONSULT WATCH"
  5820 PRINT"Want room redescribed? "STRING$(5,". ")"RELOOK"
  5825 PRINT"What's a certain thing worth? "STRING$(16,". ")"WORTH that thing";
  5830 PRINT"Examples: WORTH COIN,"'TAB(10)"WORTH CATALOG, WORTH CAT"'
  5835 PRINT"Want a hint? "STRING$(6,". ")"CONSULT friend";
  5840 PRINT"Examples: CONSULT BANKER, CONSULT "n$(29)
  5845 PRINT"Not sure how to say something?  "STRING$(18,". ")"LIST WORDS"
  5850 PRINT"Not sure what the clues mean --- ";
  5855 PRINT"think"'"and experiment.":GOTO 305
  5980 IFn$=v$THENPRINT"You'll need to use two words.":GOTO305
  5982 PROCp("The "+n$+" is hard to "+v$+"."):GOTO305
  6000 DEFPROCrc(r):C%=129+FNrc(r):VDU26,12,C%:FORY%=1TO24:VDU10,8,C%:NEXT:VDU28,40-L%,24,39,0,30:ENDPROC
  6020 DEFFNrc(r):=VAL(MID$("264620515",r,1))
  7000 DEFPROCp($S%):LOCALA%,Z%,M%,C%,N%,T%:M%=L%:N%=LEN$S%:A%=0:Z%=M%+1-POS:REPEATIFZ%>N%Z%=N%ELSEREPEATZ%=Z%-1:C%=S%?Z%:UNTILC%=32:IFZ%<A%Z%=A%+M%
  7010 T%=S%?Z%:S%?Z%=13:PRINT$(S%+A%);:S%?Z%=T%:VDU32,-8*(POS=1):IFZ%-A%<=M%ANDPOS PRINTELSEIFC%=32A%=A%+1ELSEZ%=Z%-1
  7020 A%=Z%+1:Z%=A%+M%+1:UNTILA%>=N%:IFPOS PRINT:ENDPROC ELSEENDPROC
  8000 DEFFNb:VDU11,8:A%=&87:B%=TRUE:FORI%=1TOL%:VDU9:C%=(USR(&FFF4)AND&FF00)DIV256:IFC%=32NEXT ELSEB%=FALSE:I%=L%:NEXT
  8010 VDU10,13:=B%
  8050 DEFPROCb:IFNOT(FNb)PRINT:ENDPROC ELSEENDPROC
  9000 DEFPROCj:A%=&87:REPEATVDU8:C%=(USR(&FFF4)AND&FF00)DIV256:UNTILC%<>32:VDU9:ENDPROC
  9100 DEFFNt(s$):IFLEFT$(s$,1)=" "REPEATs$=RIGHT$(s$,LENs$-1):UNTILLEFT$(s$,1)<>" "
  9110 IFRIGHT$(s$,1)=" "REPEATs$=LEFT$(s$,LENs$-1):UNTILRIGHT$(s$,1)<>" "
  9120 =s$
  9200 DEFPROCd(s%):VDU 23, 0, &A0, 0; 2 : REM Clear out buffer 0. : REM *FX21,0
  9210 IF s%=0 THEN IF GET: ENDPROC ELSE TIME=0:REPEATUNTILTIME>100*s%ORINKEY(0)<>-1:ENDPROC
  9300 DEFPROCw:FORI%=0TO3:a$="":FORJ%=1TOLENw1$(I%):C%=ASC(MID$(w1$(I%),J%,1)):IFC%=35a$=a$+CHR$255:NEXTELSEa$=a$+CHR$C%:NEXT
  9310 w1$(I%)=a$:a$="":FORJ%=1TOLENw2$(I%):C%=ASC(MID$(w2$(I%),J%,1)):IFC%=35a$=a$+CHR$255:NEXTELSEa$=a$+CHR$C%:NEXT
  9320 w2$(I%)=a$:NEXT:ENDPROC

