       IDENTIFICATION DIVISION.
       PROGRAM-ID. echec.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 LIGNE-BLANCHE       PIC X.
       01 COLONNE-BLANCHE     PIC X.
       01 LIGNE-NOIRE         PIC X.
       01 COLONNE-NOIRE       PIC X.
       01 LA-BAGARRE          PIC X(3) VALUE 'Non'.

       01 NUM-COLONNE-BLANCHE PIC 9.
       01 NUM-LIGNE-BLANCHE   PIC 9.
       01 NUM-COLONNE-NOIRE   PIC 9.
       01 NUM-LIGNE-NOIRE     PIC 9.

       01 DAME-BLANCHE        PIC X VALUE "X". 
       01 DAME-NOIRE          PIC X VALUE "#".  
       
      *Boucle management
       01 WS-BOUCLE      PIC 99 VALUE ZERO.
       01 WS-FINI        PIC 99 VALUE 1.
       01 WS-CODE-SORTIE PIC X VALUE 'y'.
       
       01  NUM-LIGNE     pic 9.
       01  ECHEQUIER.
           03 ECHEC OCCURS 8 TIMES.
              05 LIGNE PIC X(20).
                  88 EST-LIGNE-A VALUE "1".
                  88 EST-LIGNE-B VALUE "2".
                  88 EST-LIGNE-C VALUE "3".
                  88 EST-LIGNE-D VALUE "4".
                  88 EST-LIGNE-E VALUE "5".
                  88 EST-LIGNE-F VALUE "6".
                  88 EST-LIGNE-G VALUE "7".
                  88 EST-LIGNE-H VALUE "8".
              05 COLONNE-A PIC X VALUE "a".
              05 COLONNE-B PIC X VALUE "b".
              05 COLONNE-C PIC X VALUE "c".
              05 COLONNE-D PIC X VALUE "d".
              05 COLONNE-E PIC X VALUE "e".
              05 COLONNE-F PIC X VALUE "f".
              05 COLONNE-G PIC X VALUE "g".
              05 COLONNE-H PIC X VALUE "h".
              05 CASE PIC X.

       01 ECRITURE-BLANC   PIC X(16) VALUE ". . . . . . . . ".
       01 ECRITURE-NOIRE   PIC X(16) VALUE ". . . . . . . . ".

      ******************************************************************       
       PROCEDURE DIVISION.

      ******************************************************************

           MOVE ". . . . . . . . " TO ECHEC(1).
           MOVE ". . . . . . . . 7" TO ECHEC(2).
           MOVE ". . . . . . . . 6" TO ECHEC(3).
           MOVE ". . . . . . . . 5" TO ECHEC(4).
           MOVE ". . . . . . . . 4" TO ECHEC(5).
           MOVE ". . . . . . . . 3" TO ECHEC(6).
           MOVE ". . . . . . . . 2" TO ECHEC(7).
           MOVE "a b c d e f g h  " TO ECHEC(8).
       
           PERFORM VARYING NUM-LIGNE FROM 1 BY 1 UNTIL NUM-LIGNE > 8
           DISPLAY ECHEC(NUM-LIGNE)
           END-PERFORM.
       
           PERFORM 1000-DEBUT-BOUCLE THRU 1000-FIN-BOUCLE
           UNTIL WS-BOUCLE = WS-FINI.
       
           STOP RUN.
       
      ******************************************************************
       1000-DEBUT-BOUCLE.
           DISPLAY 
           "Position de la reine blanche (1-8) : " 
           WITH NO ADVANCING.
           ACCEPT LIGNE-BLANCHE.
           DISPLAY 
           " (A-H) : " 
           WITH NO ADVANCING.
           ACCEPT COLONNE-BLANCHE.
           MOVE FUNCTION UPPER-CASE(COLONNE-BLANCHE) TO COLONNE-BLANCHE.
           DISPLAY " ".
       
           DISPLAY 
           "Position de la reine noire (1-8) : " 
           WITH NO ADVANCING.
           ACCEPT LIGNE-NOIRE.
           DISPLAY 
           " (A-H) : " 
           WITH NO ADVANCING.
           ACCEPT COLONNE-NOIRE.
           MOVE FUNCTION UPPER-CASE(COLONNE-NOIRE) TO COLONNE-NOIRE.
           DISPLAY " ".
       
           COMPUTE NUM-COLONNE-BLANCHE = 
               FUNCTION NUMVAL(COLONNE-BLANCHE) 
               - FUNCTION NUMVAL("A") + 1 .
           COMPUTE NUM-LIGNE-BLANCHE = 
               FUNCTION NUMVAL(LIGNE-BLANCHE) 
               - FUNCTION NUMVAL("1") + 1 .
           COMPUTE NUM-COLONNE-NOIRE = 
               FUNCTION NUMVAL(COLONNE-NOIRE) 
               - FUNCTION NUMVAL("A") + 1 .
           COMPUTE NUM-LIGNE-NOIRE = 
               FUNCTION NUMVAL(LIGNE-NOIRE) 
               - FUNCTION NUMVAL("1") + 1 .
       
           IF COLONNE-BLANCHE = COLONNE-NOIRE OR
               LIGNE-BLANCHE = LIGNE-NOIRE OR
               (NUM-LIGNE-BLANCHE - NUM-LIGNE-NOIRE) 
               = (NUM-COLONNE-BLANCHE - NUM-COLONNE-NOIRE)
           THEN
               MOVE "Oui" TO LA-BAGARRE
           END-IF .
       
           DISPLAY "Les reines peuvent-elles s'attaquer ?" LA-BAGARRE .
       


       
           PERFORM VARYING NUM-LIGNE FROM 1 BY 1 UNTIL NUM-LIGNE > 8
           DISPLAY ECHEC(NUM-LIGNE)
           END-PERFORM.
       
           DISPLAY SPACE .
           DISPLAY "Continuer? (Y/N)".
           ACCEPT  WS-CODE-SORTIE.
           MOVE FUNCTION UPPER-CASE (WS-CODE-SORTIE) TO WS-CODE-SORTIE.
           IF WS-CODE-SORTIE EQUAL "N"          
           SET WS-FINI TO WS-BOUCLE 
           END-IF.
       
       1000-FIN-BOUCLE.
           EXIT.
      ******************************************************************