       IDENTIFICATION DIVISION.
       PROGRAM-ID. Table-Handling.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       *> COBOL에서 일반적으로 OCCURS를 이용해서 배열을 만듬
       *> 배열 탐색용으로 특수 포인터가 있으며 내부 주소 기반으로 작동
       01 SCORES PIC 9(3) OCCURS 5 TIMES INDEXED BY IDX.

       *> 오름차순으로 만들기 위해 ASCENDING KEY가 필요 (ASCENDING은 무조건 하위에 있어야 함)
       01 SCORES-ACC OCCURS 5 TIMES
           ASCENDING KEY IS SCORE-ID
           INDEXED BY IDX-ACC.

         05 SCORE-ID PIC 9(3).

       *> SCORES에서 사용할 INDEX 변수
       01 SCORE-OUT-INDEX PIC 9 VALUES 1.

       *> SCORES에서 찾을 값
       01 FIND-TARGET PIC 999 VALUES 85.

       *> 배열 안에 배열을 만들어서 다차원 배열을 만들 수 있음
       01 MATRIX.
         05 ROW_ARR OCCURS 3 TIMES.
           10 COL_ARR PIC 9 OCCURS 3 TIMES.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           MOVE 35 TO SCORES(1).
           MOVE 49 TO SCORES(2).
           MOVE 77 TO SCORES(3).
           MOVE 85 TO SCORES(4).
           MOVE 100 TO SCORES(5).

           MOVE 35 TO SCORE-ID(1).
           MOVE 49 TO SCORE-ID(2).
           MOVE 77 TO SCORE-ID(3).
           MOVE 85 TO SCORE-ID(4).
           MOVE 100 TO SCORE-ID(5).

           *> OCCURS 배열 접근 방법
           MOVE 90 TO SCORES(1).
           DISPLAY SCORES(1).

           *> SCORES에 있는 배열 인덱스를 5번째로 이동 후 출력
           SET IDX TO 4.
           DISPLAY SCORES(IDX).

           *> 현재 인덱스에서 1만큼 상승
           SET IDX UP BY 1.
           DISPLAY SCORES(IDX).

           *> INDEX 방식 사용 이유 : 더 빠르고 SEARCH와 함께 사용 가능, 대형 테이블에서 효과적
           DISPLAY SCORES(SCORE-OUT-INDEX).  *> SUBSCRIPT 방식 : 외부 변수로 INDEX를 첩근
           DISPLAY SCORES(IDX).              *> INDEX 방식

           *> IDX를 1부터 순차적으로 1씩 증가하며 탐색
           SET IDX TO 1.
           SEARCH SCORES
             AT END
               DISPLAY "NOT FOUND"

             WHEN SCORES(IDX) = FIND-TARGET
               DISPLAY "FOUND " FIND-TARGET
           END-SEARCH.

           *> 이진 탐색을 이용하여 검색 (단, 오름차순 또는 내림차순으로 정렬되어야 함)
           SEARCh ALL SCORES-ACC
             AT END
               DISPLAY "NOT FOUND"

             WHEN SCORE-ID(IDX) = FIND-TARGET
               DISPLAY "FOUND " FIND-TARGET
           END-SEARCH.

           STOP RUN.
       END PROGRAM Table-Handling.
