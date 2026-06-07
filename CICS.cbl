       IDENTIFICATION DIVISION.
       PROGRAM-ID. CICS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
         *> CICS (Customer Information Control System) : IBM의 온라인 트랜잭션 처리 모니터
         *>     - COBOL 프로그램을 실행키거나, 여러 사용자의 요청을 관리, 데이터 베이스 접근, 터미널과 통신과 같은 중간 관리자 역할

         *> 온라인 트랜잭션 : 사용자가 입력한 요청을 즉시 처리하는 방식
         *>     - 예) 은행 계좌 조회, ATM 출금, 카드 승인, 항공권 예약

         *> Batch vs 온라인 처리
         *>     - Batch : 데이터 모음 → 밤에 일괄 처리 → 결과 생성
         *>     - 온라인 처리 : 한 건 입력 → 즉시 처리 → 즉시 결과

         *> 트랜잭션 (Transaction)
         *>     - 하나의 업무 단위
         *>     - 여러 거래를 한번에 실행 중 하나가 장애를 일으키면 둘 다 취소가 되고 모두 성공해야 성공으로 해야 함

         *> 터미널 처리 : 사용자가 접속하는 화면 장치
         *>     - 과거에는 3270 단말기이며 현재는 에뮬레이터로 사용
         *>     - 사용자 정보 입력 → CICS → COBOL 프로그램 → 조회 → 결과 표시

         *> COBOL에서의 터미널 처리
         *>     - COBOL에서는 DISPLAY "이름?" ACCEPT WS-NAME처럼 콘솔 입출력을 이용
         *>     - CICS에서는 EXEC CICS RECEIVE MAP("CUSMAP") END-EXEC.처럼 CICS 명령을 이용

         *> MAP : CICS는 MAP이라는 정의 파일을 사용
         *>     - COBOL에서는 이 MAP과 데이터를 주고 받음
         *>     - CICS 프로그램의 기본 흐름 (사용자 화면 → RECEIVE MAP → 입력 데이터 획득 → VSAM / DB2 조회 → 결과 저장 → SEND MAP → 화면 출력

       END PROGRAM CICS.
