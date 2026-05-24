       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILE-IO.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT SETTING-FILE ASSIGN TO "setting.dat"
         ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD SETTING-FILE.
       01 SETTING-RECORD.
         05 SETTING-ID     PIC 9(5).
         05 SETTING-VALUE  PIC X(20).
       WORKING-STORAGE SECTION.
       01 EOF-FLAG PIC X VALUE 'X'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           *> OPEN : 파일 열기 전에 반드시 열기 위한 키워드
           OPEN INPUT  SETTING-FILE.   *> 읽기 전용
           OPEN OUTPUT SETTING-FILE.   *> 새 파일 생성 (기존에 있는 파일은 제거)
           OPEN I-O    SETTING-FILE.   *> 읽기 + 쓰기
           OPEN EXTEND SETTING-FILE.   *> 기존 파일 끝에 추가 기록

           PERFORM UNTIL EOF-FLAG = 'Y'
           *> READ : 파일에서 레코드 한 건을 읽음
             READ SETTING-FILE
               AT END
                 MOVE 'Y' TO EOF-FLAG
               NOT AT END
                 DISPLAY SETTING-ID SETTING-VALUE
             END-READ
           END-PERFORM.

           *> 파일에는 00001HELLOWORD로 저장됨
           MOVE 00001 TO SETTING-ID
           MOVE "HELLO WORLD" TO SETTING-VALUE
           WRITE SETTING-RECORD

           *> 현재 파일에  00001HELLOWORLD 00002KIM 인경우
           *> 파일 편집하기 위해서 I-O로 설정
           *> READ 파일설명 → 값변경 → REWRITE 레코드 순으로 이루어짐
           OPEN I-O SETTING-FILE.
           READ SETTING-FILE.
           MOVE 00004 TO SETTING-ID.
           REWRITE SETTING-RECORD.     *> 00001HELLOWORLD → 00004HELLOWORLD

           *> 파일 버퍼를 정리하고 운영체제에 저장을 완료함
           CLOSE SETTING-FILE.

           STOP RUN.
       END PROGRAM FILE-IO.
