       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEVEL-NUMBER.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       *> 숫자는 데이터 계층 구조라고 하며 01은 최상위 구조
       *> 무조건 5씩 증가해야 하는 규칙은 없지만 보통 5단계로 구성
       01 STUDENT.
         05 NAME       PIC X(10).    *> 01의 하위 자식
         05 SCORE.
           10 KOREAN   PIC 999.
           10 ENGLISH  PIC 999.

       *> 조건 이름을 정의하는데 사용
       01 STAT PIC X(3).
         88 SUCCEED VALUE 'YES'.
         88 FAIL    VALUE 'NO'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
         MOVE 'YES' TO STAT

         *> IF STATUS = 'YES'와 같은 구조
         IF SUCCEED
           DISPLAY "GOOD"
         END-IF
         STOP RUN.

       END PROGRAM LEVEL-NUMBER.
