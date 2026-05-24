       IDENTIFICATION DIVISION.
       PROGRAM-ID. EOF-FILE-STATUS.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT SETTING-FILE ASSIGN TO "setting.dat"
         ORGANIZATION IS SEQUENTIAL
         FILE STATUS IS FILE-STATUS. *> 파일 처리 결과를 가져옴 (두 자리 숫자로 가져옴)

       DATA DIVISION.
       FILE SECTION.
       FD SETTING-FILE.
       01 SETTING-RECORD.
         05 SETTING-ID     PIC 9(5).
         05 SETTING-VALUE  PIC X(20).
       WORKING-STORAGE SECTION.
       01 EOF-FLAG     PIC X VALUE 'X'.
       01 FILE-STATUS  PIC XX.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN INPUT SETTING-FILE.

           *> 마지막 레코드를 읽고 나서 또 읽으려고 하면 EOF가 발생
           *> READ SETTING-FILE.
           *> DISPLAY FILE-STATUS.

           *> 파일 상태 코드
           *> 00 : 정상, 10 : EOF, 35 : 파일 없음, 37 : OPEN 오류

           PERFORM UNTIL EOF-FLAG = 'Y'
             READ SETTING-FILE
               *> AT END는 파일의 끝을 읽었을 때 실행되는 영역 (간단한 방법)
               AT END
                 MOVE 'Y' TO EOF-FLAG
                 DISPLAY "No more data to read."
             END-READ
           END-PERFORM.

           PERFORM UNTIL EOF-FLAG = 'Y'
             READ SETTING-FILE

             *> FILE-STATUS를 통해서 EOF를 확인할 수 있음. (EOF 외의 다양한 오류 확인도 가능)
             IF FILE-STATUS = "10"
               MOVE 'Y' TO EOF-FLAG
               DISPLAY "No more data to read."
             END-IF
           END-PERFORM

           CLOSE SETTING-FILE.

           STOP RUN.
       END PROGRAM EOF-FILE-STATUS.
