	 10 REM "********************************"
   20 REM "*          PLANET-FALL         *"
   30 REM "*      written in 1983 by      *"
   40 REM "*   Tim Garden & Ian Nicholls  *"
   50 REM "*   Ported to the Agon Light   *"
   60 REM "*    By Steve Lovejoy 2024     *"
   70 REM "********************************"
   80 REM "             Story              "
   90 :
  100 MODE 7
  110 PROC_HideCursor
  120 :
  130 FOR E%=0 TO 1 : PRINTTAB(0,11+E%)CHR$132;CHR$157;CHR$135;CHR$141;"           Planet Fall             " : NEXT
  140 PRINTCHR$132;CHR$157;CHR$135"                                    "
  150 PRINTCHR$132;CHR$157;CHR$135"This isn't another of those         "
  160 PRINTCHR$132;CHR$157;CHR$135"stock market games where you buy and"
  170 PRINTCHR$132;CHR$157;CHR$135"sell shares, but something on a much"
  180 PRINTCHR$132;CHR$157;CHR$135"grander scale!                      "
  190 PRINTCHR$132;CHR$157;CHR$135"                                    "
  200 PRINTCHR$132;CHR$157;CHR$135"You'll take charge of an            "
  210 PRINTCHR$132;CHR$157;CHR$135"interstellar trading fleet which    "
  220 PRINTCHR$132;CHR$157;CHR$135"flies between the planets buying and"
  230 PRINTCHR$132;CHR$157;CHR$135"selling its wares.                  "
  240 PRINTCHR$132;CHR$157;CHR$135"                                    "
  250 PRINTCHR$132;CHR$157;CHR$135"Not that the journey will be easy.  "
  260 PRINTCHR$132;CHR$157;CHR$135"Not with pirates, rogue inspectors, "
  270 PRINTCHR$132;CHR$157;CHR$135"faulty navigation computers and up  "
  280 PRINTCHR$132;CHR$157;CHR$135"to six players taking part!         "
  290 PRINTCHR$132;CHR$157;CHR$135"                                    "
  300 PRINTCHR$132;CHR$157;CHR$135"The next two pages will show you the"
  310 PRINTCHR$132;CHR$157;CHR$135"main trading sequence, complete with"
  320 PRINTCHR$132;CHR$157;CHR$135"a ruthless haggling routine and the "
  330 PRINTCHR$132;CHR$157;CHR$135"galaxy map with its full allocation "
  340 PRINTCHR$132;CHR$157;CHR$135"of 15 planets.                      "
  350 PRINTCHR$132;CHR$157;CHR$135"                                    "
  360 PRINTCHR$132;CHR$157;CHR$135;CHR$136;"          "; : : INPUT "PRESS ANY KEY",ip$
  370 :
  380 CLS : PROCback(135,132)
  390 FOR E%=0 TO 1 : PRINTTAB(13,11+E%)CHR$132;CHR$157;CHR$135;CHR$141;"LOADING" : NEXT
  400 RUN"PFALL2.bas"
  410 END
  420 :
  430 DEF PROC_HideCursor : REM Hide Cursor.
  440 VDU 23,1,0;0;0;0;
  450 ENDPROC
  460 :
  470 DEF PROCback(F%,B%)
  480 FOR I%=0 TO 24 : PRINTTAB(0,I%)CHR$B%;CHR$157;CHR$F%; : NEXT
  490 ENDPROC
  500 :

