       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILE-TYPE.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       *> 파일을 순차적으로 읽어옴
       *> 급여 처리, 로그 파일, 대량 데이터 처리, 일괄 처리 시스템에 사용
       SELECT SETTING-FILE
         ASSIGN TO "SETTING.DAT"
         ORGANIZATION IS SEQUENTIAL.

       *> 가장 많이 사용하는 방식으로 Key를 이용해서 빠르게 검색 가능
       SELECT SETTING-FILE-INDEX
         ASSIGN TO "SETTING.DAT"
         ORGANIZATION IS INDEXED
         ACCESS MODE IS RANDOM
         RECORD KEY IS SETTING-KEY-INDEX.

       *> 배열과 같이 레코드 번호를 이용하여 접근하는 방식
       *> 레코드 별로 번호가 붙어있음
       SELECT SETTING-FILE-RELATIVE
         ASSIGN TO "SETTING.DAT"
         ORGANIZATION IS RELATIVE
         ACCESS MODE IS RANDOM
         RELATIVE KEY IS SETTING-ID-RELATIVE.

       DATA DIVISION.
       FILE SECTION.
       FD SETTING-FILE.
       01 SETTING-RECORD.
         05 SETTING-ID             PIC 9(3).
         05 SETTING-KEY            PIC X(10).
         05 SETTING-VALUE          PIC X(20).


       FD SETTING-FILE-INDEX.
       01 SETTING-RECORD-INDEX.
         05 SETTING-ID-INDEX       PIC 9(3).
         05 SETTING-KEY-INDEX      PIC X(10).
         05 SETTING-VALUE-INDEX    PIC X(20).


       FD SETTING-FILE-RELATIVE.
       01 SETTING-RECORD-RELATIVE.
         05 SETTING-ID-RELATIVE     PIC 9(3).
         05 SETTING-KEY-RELATIVE    PIC X(10).
         05 SETTING-VALUE-RELATIVE  PIC X(20).


       01 EOF-FLAG PIC X VALUE 'N'.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
           *> SETTING-FILE의 SECTION에 있는 SETTING.DAT 파일을 불러옴
           OPEN INPUT SETTING-FILE

           *> 파일의 끝을 만날 떄까지 반복
           PERFORM UNTIL EOF-FLAG = 'Y'
             READ SETTING-FILE
             *> 파일 읽기가 끝난 경우 중지
               AT END
                 MOVE 'Y' TO EOF-FLAG

               NOT AT END
                 DISPLAY "ID     : " SETTING-ID
                 DISPLAY "KEY    : " SETTING-KEY
                 DISPLAY "VALUE  : " SETTING-VALUE
                 DISPLAY "----------------"

           END-PERFORM

           CLOSE SETTING-FILE.
           STOP RUN.
       END PROGRAM FILE-TYPE.
