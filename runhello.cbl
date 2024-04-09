       identification division.
           Program-id. runhello. 
           Author. Alexencode.
           Date-written. 04/04/2024.
           Date-compiled. 04/04/2024.    
      *This programme will ask you your name and age and say hello to 
      *you.

       environment division.

       data division.
       working-storage section.

      *inputtext is a question outputtext will save your answer.

         01 inputnom     pic x(17) VALUE "Quel est ton nom?".
       01 outputnom    pic x(10).
       01 inprenom     pic x(20) VALUE "Quel est ton prenom?".
       01 outprenom    pic x(10).
       01 inputage     pic x(15) VALUE "Quel âge as-tu?".
       01 outputage    pic x(2).
       01 enchante     pic x(7) VALUE "Enchante".
       01 point        pic x(1) VALUE ".".
       01 tuas         pic x(5) VALUE "Tu as".
       01 dents        pic x(25) VALUE "ans, et toutes tes dents!".
       01 boucle       pic 9(1) VALUE 1.
       01 bye          pic x(4) VALUE "bye!".
       01 again  pic x(35) VALUE "Appuyez sur Entrée pour recommencer".

       Procedure division.
           PERFORM 8000-begin
           THRU 8000-end
           UNTIL  boucle = 5.
           stop run.

       8000-begin.
           Display "Bonjour COBOL!".
           Display inputnom.
           Accept outputnom.
           Display inprenom.
           Accept outprenom.
           Display inputage.
           Accept outputage.

           Display enchante SPACE outprenom SPACE outputnom SPACE point.
           Display tuas SPACE outputage SPACE dents.
           Display bye.
           Display again.
           ACCEPT bye.
           ADD 1 TO boucle.
       8000-end.

           exit program.
           End program runhello.
