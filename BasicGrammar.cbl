       IDENTIFICATION DIVISION.
       PROGRAM-ID. BASIC-GRAMMAR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM PIC 99.
       01 MESSAGE PIC X(10).
       01 USER-NAME PIC X(10).

       01 A PIC 99 VALUE 2.
       01 B PIC 99 VALUE 3.
       01 C PIC 99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           MOVE 10 TO NUM.           *> NUM에 10을 대입함
           MOVE "HELLO" TO MESSAGE.  *> "HELLO"를 MESSAGE에 저장

           DISPLAY "HELLO WORLD".    *> 문자열 출력
           DISPLAY NUM.              *> 변수 값 출력

           ACCEPT USER-NAME.         *> 사용자로부터 이름을 받아드림
           DISPLAY USER-NAME.

           COMPUTE C = A + (B * 2).  *> 일반적인 계산식을 구함
           DISPLAY C.

           ADD A TO B.         *> B에 A를 더한 값을 저장
           DISPLAY B.

           SUBTRACT C FROM A.  *> A에 C를 뺀 값을 저장
           DISPLAY A.

           MULTIPLY 3 BY A.    *> A에 3을 곱한 값을 저장
           DISPLAY A.

           DIVIDE C INTO B.    *> B를 C로 나눈 결과를 B에 저장
           DISPLAY B.
           STOP RUN.
       END PROGRAM BASIC-GRAMMAR.
