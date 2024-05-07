      ****************************************************************** 
      *     La conjecture de Syracuse prétend que le mode              *
      *     de calcul suivant arrive toujours à "1" quel que soit      *
      *     le nombre entier positif non nul choisi au départ.         *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. cyrano.
       AUTHOR. AlexEnCode.
     
       DATA DIVISION.

       WORKING-STORAGE SECTION.

      *Boucle management 
       01 WS-BOUCLING pic 99 value ZERO.
       01 WS-FINISHED pic 99 value 1.
       01 WS-EXITCODE pic X  value 'y'. 
      
      * Syracuse test variable
       01 WS-NOMBRE           PIC 9(3).
       01 WS-ETAPES           PIC 9(3) VALUE 0.
       01 WS-PAIR             PIC X VALUE "Y".
       01 WS-RESULT           PIC 9(3).
       
       PROCEDURE DIVISION.
           
                      display "creme".
           PERFORM 1000-BOUCLE-BEGIN THRU 1000-BOUCLE-END
           UNTIL WS-BOUCLING = WS-FINISHED.

           STOP RUN.

      ******************************************************************
       1000-BOUCLE-BEGIN.
           display "Entrez un nombre : ".
           ACCEPT WS-NOMBRE.
           PERFORM 2000-METHODE-START THRU 2000-METHODE-END.

           DISPLAY "Nombre d'étapes : " WS-ETAPES.

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
       2000-METHODE-START. 

       
           IF WS-NOMBRE NOT = 0
               IF WS-PAIR = "Y"
                   DIVIDE WS-NOMBRE BY 2 GIVING WS-NOMBRE
               ELSE
                   MULTIPLY WS-NOMBRE BY 3 GIVING WS-NOMBRE
                   ADD 1 TO WS-NOMBRE
               END-IF
               ADD 1 TO WS-ETAPES
               IF WS-PAIR = "Y"
                   MOVE "N" TO WS-PAIR
               ELSE
                   MOVE "Y" TO WS-PAIR
               END-IF.        

       2000-METHODE-END.
           EXIT.     
      ******************************************************************