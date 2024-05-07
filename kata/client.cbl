      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. client.
       AUTHOR.  Alexencode.

      ******************************************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT F-INPUT ASSIGN 
           TO "FICHIERCLIENT.txt"
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FS-INPUT.


      ******************************************************************
       DATA DIVISION.
      ******************************************************************

       FILE SECTION.

       FD  F-INPUT
           RECORD CONTAINS 1 TO 100 CHARACTERS
           RECORDING MODE IS V.

       01  TABLE-INFO.
           05 NUMERO-EMPLOYE        PIC 9(9).
           05 NOM                   PIC X(20).
           05 PRENOM                PIC X(20).
           05 PROFESSION            PIC X(14).
           05 CPOS                  PIC 9(3).
           05 SALAIRE               PIC 9(5).
          
      ******************************************************************
       WORKING-STORAGE SECTION.
      ******************************************************************

       01  FS-INPUT PIC X(02).
           88 FS-INPUT-OK VALUE "00".
           88 FS-INPUT-EOF VALUE "10".

       01  WS-TABLE.
        03 WS-EMPLOYEE-LGTH  PIC 9(03) VALUE 1.
        03 WS-EMPLOYEE 
               OCCURS 1 TO 999 TIMES
               DEPENDING ON WS-EMPLOYEE-LGTH
               INDEXED BY IDX-MAT.
           05 WS-NUMERO-EMPLOYE        PIC 9(9).
           05 WS-NOM                   PIC X(20).
           05 WS-PRENOM                PIC X(20).
           05 WS-PROFESSION            PIC X(14).
           05 WS-CP                    PIC 9(3).
           05 WS-SALAIRE               PIC 9(5).

       01  WS-ID             PIC 9(02) VALUE 1.
       01  WS-SALAIRE-MAX    PIC 9(05) VALUE ZEROES.
       01  WS-SALAIRE-MIN    PIC 9(6)  VALUE 1000. 
      ****************************************************************** 
       PROCEDURE DIVISION.
      ******************************************************************      
      
           OPEN INPUT F-INPUT.
               PERFORM READ-R-IP THRU READ-R-IP-EXIT.
           CLOSE F-INPUT.

           DISPLAY "Le plus grand salaire est: " 
           WS-SALAIRE-MAX.
           DISPLAY "Le plus petit salaire est: " 
           WS-SALAIRE-MIN.           

           STOP RUN.

      ****************************************************************** 
       READ-R-IP.

           SET WS-ID TO 1.
           PERFORM UNTIL FS-INPUT-EOF
           READ F-INPUT
               AT END
                   SET FS-INPUT-EOF TO TRUE
               NOT AT END
                    MOVE TABLE-INFO TO WS-EMPLOYEE(WS-ID)
                   IF WS-SALAIRE(WS-ID) > WS-SALAIRE-MAX
                       MOVE WS-SALAIRE(WS-ID) TO WS-SALAIRE-MAX
                   END-IF
                   IF WS-SALAIRE(WS-ID) < WS-SALAIRE-MIN
                   AND WS-SALAIRE(WS-ID) > 0
                       MOVE WS-SALAIRE(WS-ID) TO WS-SALAIRE-MIN
                   END-IF
                   ADD 1 TO WS-ID
           END-READ
           END-PERFORM.

       READ-R-IP-EXIT.
           EXIT.

      ******************************************************************

