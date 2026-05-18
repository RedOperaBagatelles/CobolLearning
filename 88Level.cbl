       IDENTIFICATION DIVISION.
       PROGRAM-ID. 88-LEVEL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       *> 88 Level은 IsActive = "Y"; 보다는 Active와 같이 조건을 읽기 쉽게 만드는데 사용
       01 WS-STATUS  PIC X.
         88 ACTIVE   VALUE "Y".
         88 INACTIVE VALUE "N".

       *> 여러 값을 하나의 조건으로 묶을 수 있음
       01 WS-GRADE   PIC 9(3).
         88 PASS     VALUES 60 THRU 100. *> IF WS-GRADE >= AND WS-GRADE <= 100
         88 FAIL     VALUES 0  THRU 59.

       *> 여러 개별 값도 가능
       01 WS-CMD       PIC X.
         88 VALID-CMD  VALUES "A" "B" "C".

       PROCEDURE DIVISION.
       MOVE "Y" TO WS-STATUS.

       MAIN-PROCEDURE.
           IF ACTIVE
             DISPLAY "ACTIVE"
           END-IF

           *> MOVE "N" TO WS-STATUS.와 같은 기능을 함
           SET INACTIVE TO TRUE.
           IF INACTIVE
             DISPLAY "INACTIVE"
           END-IF

           SET WS-GRADE TO 62.
           IF PASS
             DISPLAY "PASS"
           END-IF

           *> 88 LEVEL은 별개의 변수가 아니라서 메모리를 가지고 있지 않음
           *> MOVE "Y" TO PASS. 이 코드는 불가능

           *> 무조건 상위 변수 아래에 선언되어야 한다.
           *> 코드 가독성이 증가하고 매직 넘버 제거, 조건 의미 명확화, 유지 보수하는데 장점이 있음
           STOP RUN.
       END PROGRAM 88-LEVEL.
