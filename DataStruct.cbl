       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATA-STRUCT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       *> c언어의 구조체처럼 그룹 변수를 통해서 변수를 묶을 수 있음
       01 STUDENT.               *> 그룹 변수는 PIC가 존재하지 않음
         05 NAME     PIC X(10).  *> 그룹 변수 내부에 있는 변수를 하위 변수
         05 AGE      PIC 99.
         05 SCORE    PIC 999.

         *> 그룹 변수 안에 또 다른 그룹 변수를 중첩해서 넣을 수 있음
         05 ADDRESS-INFO.
           10 CITY PIC X(20).
           10 ZIP  PIC 9(5).

         *> REDEFINES를 이용하여 같은 메모리를 다른 형태로 볼 수 있음 (c언어의 union과 같음)
         05 CALL-NUMBER REDEFINES ADDRESS-INFO.
           10 AREA-NAME PIC 9(25).

       *> 숫자 3개가 들어갈 수 있는 배열 5개 선언 (SCORE(1)로 접근)
       01 SCORES.
         05 NUM PIC 999 OCCURS 5 TIMES.

       *> 배열 안에 구조체도 넣을 수 있음
       01 COMPANY.
         05 EMPLOYEE OCCURS 3 TIMES.
           10 NAME   PIC A(20).
           10 SCORE  PIC 999.

         05 COUNTS PIC 9.
         05 MANAGERS.
           10 MANAGER_NUM PIC 999 OCCURS 1 TO 10 TIMES
             DEPENDING ON COUNTS.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           *> 위와 같이 지정할 경우 ADDRESS-INFO도 같이 변경됨
           MOVE 1234567890123456789012345 TO AREA-NAME.
           DISPLAY ZIP.  *> 12345

           *> 배열은 1부터 시작
           MOVE 100 TO NUM(1).
           MOVE 123 TO NUM(5).
           DISPLAY NUM(1).
           DISPLAY NUM(5).

           *> MANAGER_NUM의 최대 개수를 3개로 제한
           MOVE 3 TO COUNTS.

           STOP RUN.
       END PROGRAM DATA-STRUCT.
