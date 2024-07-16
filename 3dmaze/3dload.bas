    10 REM 3D_Maze
    20 REM by David Johnston
    30 REM 1993 Acorn Computing
    40 REM Instructions from mag. 11.07
    50 REM Ported to the Agon Light by Steve Lovejoy 2024.
    60 REM
    70 REM ON ERROR GOTO 340
    80 MODE 7 : PROC_HideCursor
    90 PROCcntr(1,6,1," 3D_Maze")
   100 PROCcntr(0,4,2," by David Johnston 1993")
   105 PROCcntr(0,4,3," Ported to the Agon Light")
   110 PROCcntr(0,4,4," by Steve Lovejoy 2024")
   120 PRINT'"There you were, sitting at the keyboard of your trusty old Agon when, all of a  sudden, a tremendous walled maze        appeared around you."
   130 PRINT"Perplexed by this weird phenomenon,     you became unable to do anything at all other than turn to your left or right,  or stagger forward in hope of finding   your passport to freedom."
   140 PRINT"Your only means of escape is through    the elusive exit which appears as a     solid white section in the maze wall."
   150 PRINT"If you find it be sure not to miss      your opportunity."
   160 :
   170 PRINTTAB(8,23);CHR$132;CHR$(157);CHR$135;"   PRESS ANY KEY   ";CHR$156; : VDU 28,0,22,39,8
   180 A=GET : CLS
   190 PRINT"The maze is cleverly drawn using data   based on a two dimensional grid. As you weave your way around the maze, your    view is updated from the grid to give   an accurate representation of your"
   200 PRINT"surroundings and line of sight. Walls   appear as outlined sections, and paths  simply as gaps in these walls."
   210 PRINT
   220 PRINT"A simple maze editor is also included   so that you can design your own         challenges in two dimensions and        attempt to solve them in three."
   230 A=GET : CLS
   240 PRINTSPC15"Maze editor"
   250 PRINT'SPC10;CHR$134;"Z=Left"
   260 PRINTSPC10;CHR$134;"X=Right"
   270 PRINTSPC10;CHR$134;"K=Up"
   280 PRINTSPC10;CHR$134;"M=Down"
   290 PRINTSPC10;CHR$134;"/=Select object"
   300 PRINTSPC10;CHR$134;":=Place object at cursor"
   310 PRINTSPC10;CHR$134;"E=Return to Editor menu"
   320 PRINT;CHR$134;'"   NB: O indicates a wall, E the exit."
   330 A=GET
   340 REM
   350 CLS : VDU 28,0,24,39,0
   360 PROCcntr(0,15,6,"  Gameplay controls")
   370 PROCcntr(1,6,10,"Z=Rotate anti-clockwise")
   380 PROCcntr(1,6,13,"X=Rotate clockwise")
   390 PROCcntr(1,6,16,"/=Move forward")
   400 PRINTTAB(8,23);CHR$132;CHR$(157);CHR$135;"   PRESS ANY KEY   " : A=GET : VDU 26 : CLS
   430 RUN"3dmaze.bas"
   440 END
   445 :
   450 DEF PROCcntr(D%,C%,Y%,msg$)
   460 X%=(40-LEN(msg$))/2
   470 msg$=CHR$(128+C%)+msg$
   480 IF D%=1 FOR N%=0 TO 1 : PRINTTAB(X%-2,Y%+N%)CHR$141msg$ : NEXT : ENDPROC
   490 PRINTTAB(X%-1,Y%+N%)msg$
   500 ENDPROC
   510 :
   520 DEF PROC_HideCursor : REM Hide Cursor.
   530 VDU 23,1,0;0;0;0;
   540 ENDPROC

