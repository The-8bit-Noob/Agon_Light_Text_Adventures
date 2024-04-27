   10 REM "********************************"
   20 REM "*   The Philosopher's Stone    *"
   30 REM "*      written in 1986 by      *"
   40 REM "*       Graham J Barlow        *"
   50 REM "*   Ported to the Agon Light   *"
   60 REM "*    By Steve Lovejoy 2024     *"
   70 REM "********************************"
   80 ON ERROR GOTO 350
   90 MODE 8 : RESTORE
  100 PROChideCursor
  110 VDU 23,224,255,255,0,0,0,0,255,255 : VDU 23,225,195,195,195,195,195,195,195,195 : REM define custom chars.
  120 ptcol%=15 : stcol%=14 : COLOUR stcol%
  130 FOR A%=2 TO 29 : PRINTTAB(2,A%);CHR$225;TAB(4,A%);CHR$225;TAB(37,A%);CHR$225;TAB(35,A%);CHR$225; : NEXT A% : REM vert lines.
  140 FOR A%=0 TO 39 : PRINTTAB(A%,3);CHR$224;TAB(A%,28);CHR$224;TAB(A%,26);CHR$224 : NEXT A% : REM hor lines.
  150 FOR A%=0 TO 6 : PRINTTAB(A%,5);CHR$224 : NEXT A% : FOR A%=32 TO 39 : PRINTTAB(A%,5);CHR$224 : NEXT A% : REM hor line with name.
  160 PRINTTAB(8,5)"THE PHILOSOPHER'S STONE";:COLOUR ptcol%:PRINTTAB(15,9)"Written by";TAB(12,10)"Graham J Barlow";TAB(17,11)"1986"
  170 PRINTTAB(8,13)"Ported to the Agon Light";TAB(18,14)"By"
  180 PRINTTAB(13,15)"Steve Lovejoy";TAB(17,16)"2024"
  190 REPEAT : COLOUR stcol% : PRINTTAB(10,24)"PRESS THE SPACE BAR"
  200 UNTIL INKEY-99
  210 FOR B%=8 TO 4 STEP -4
  220   FOR A%=640 TO 0 STEP -B% : GCOL 13,0
  230     MOVEA%,1280:DRAWA%,0:MOVE1280-A%,1280:DRAW1280-A%,0 : NEXT A%
  240 NEXT B% : MODE 8 : PROChideCursor :  VDU 23;8202;0;0;0; : COLOUR stcol%
  250 PRINT"" : PRINT"         THE PHILOSOPHER'S STONE" : COLOUR ptcol% : ON ERROR OFF
  260 PRINT"" : PRINT"You are Daverick Harpmoon, a skilled    adventurer on a quest to find the fabledPhilosopher's Stone. This is a rare     substance, long sought by alchemists,   which will change base metals into gold and also produce the ";
  270 PRINT"elixir of life     (that is, confer eternal youth)."
  280 PRINT"" : COLOUR stcol% : PRINT"USEFUL WORDS:" : PRINT"" : PRINT"QUIT: "; : COLOUR ptcol% : PRINT"This allows you to start a new    game." : PRINT""
  290 COLOUR stcol% : PRINT"INV: "; : COLOUR ptcol% : PRINT"This lists all the objects you     are carrying." : PRINT""
  300 COLOUR stcol% : PRINT"SAVE: "; : COLOUR ptcol% : PRINT"This saves your position onto     sdcard. When QUIT is typed you will be  given the option to load a saved game." : PRINT""
  310 COLOUR stcol% : PRINT"HELP: "; : COLOUR ptcol% : PRINT"This lists all the verbs the      computer understands."
  320 PRINT"I would advise you to type "; : COLOUR stcol% : PRINT"HELP "; : COLOUR ptcol% : PRINT"when theprogram loads."
  330 COLOUR stcol% : PRINTTAB(10,28)"PRESS THE SPACE BAR" : REPEAT UNTIL INKEY-99 : CLS
  340 GOTO 370
  350 CLS : VDU 31,0,2 : COLOUR 1
  360 REPORT : PRINT;" at line ";ERL : COLOUR ptcol% : END
  370 CLS : COLOUR stcol% : PRINTTAB(15,10)"GOOD LUCK!": PRINTTAB(13,12)"ON YOUR QUEST" : SOUND1,-15,0,4 : VDU 28,0,23,0,23 : COLOUR ptcol% : RUN"stone2.bas"
  380 :
  390 DEF PROChideCursor : REM Hide Cursor.
  400 VDU 23,1,0;0;0;0;
  410 ENDPROC
