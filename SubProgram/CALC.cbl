       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       *> 호출자가 전달한 데이터를 받기 위한 영역
       *> 여기에 할당된 변수는 실제 메모리를 할당하지 않음
       01 LK-A       PIC 999.
       01 LK-B       PIC 999.
       01 LK-RESULT  PIC 999.

       *> CALL에서 넘어오는 순서를 지정
       PROCEDURE DIVISION USING
         LK-A LK-B LK-RESULT.

           COMPUTE LK-RESULT = LK-A + LK-B

           *> 다시 기존 프로그램으로 돌어감
           *> 서브 프로그램은 return을 사용하지 않고, 전달 받은 변수로 반환
           GOBACK.
