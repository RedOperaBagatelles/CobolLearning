       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERSON.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       01 INFO.
         05 NAME PIC X(5).
         05 AGE  PIC 99.
         05 PID  PIC 99.

       01 RESULT PIC X(100).

       PROCEDURE DIVISION USING INFO RESULT.

       MAIN-PROCEDURE.
           STRING
             "이름 : " NAME
             ", 나이 : "  AGE
             ", ID : "  PID
             INTO RESULT
           END-STRING

           GOBACK.
