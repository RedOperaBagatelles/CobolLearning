       IDENTIFICATION DIVISION.
       PROGRAM-ID. MODULARIZATION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NAME PIC X(20) VALUE "KIM".

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           PERFORM DISPLAY-HELLO.
           PERFORM DISPLAY-BYE.

           *> SECTION 호출 방법
           PERFORM MAIN-SECTION.

           *> 다른 프로그램을 여는 기능
           *>CALL "88-LEVEL"

           *> 매개 변수를 통해서 다른 프로그램에 변수를 넘겨줄 수 있음
           *> GnuCOBOL에서는 -이나 _을 지원하지 않음
           CALL "CALLSUBPROGRAM" USING WS-NAME

           STOP RUN.

       *> SECTION : 여러개의 PARAGRAPH를 묶는 단위
       MAIN-SECTION SECTION.
           *> PARAGRAPH : 가장 작은 실행 단위 (함수와 비슷한 역할, 재사용 가능, 작은 작업 단위로 분리)
           DISPLAY-HELLO.
             DISPLAY "Hello world ".
             DISPLAY "COBOL.".

           DISPLAY-BYE.
               DISPLAY "Good Bye".
       END PROGRAM MODULARIZATION.
