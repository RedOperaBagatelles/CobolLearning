       IDENTIFICATION DIVISION.
       PROGRAM-ID. VARIABLES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NAME      PIC X(20).          *> 레벨번호 번수명 PIC 자료형 [X(20) : 문자 20개]
       01 WS-AGE       PIC 9(5) VALUE 100. *> 숫자 5자리
       01 WS-FLOAT     PIC 9(5)V99.        *> 12345.67와 같이 표현할때 사용 (실제로 12345 67처럼 저장)
       01 WS-BINAGE    PIC 9(4) COMP.      *> 기본적으로 숫자는 문자로 저장되지만 COMP를 사용하면 이진 데이터로 저장

       *> 소수점 단위에서 오차 없이 정확한 계산을 위해서 COMP-3를 사용 (십진수 기반 저장 방식)
       *> 오차 없이 저장하기 위해서 2자리를 한 바이트에 저장 (ex : 12345 -> 12 34 5C, C : 양수, D : 음수)
       01 WS-ACC       PIC 9(5)V99 COMP-3.

       01 WS-SIGNNUM   PIC S9(5) VALUE -1250.              *> +12345, -12345처럼 부호를 저장할 수 있음 (DISPLAY 방식에서 12345+, 12345-처럼 내부 표현이 달리질 수 있음)
       01 WS-SIGNFRT   PIC S9(5) SIGN LEADING.             *> 부호의 위치를 강제로 맨 앞으로 이동시킬 수 있음 (SIGN TRAILING : 맨 뒤로 강제)
       01 WS-SIGNWORD  PIC S9(5) SIGN LEADING SEPARATE.    *> 부호를 별도의 문자로 저장

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
       MOVE "COBOL" TO WS-NAME.
       MOVE 0.1 TO WS-ACC.

       *> COBOL        00100 00000.10 -01250
       DISPLAY WS-NAME " " WS-AGE " " WS-ACC  " " WS-SIGNNUM
       STOP RUN.
       END PROGRAM VARIABLES.
