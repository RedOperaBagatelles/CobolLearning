      * IDENTIFICATION DIVISION : 프로그램의 신원 정보를 작성하는 영역
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO_WORLD.  *> 프로그램 ID

      * ENVIRONMENT DIVISION : 어떤 환경에서 사용할지 정의 (파일, 장치, OS/메인 프레임, 입출력 연결)
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

      * DATA DIVISION : 데이터 (변수)를 정의 하는 영역
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NAME PIC A(20).     *> 문자열 20자리 변수
       01 WS-AGE PIC 99.         *> 숫자 2자리 변수

      * 실제 로직 (코드)이 작성되는 영역
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           MOVE "COBOL" TO WS-NAME.
           DISPLAY "HELLO WORLD " WS-NAME.
           STOP RUN.
       END PROGRAM HELLO_WORLD.
