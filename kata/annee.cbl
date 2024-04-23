       IDENTIFICATION DIVISION.
       PROGRAM-ID. annee.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-ANNEE   PIC 9999 VALUE ZERO.
       01 WS-BOUCLING pic 99 value ZERO.
       01 WS-FINISHED pic 99 value 1.
       01 WS-EXITCODE pic X  value 'y'. 
       01 WS-MODULO-4    PIC 999.
       01 WS-MODULO-100  PIC 999.
       01 WS-MODULO-400  PIC 999.
       01 WS-RESULT-4  PIC 999.
       01 WS-RESULT-100  PIC 999.
       01 WS-RESULT-400  PIC 999.

       PROCEDURE DIVISION.

           PERFORM 1000-BEGIN
           UNTIL WS-BOUCLING = WS-FINISHED.
           STOP RUN.

       1000-BEGIN.

           DISPLAY "Entrez une année :" WITH NO ADVANCING.
           ACCEPT WS-ANNEE.
           
            DIVIDE WS-ANNEE BY 4   GIVING WS-RESULT-4
            REMAINDER  WS-MODULO-4.
            DIVIDE WS-ANNEE BY 100 GIVING WS-RESULT-100
            REMAINDER  WS-MODULO-100.
            DIVIDE WS-ANNEE BY 400 GIVING WS-RESULT-400
            REMAINDER  WS-MODULO-400.
            
            DISPLAY WS-MODULO-4.
            DISPLAY WS-MODULO-100.
            DISPLAY WS-MODULO-400.
           IF WS-MODULO-100 EQUAL ZERO AND WS-MODULO-400 EQUAL ZERO
               DISPLAY "L'année "  WS-ANNEE " est bisextile."
           ELSE
               PERFORM MODULO4
           END-IF.
        

           DISPLAY "Continuer? (Y/N)".
           ACCEPT  WS-EXITCODE.
           MOVE FUNCTION UPPER-CASE (WS-EXITCODE) TO WS-EXITCODE.
           IF WS-EXITCODE EQUAL "N"           
           SET WS-FINISHED TO WS-BOUCLING
           STOP RUN 
           END-IF.


       MODULO4.
           IF  WS-MODULO-4  EQUAL ZERO
           DISPLAY "L'année "  WS-ANNEE " est bisextile."
           ELSE
           DISPLAY "L'année " WS-ANNEE " n'est pas bisextiles."
           END-IF.