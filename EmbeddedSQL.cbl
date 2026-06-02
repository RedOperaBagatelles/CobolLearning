       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMBEDDED-SQL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ID        PIC 9(5).
       01 WS-NAME      PIC X(30).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
         *> 일반적으로 DB 라이브러리 함수를 호출해야 하지만 SQL를 직접 작성할 수 있음
         EXEC SQL
           INSERT INTO MEMBER VALUES (1, "KIM")
         EXEC

         *> 한건의 데이터를 조회
         EXEC SQL
           SELECT WS-NAME
           INTO :WS-NAME       *> Host Variable : SQL의 결과를 변수에 저장하기 위해 사용
           FROM MEMBER         *> 데이터베이스 테이블 이름
           WHERE ID = :WS-ID
         END-EXEC

         MOVE 100 TO WS-ID.
         MOVE "SEO" TO WS-NAME.

         *> 데이터 베이스에 값 추가
         EXEC SQL
           INSERT INTO MEMBER
           VALUES (:WS-ID, :WS-NAME)
         END-EXEC

         *> 값 업데이트
         EXEC SQL
           UPDATE MEMBER
             SET NAME    = :NAME
           WHERE ID        = :WS-ID
         END-EXEC

         *> SQLCA : SQLCODE를 통해서 SQL 실행 결과를 알 수 있음
         *> 100은 해당 데이터베이스가 존재하지 않는 뜻
         IF SQLCODE = 100
           DISPLAY "MEMBER라는 데이터 베이스가 없음"
         END-IF

         IF SQLCODE < 0
           DISPLAY "데이터 베이스 오류"
         ELSE
           DISPLAY "데이터 불러오기 성공"
         END-IF

         *> 데이터가 KIM, LEE, PARK와 같이 여러 행인 경우 Cursor를 사용함
         EXEC SQL
           DECLARE C1 CURSOR FOR
           SELECT NAME
           FROM ARGUMENT-NUMBER
         END-EXEC

         *> 열기
         EXEC SQL
           OPEN C1
         END-EXEC

         *> 가져오기
         EXEC SQL
           FATCH C1
           INTO :WS-NAME
         EXEC SQL

         *> 닫기
         EXEC SQL
           CLOSE C1
         END-EXEC

         *> 변경 사항 적용
         EXEC SQL
           COMMIT
         END-EXEC

         *> 변경 취소
         EXEC SQL
           ROLLBACK
         END-EXEC

         STOP RUN.
       END PROGRAM EMBEDDED-SQL.
