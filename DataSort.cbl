       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATA-SORT.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT SETTING-FILE ASSIGN TO "setting.dat"
         ORGANIZATION IS LINE SEQUENTIAL.

       SELECT SETTING-FILE-SORT ASSIGN TO "setting-out.dat"
         ORGANIZATION IS LINE SEQUENTIAL.

       SELECT SORT-WORK
         ASSIGN TO SORT-WORK-FILE.

       *> ==========================================

       *> 두번째 병합하기 위한 파일 입력
       SELECT MERGE-INPUT2-FILE ASSIGN TO "setting2.dat"
         ORGANIZATION IS LINE SEQUENTIAL.

       *> MERGE한 결과를 반환하기 위한 파일 입력
       SELECT MERGE-RESULT ASSIGN TO "settting-result.dat"
         ORGANIZATION IS LINE SEQUENTIAL.

       SELECT MERGE-FILE
         ASSIGN TO WORK-MERGE-FILE.

       DATA DIVISION.
       FILE SECTION.
       *> 정렬하기 위한 레코드 정보 입력
       FD SETTING-FILE.
       01 SETTING-RECORD.
         05 SETTING-ID         PIC 9(5).
         05 SETTING-NAME       PIC X(3).
         05 SETTING-VALUE      PIC X(5).

       *> 정렬 후 데이터를 내보내기 위한 레코드 정보 입력
       FD SETTING-FILE-SORT.
       01 SETTING-RECORD-SORT.
         05 SETTING-ID-SORT     PIC 9(5).
         05 SETTING-NAME-SORT   PIC X(3).
         05 SETTING-VALUE-SORT  PIC X(5).

       *> 정렬 작업에 사용하는 임시 파일
       SD SORT-WORK.
       01 SORT-RECORD.
         05 SORT-ID     PIC 9(5).
         05 SORT-NAME   PIC X(3).
         05 SORT-VALUE  PIC X(5).

       *> =============================

       FD MERGE-INPUT2-FILE.
       01 SETTING-INPUT2-RECORD.
         05 SETTING-INPUT2-ID    PIC 9(5).
         05 SETTING-INPUT2-NAME  PIC X(3).
         05 SETTING-INPUT2-VALUE PIC X(5).

       FD MERGE-RESULT.
       01 SETTING-RESULT-RECORD.
         05 SETTING-RESULT-ID    PIC 9(5).
         05 SETTING-RESULT-NAME  PIC X(3).
         05 SETTING-RESULT-VALUE PIC X(5).

       SD MERGE-FILE.
       01 MERGE-RECORD.
         05 MERGE-ID             PIC 9(5).
         05 MERGE-NAME           PIC X(3).
         05 MERGE-VALUE          PIC X(5).

       WORKING-STORAGE SECTION.
       01 EOF-FLAG     PIC X VALUE 'X'.
       01 FILE-STATUS  PIC XX.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
         *> 데이터를 정렬함 (정렬 기준을 이용하여 데이터를 정렬, 성능 측면에서 정렬 비용이 발생)
           SORT SORT-WORK
             ON ASCENDING KEY SETTING-ID   *> SETTING-ID를 기준으로 오름차순으로 정렬
             ON ASCENDING KEY SETTING-NAME *> 2순위로 SETTING-NAME을 기준으로 정렬
             USING SETTING-FILE
             GIVING SETTING-FILE-SORT

           *> 두 파일의 데이터를 하나의 파일로 병합함
           *> 이미 데이터는 정렬되어야 함 (병합 기준으로 데이터를 병합하며, 성능이 매우 빠름)
           MERGE MERGE-FILE
             ON ASCENDING KEY SETTING-ID
             ON ASCENDING KEY SETTING-NAME
             USING SETTING-FILE-SORT         *> 이전 정렬된 파일과 2번째 파일을 병합
                   MERGE-INPUT2-FILE
             GIVING MERGE-RESULT
           STOP RUN.
       END PROGRAM DATA-SORT.
