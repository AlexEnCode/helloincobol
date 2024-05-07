      ****************************************************************** 
      *    Sachant que chaque convive mange 1,1 pizza                  *
      *    (= 1 entière +1 dixième) et qu'il faut commander            *
      *    des pizzas entières, combien faut-il en commander ?         *
      *                                                                *
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. gnirts.

       
       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *Boucle management 
       01 WS-BOUCLING pic 99 value ZERO.
       01 WS-FINISHED pic 99 value 1.
       01 WS-EXITCODE pic X  value 'y'. 
             
       01 WS-MOT PIC X(20).
       01 WS-TOM PIC X(20).
       01 WS-ID PIC 9(3) VALUE 1.
       01 WS-LNGH PIC 9(3).

      ******************************************************************       
       PROCEDURE DIVISION.
      ******************************************************************


           PERFORM 1000-BOUCLE-BEGIN THRU 1000-BOUCLE-END
           UNTIL WS-BOUCLING = WS-FINISHED.

           STOP RUN.

      ******************************************************************
       1000-BOUCLE-BEGIN.       
           DISPLAY "Entrez votre mot : " WITH NO ADVANCING.
           ACCEPT WS-MOT.
           COMPUTE WS-LNGH = FUNCTION LENGTH(WS-MOT).
           PERFORM VARYING WS-ID FROM WS-LNGH BY -1 UNTIL WS-ID = 0
                        MOVE WS-MOT(WS-ID:1) 
                        TO WS-TOM(WS-LNGH - WS-ID + 1:1)
           END-PERFORM.
           
           DISPLAY WS-TOM .

           IF WS-TOM EQUAL WS-MOT
           DISPLAY "AHAH! c'est rigolo!"
           END-IF.

           DISPLAY SPACE
           DISPLAY "Continuer? (Y/N)".
           ACCEPT  WS-EXITCODE.
           MOVE FUNCTION UPPER-CASE (WS-EXITCODE) TO WS-EXITCODE.
           IF WS-EXITCODE EQUAL "N"          
           SET WS-FINISHED TO WS-BOUCLING
           END-IF.
       
       1000-BOUCLE-END.
           EXIT.
      ******************************************************************