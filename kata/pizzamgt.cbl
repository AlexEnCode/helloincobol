      ****************************************************************** 
      *    Sachant que chaque convive mange 1,1 pizza                  *
      *    (= 1 entière +1 dixième) et qu'il faut commander            *
      *    des pizzas entières, combien faut-il en commander ?         *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. pizzamgt.
       AUTHOR. AlexEnCode.

       
       DATA DIVISION.

       WORKING-STORAGE SECTION.

      *Boucle management 
       01 WS-BOUCLING pic 99 value ZERO.
       01 WS-FINISHED pic 99 value 1.
       01 WS-EXITCODE pic X  value 'y'. 
      
      *ws-variable
       01 WS-CONVIVES          PIC 9(3).
       01 WS-PIZZAS            PIC  99.
       01 WS-CST-FAIM          PIC 9V9 VALUE 1.1.
      

       PROCEDURE DIVISION.

           PERFORM 1000-BOUCLE-BEGIN THRU 1000-BOUCLE-END
           UNTIL WS-BOUCLING = WS-FINISHED.

           STOP RUN.

      ******************************************************************
       1000-BOUCLE-BEGIN.
           
           DISPLAY "Combiens de convives sont attendu?"
           ACCEPT WS-CONVIVES.
           MULTIPLY WS-CONVIVES BY WS-CST-FAIM 
           GIVING WS-PIZZAS ROUNDED.
 
           DISPLAY  WS-PIZZAS " pizzas sont necessaires.".
           DISPLAY SPACE
           DISPLAY "Continuer? (Y/N)".
           ACCEPT  WS-EXITCODE.
           MOVE FUNCTION UPPER-CASE (WS-EXITCODE) TO WS-EXITCODE.
           IF WS-EXITCODE EQUAL "N"        
           DISPLAY "Merci d'avoir commandé chez PIZZALEX !"   
           SET WS-FINISHED TO WS-BOUCLING
           END-IF.
       
       1000-BOUCLE-END.
           EXIT.
      ******************************************************************
