       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONVERT-STRING.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-RESULT1       PIC X(20).
       01 WS-RESULT2       PIC X(20).
       01 WS-RESULT3       PIC X(20).
       01 WS-RESULT4       PIC X(20).
       01 WS-RESULT5       PIC X(20).

       01 I-RESULT1        PIC 999.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
       *> 문자열을 합칠때 사용
       STRING
           "NAME: " DELIMITED BY SPACE   *> 공백 전까지 사용
           "KIM"
           ", AGE : "
           "20" DELIMITED BY SIZE        *> 전체 문자열 사용
           INTO WS-RESULT1
       END-STRING

       DISPLAY WS-RESULT1.

       MOVE "SHOW ME THE MONEY" TO WS-RESULT5.

       *> 문자열을 특징 구분자로 분리해주는 키워드
       UNSTRING WS-RESULT5
           DELIMITED BY ' ' OR 'O' *> 여러 구분자도 가능
           INTO WS-RESULT1
                WS-RESULT2
                WS-RESULT3
                WS-RESULT4
       END-UNSTRING

       DISPLAY WS-RESULT1.
       DISPLAY WS-RESULT2.
       DISPLAY WS-RESULT3.
       DISPLAY WS-RESULT4.

       MOVE "HELLO WORLD" TO WS-RESULT1
       MOVE "  HELLO WORLD" TO WS-RESULT2

       *> 문자열을 조사하거나 수정할 때 사용
       INSPECT WS-RESULT1
           *> 특정 키워드를 첮아 개수를 카운팅하는 키워드
           TALLYING I-RESULT1 FOR ALL 'O'
           *> R이 나오기 전까지 처리
           BEFORE INITIAL 'R'

       DISPLAY I-RESULT1.


       INSPECT WS-RESULT1
           *> 특정 키워드를 다른 키워드로 바꿔줌
           REPLACING ALL 'O' BY 'P'

       DISPLAY WS-RESULT1.

       INSPECT WS-RESULT2
           *> 앞에 공백를 _로 교체
           REPLACING LEADING SPACE BY '_'

       DISPLAY WS-RESULT2.

       STOP RUN.
       END PROGRAM CONVERT-STRING.
