       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILE-SECTION.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
         *> FD, SELECT는 파일 입출력을 정의할 때 사용함. 주로 순차 파일 등을 읽고 쓸때 사용
         *> SELECT는 프로그램에서 사용할 파일을 선택하고 연결할 때 사용
         *> SELECT 내부에서사용할이름 AASSIGN TO "연결할파일이름".
         SELECT SETTING-FILE ASSIGN TO "setting.dat"
           *> 옵션 값으로 SEQUENTIAL를 사용할 건지, INDEXED를 사용할 건지 지정할 수 있음
           ORGANIZATION IS SEQUENTIAL.

           *> ORGANIZATION IS INDEXED
           *> ACCESS MODE IS RANDOM
           *> RECORD KEY IS SETTING-ID.
       DATA DIVISION.
       *> 파일 레코드 구조를 정의하는 영역
       *> 파일 안에 데이터가 어떻게 저장되고 한 줄이 어떤 구조인지 정의
       FILE SECTION.
       *> FILE DESCRIPTION : 파일의 상세 구조를 설명하는 선언
       FD SETTING-FILE.
       01 SETTING-RECORD.  *> 파일 한 줄
         05 SETTING-ID     PIC 9(5).
         05 SETTING-VALUE  PIC X(20).
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN INPUT SETTING-FILE.

           READ SETTING-FILE
             AT END DISPLAY "EOF"
           END-READ.

           DISPLAY SETTING-ID.
           DISPLAY SETTING-VALUE.

           CLOSE SETTING-FILE.
           STOP RUN.
       END PROGRAM FILE-SECTION.
