       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUB-PROGRAM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A PIC 999 VALUE 2.
       01 B PIC 999 VALUE 4.
       01 C PIC 999.

       01 INFO.
         05 NAME PIC X(5)  VALUE "KIM".
         05 AGE  PIC 99    VALUE 50.
         05 PID  PIC 99    VALUE 1.

       01 RESULT PIC X(30).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           *> A, B, C 순으로 데이터를 전달 (Pass By Reference 형태)
           CALL 'CALC' USING A B C.
           DISPLAY C.

           CALL 'PERSON' USING INFO RESULT.
           DISPLAY RESULT.

           STOP RUN.
       END PROGRAM SUB-PROGRAM.
