DECLARE SUB AGEN ()
DECLARE SUB CRASHED ()
DECLARE SUB FINISH ()
DECLARE SUB SPACE (N!)

REM Copyright (C) 2009 Richard W. Allen
REM Program Name:  DEATH VALLEY
REM Author:        Richard W. Allen
REM Version:       V1.1
REM Date Started:  March 26, 2003
REM Date End:      June 30, 2009
REM Webpage:       http://richard-allen.homelinux.com
REM IDE:           QBX 7.1
REM Compiler:      QBX 7.1
REM Langage:       QBasic 7.1
REM License:       GNU GENERAL PUBLIC LICENSE Version 2
REM                see license.txt for details
REM
REM DEATH VALLEY Copyright (C) 2009 Richard W. Allen DEATH VALLEY
REM Comes with ABSOLUTELY NO WARRANTY;
REM DEATH VALLEY is licensed under the GNU GENERAL PUBLIC LICENSE Version 2.
REM for details see the license.txt include with this program.

REM *******************************************************
REM **            DEATH VALLEY - June 30, 2009           **
REM *******************************************************

REM THIS GAME IS BASED ON THE USBORNE COMPUTER PROGRAMMING
REM "COMPUTER SPACEGAMES" FOR ZX SPECTRUM, ZX81, BBC, TRS-80, APPLE,
REM VIC & PET COMPUTERS

DO
	CLS
	PRINT "DEATH VALLEY v1.1"
	PRINT "DEATH VALLEY Copyright (C) 2009 Richard W. Allen DEATH VALLEY"
	PRINT "Comes with ABSOLUTELY NO WARRANTY;"
	PRINT "DEATH VALLEY is licensed under the GNU GENERAL PUBLIC LICENSE Version 2."
	PRINT "for details see the license.txt include with this program."

	PRINT "User Q to move Left and P to move Right."

	A = 0

	S = 0

	M = 200

	PRINT "WIDTH? 32 max 3 min"
	INPUT W
	W% = INT(W / 2)

	L = 10
	Y = W
	R = W

	D = 0
	DO
		DO
			D = INT(RND * 3 - 1)
		LOOP WHILE L + D < 0 OR L + D > 20

		L = L + D
		Y = Y - D
		R = R + D

		SPACE (L)
		PRINT "I";

		SPACE (Y)
		PRINT "*";

		SPACE (R)
		PRINT "I"

		I$ = UCASE$(INKEY$)

		IF I$ = "Q" THEN
			Y = Y - 1
			R = R + 1
		END IF

		IF I$ = "P" THEN

			Y = Y + 1
			R = R - 1
		END IF

		IF Y < 1 OR R < 1 THEN
			CRASHED
			REM BRACK OUT OF DO Loop
			S = M + 1
		END IF

		S = S + 1

	LOOP WHILE S < M

	IF S = M THEN FINISH

	AGEN

LOOP WHILE A = 1

STOP

REM ***************************************************

SUB AGEN
	SHARED A

	REM NEW CODE TO ASK IF THEY WISH TO QUIT OR PLAY AGEN

	PRINT "DO YOU WISH TO PLAY AGEN? Y/N"
	QUIT$ = UCASE$(INKEY$)

	DO WHILE QUIT$ <> "Y" AND QUIT$ <> "N"
		QUIT$ = UCASE$(INKEY$)
	LOOP
	CLS

	IF QUIT$ = "Y" THEN
		A = 1
	END IF

END SUB

SUB CRASHED
	PRINT "YOU CRASHED INTO THE WALL"
	PRINT "AND DISINTEGRATED"
END SUB

SUB FINISH
	PRINT "WELL DONE-YOU MADE IT"
	PRINT "THROUGH DEATH VALLEY"
END SUB

SUB SPACE (N)
	IF N <> 0 THEN
		FOR I = 1 TO N
			PRINT " ";
		NEXT I

	REM NEW CODE TO MAKE THE GAME GO SLOWER

		TIME = 0

		DO WHILE TIME <= 10000
			TIME = TIME + 1
		LOOP

	REM END NEW CODE
	END IF
END SUB


REM ***************************************************

