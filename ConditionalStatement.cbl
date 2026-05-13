       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONDITIONAL-STATEMENT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SCORE  PIC 99 VALUE 50.
       01 PEOPLE PIC 99 VALUE 10.
       01 I      PIC 99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           *> 조건 문은 IF로 시작하여 END-IF로 종료
           IF SCORE >= 60
             DISPLAY "PASS"

           ELSE
             DISPLAY "FAIL"

           END-IF

           *> AND, OR, NOT, =, >, <, >=, <=를 사용하여 다중 조건 가능
           IF SCORE >= 50 AND SCORE < 60
             DISPLAY "F"

           END-IF

           *> 값이 같은지 확인할 때는 = 기호를 사용함 =
           IF SCORE = 50
             DISPLAY "MID"

           END-IF

           *> 영어와 같은 방식을 사용하여 조건 문을 지정할 수 있음
           IF SCORE IS GREATER THAN 30
             DISPLAY "SCORE IS GREATER THEN 30"

           END-IF

           *> EVALUATE를 이용하여 switch와 같은 효가를 낼 수 있음
           EVALUATE SCORE
             WHEN 100 THRU 90
               DISPLAY "A"

             WHEN 90 THRU 80
               DISPLAY "B"

             WHEN 80 THRU 70
               DISPLAY "C"

             WHEN OTHER
               DISPLAY "F"
           END-EVALUATE

           *> c언어의 switch와 달리 다중 변수로 case를 나눌 수 있음
           *> (WHEN 첫번째 비교 ALSO 두번째 값 비교 ALSO ...)
           EVALUATE SCORE ALSO PEOPLE
             WHEN >= 20 ALSO < 40
               DISPLAY "MATCH 1"

             WHEN >= 100 ALSO < 20
               DISPLAY "MATCH 2"

             WHEN OTHER
               DISPLAY "NO"
           END-EVALUATE

           *> 반복은 PERFORM으로 사용하며 for, while 문과 같은 기능을 함
           PERFORM 5 TIMES
             DISPLAY "HELLO"
           END-PERFORM

           *> UNTIL을 사용하면 while과 같은 효과를 만들 수 있음 (조건이 만족하지 않을 때까지 반복)
           PERFORM UNTIL SCORE <= 0
              DISPLAY SCORE
              SUBTRACT 1 FROM SCORE
           END-PERFORM

           *> do while 처럼 처음에 true이여도 한번 실행함
           PERFORM WITH TEST AFTER UNTIL PEOPLE >= 10
             DISPLAY PEOPLE
             ADD 1 TO PEOPLE
           END-PERFORM

           *> for 문과 같은 기능 [for (int i = 1; i < 10; i++)]
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
             DISPLAY I
           END-PERFORM

           STOP RUN.
       END PROGRAM CONDITIONAL-STATEMENT.
