       *> Report Writer를 사용하면 제목, 본문, 소계, 총계, 페이지 번호 등을 관리할 수 있음
       *> GnuCOBOL에서는 미지원
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRINT-REPORT.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT SETTING-FILE ASSIGN TO "setting.dat"
         ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD SETTING-FILE.
       01 SETTING-RECORD.
         05 SETTING-ID         PIC 9(5).
         05 SETTING-NAME       PIC X(3).
         05 SETTING-VALUE      PIC X(5).

       WORKING-STORAGE SECTION.
       01 EOF-FLAG     PIC X VALUE 'X'.

       REPORT SECTION.
       RD SETTING-REPORT.
       01 PAGE-HEAD TYPE PAGE HEADING.             *> 페이지 맨 위에 출력
         05 COL 1 VALUE "SETTING VALUE".

       01 PAGE-LINE TYPE DETAIL.                   *> 레코드마다 반복
         05 COL 1  PIC 9(5) SOURCE SETTING-ID.
         05 COL 10 PIC X(3) SOURCE SETTING-NAME.
         05 COL 15 PIC X(20) SOURCE SETTING-VALUE.

       *>01 PAGE-FOOT  TYPE CONTROL FOOTING.       *> 그룹별 소계 (ex : 부서별 집계)
       01 PAGE-TOTAL TYPE REPORT FOOTING.          *> 최종 합계
         05 COL 1 VALUE "TOTAL COUNT : ".
         05 COL 20 COUNT PIC ZZ,ZZZ,ZZ9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN INPUT SETTING-FILE.

           *> 줄 바꿈이나 페이지 처리는 직접해야 하는 문제가 있음
           WRITE SETTING-RECORD AFTER ADVANCING 1 LINE.

           *> 보고서 시작
           INITIATE SETTING-REPORT.

           *> 레코드 출력
           PERFORM UNTIL EOF-FLAG = 'Y'
             READ SETTING-FILE
               AT END
                 MOVE 'Y' TO EOF-FLAG

               NOT AT END
                 GENERATE PAGE-LINE
             END-READ
           END-PERFORM

           TERMINATE SETTING-REPORT.
           CLOSE SETTING-FILE.
           STOP RUN.

       END PROGRAM PRINT-REPORT.
