       *> COBOL에서는 YYYYMMDD 형식의 날짜를 많이 사용함
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATE-HANDLING.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-DATE.
         05 WS-YEAR  PIC 9(4).
         05 WS-MONTH PIC 9(2).
         05 WS-DAY   PIC 9(2).

       01 WS-DATE2   PIC 9(8).

       01 WS-JULIAN-DATE PIC 9(7). *> YYYYDDD 형식으로 DDD는 해당 연도의 몇 번째 날인지 표시

       01 WS-DATE-DAY    PIC 9(8).
       01 WS-PLUS-30DAY  PIC 9(8).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           *> 오늘 날짜를 가져옴
           ACCEPT WS-DATE2 FROM DATE YYYYMMDD.
           DISPLAY WS-DATE2.

           *> Julian Date로 표시 (날짜 계산이 쉽기 때문에 사용)
           ACCEPT WS-JULIAN-DATE FROM DAY YYYYDDD.
           DISPLAY WS-JULIAN-DATE.

           *> 전통 COBOL에서는 Julian Date로 변환 후 계산, 현대 COBOL은 FUNCTION INTEGER-OF-DATE, FUNCTION DATE-OF-INTEGER 사용
           *> WS-DATE-DIFF : 날짜를 정수로 변환 (특정 기준일로부터 경과일수)
           COMPUTE WS-DATE-DAY = FUNCTION INTEGER-OF-DATE(WS-DATE2) + 30.
           COMPUTE WS-PLUS-30DAY = FUNCTION DATE-OF-INTEGER(WS-DATE-DAY).
           DISPLAY WS-PLUS-30DAY.

           *> 컴파일 날짜를 표시
           DISPLAY "컴파일 날짜 : " WHEN-COMPILED.

           *> 현재 날짜와 시간을 보여줌. (1/100초 까지 출력)
           DISPLAY FUNCTION CURRENT-DATE.

           STOP RUN.

       END PROGRAM DATE-HANDLING.
