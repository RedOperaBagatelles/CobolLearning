       IDENTIFICATION DIVISION.
       PROGRAM-ID. POINTER.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NAME     PIC X(10) VALUE "KIM".
       *> BASED를 붙이면 주소가 없는 상태에서 시작하므로 나중에 주소를 변경할 수 있음
       01 GET-DATA BASED.
         05 GET-NAME PIC X(10).

       01 PTR  USAGE POINTER.       *> 어떤 메모리 위치가 들어가는 변수
       01 PTR2 USAGE POINTER.

       01 DYNAMIC-BUFFER BASED.
         05 BUF-DATA OCCURS 100 TIMES PIC X.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           *> NAME 변수의 주소값을 PTR에 저장
           SET PTR TO ADDRESS OF NAME.

           SET ADDRESS OF GET-DATA TO PTR.
           DISPLAY GET-NAME.

           *> 동적으로 메모리를 할당하는데 사용
           ALLOCATE 100 CHARACTERS RETURNING PTR.
           SET ADDRESS OF DYNAMIC-BUFFER TO PTR.

           MOVE 'C' TO BUF-DATA(1).
           MOVE 'A' TO BUF-DATA(2).
           MOVE 'T' TO BUF-DATA(3).

           DISPLAY BUF-DATA(1).
           DISPLAY BUF-DATA(2).
           DISPLAY BUF-DATA(3).

           FREE PTR.
           FREE PTR2.

       END PROGRAM POINTER.
